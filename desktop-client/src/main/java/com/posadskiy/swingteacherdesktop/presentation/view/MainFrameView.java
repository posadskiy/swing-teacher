package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.application.service.AuthenticationService;
import com.posadskiy.swingteacherdesktop.domain.model.*;
import com.posadskiy.swingteacherdesktop.infrastructure.state.AppState;
import com.posadskiy.swingteacherdesktop.presentation.component.*;
import com.posadskiy.swingteacherdesktop.presentation.controller.MainFrameController;
import com.posadskiy.swingteacherdesktop.presentation.controller.PopupController;
import com.posadskiy.swingteacherdesktop.presentation.model.ComboBoxModel;
import com.posadskiy.swingteacherdesktop.presentation.navigation.AppNavigator;
import lombok.extern.slf4j.Slf4j;
import org.fife.ui.autocomplete.AutoCompletion;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.util.*;
import java.util.List;

/**
 * Modern main application frame with task management.
 * Uses dark theme UI components for consistent styling.
 */
@Slf4j
@Lazy
@Component
public class MainFrameView extends JFrame {

    private final AppState appState;
    private final MainFrameController controller;
    private final PopupController popupController;
    private final AppNavigator navigator;
    private final AuthenticationService authService;
    
    private int taskCategory = 1;
    
    // UI Components
    private ModernComboBox<Lesson> lessonComboBox;
    private ModernComboBox<Task> taskComboBox;
    private LanguageSelector languageSelector;
    private ModernEditorPane questionPane;
    private ModernEditorPane documentationPane;
    private CodeEditorPanel codeEditorPanel;
    private ModernButton showSolutionButton;
    private ModernButton viewButton;
    private ModernButton checkButton;
    private ModernButton prevTaskButton;
    private ModernButton nextTaskButton;
    private ProgressBar progressBar;
    private JLabel taskCounterLabel;
    
    // Data
    private User currentUser;
    private List<Task> tasks = List.of();
    private List<Lesson> lessons = List.of();
    private final Set<Integer> completedTaskIds = new HashSet<>();

    public MainFrameView(
        MainFrameController controller,
        PopupController popupController,
        AppState appState,
        AppNavigator navigator,
        AuthenticationService authService
    ) {
        this.controller = controller;
        this.popupController = popupController;
        this.appState = appState;
        this.navigator = navigator;
        this.authService = authService;
        initComponents();
    }

    public void initComponents() {
        currentUser = appState.getCurrentUser();

        // Initialize language selector with user's preference
        String initialLanguage = currentUser != null && currentUser.preferredLanguage() != null
            ? currentUser.getPreferredLanguageOrDefault()
            : appState.getCurrentLanguage();
        appState.setCurrentLanguage(initialLanguage);
        
        loadInitialData();
        
        configureFrame();
        setJMenuBar(createMenuBar());
        setContentPane(createMainContent());

        // Set language selector after UI is created
        SwingUtilities.invokeLater(() -> {
            if (languageSelector != null) {
                languageSelector.setSelectedLanguage(appState.getCurrentLanguage());
            }
        });
    }

    private void configureFrame() {
        setTitle("SwingTeacher Desktop");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(1200, 700));
        setLocationRelativeTo(null);
        setExtendedState(JFrame.MAXIMIZED_BOTH);

        System.setProperty("awt.useSystemAAFontSettings", "on");
        System.setProperty("swing.aatext", "true");
    }
    
    private void loadInitialData() {
        if (currentUser == null || currentUser.id() == null) {
            return;
        }
        
        try {
            String languageCode = appState.getCurrentLanguage();
            lessons = Optional.ofNullable(controller.getLessonsByCategory(taskCategory, languageCode))
                .orElse(List.of());
            
            if (!lessons.isEmpty() && lessons.getFirst().id() != null) {
                tasks = Optional.ofNullable(lessons.getFirst().tasks()).orElse(List.of());
            }

            var completedTasks = controller.getCompletedTasksByUser(currentUser.id());
            completedTasks.stream()
                .map(CompletedTask::taskId)
                .filter(Objects::nonNull)
                .forEach(completedTaskIds::add);
        } catch (Exception e) {
            log.warn("Failed to load initial data", e);
        }
    }

    private void onLanguageChanged(String languageCode) {
        log.debug("Language changed to: {}", languageCode);
        appState.setCurrentLanguage(languageCode);
        controller.setPreferredLanguage(languageCode);

        // Reload lessons and tasks with new language
        reloadLessonsAndTasks();
    }

    private void reloadLessonsAndTasks() {
        if (currentUser == null || currentUser.id() == null) {
            return;
        }

        try {
            String languageCode = appState.getCurrentLanguage();
            lessons = Optional.ofNullable(controller.getLessonsByCategory(taskCategory, languageCode))
                .orElse(List.of());

            // Update lesson combo box
            lessonComboBox.removeAllItems();
            lessons.forEach(lessonComboBox::addItem);

            // Update tasks if a lesson is selected
            int selectedIndex = lessonComboBox.getSelectedIndex();
            if (selectedIndex >= 0 && selectedIndex < lessons.size()) {
                tasks = Optional.ofNullable(lessons.get(selectedIndex).tasks()).orElse(List.of());
                taskComboBox.removeAllItems();
                tasks.forEach(taskComboBox::addItem);
            } else {
                tasks = List.of();
                taskComboBox.removeAllItems();
            }

            updateQuestion();
            updateDocumentation();
            updateTaskCounter();
            updateProgress();
            updateNavigationButtons();
        } catch (Exception e) {
            log.warn("Failed to reload lessons and tasks", e);
        }
    }

    // MARK: - Menu Bar

    private JMenuBar createMenuBar() {
        ModernMenuBar menuBar = new ModernMenuBar();

        // Settings menu
        JMenu settingsMenu = ModernMenuBar.createMenu("Settings");

        JMenuItem logoutItem = ModernMenuBar.createMenuItem("Logout");
        logoutItem.addActionListener(e -> logout());
        settingsMenu.add(logoutItem);

        settingsMenu.add(ModernMenuBar.createSeparator());

        JMenuItem exitItem = ModernMenuBar.createMenuItem("Exit");
        exitItem.addActionListener(e -> System.exit(0));
        settingsMenu.add(exitItem);

        menuBar.add(settingsMenu);

        // Help menu
        JMenu helpMenu = ModernMenuBar.createMenu("Help");
        
        JMenuItem docsItem = ModernMenuBar.createMenuItem("Documentation");
        docsItem.addActionListener(e -> showDocumentation());
        helpMenu.add(docsItem);
        
        JMenuItem aboutItem = ModernMenuBar.createMenuItem("About");
        aboutItem.addActionListener(e -> showAbout());
        helpMenu.add(aboutItem);

        menuBar.add(helpMenu);

        return menuBar;
    }

    // MARK: - Main Content

    private JPanel createMainContent() {
        GradientPanel mainPanel = new GradientPanel(new BorderLayout(16, 16));
        mainPanel.setBorder(new EmptyBorder(16, 16, 16, 16));

        // Top toolbar
        mainPanel.add(createToolbar(), BorderLayout.NORTH);

        // Center split pane
        mainPanel.add(createCenterContent(), BorderLayout.CENTER);

        return mainPanel;
    }

    private JPanel createToolbar() {
        JPanel toolbar = new JPanel(new GridBagLayout());
        toolbar.setOpaque(false);
        toolbar.setBorder(new EmptyBorder(0, 0, 12, 0));

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.insets = new Insets(0, 0, 0, 8);

        // Lesson label
        gbc.gridx = 0;
        gbc.weightx = 0;
        toolbar.add(createLabel("Lesson:"), gbc);

        // Lesson combo - 40%
        gbc.gridx = 1;
        gbc.weightx = 0.4;
        lessonComboBox = new ModernComboBox<>(new ComboBoxModel<>(new ArrayList<>(lessons)));
        lessonComboBox.setPreferredSize(new Dimension(0, 40));
        lessonComboBox.addActionListener(e -> onLessonChanged());
        toolbar.add(lessonComboBox, gbc);

        // Spacer
        gbc.gridx = 2;
        gbc.weightx = 0;
        gbc.insets = new Insets(0, 16, 0, 8);
        toolbar.add(createLabel("Task:"), gbc);

        // Task combo - 40%
        gbc.gridx = 3;
        gbc.weightx = 0.4;
        gbc.insets = new Insets(0, 0, 0, 8);
        taskComboBox = new ModernComboBox<>(new ComboBoxModel<>(new ArrayList<>(tasks)));
        taskComboBox.setPreferredSize(new Dimension(0, 40));
        taskComboBox.setRenderer(new TaskCellRenderer());
        taskComboBox.addActionListener(e -> onTaskChanged());
        toolbar.add(taskComboBox, gbc);

        // Task counter
        gbc.gridx = 4;
        gbc.weightx = 0;
        gbc.insets = new Insets(0, 8, 0, 0);
        taskCounterLabel = new JLabel();
        taskCounterLabel.setFont(UITheme.getFont(Font.PLAIN, 12));
        taskCounterLabel.setForeground(UITheme.TEXT_SECONDARY);
        updateTaskCounter();
        toolbar.add(taskCounterLabel, gbc);

        // Progress bar
        gbc.gridx = 5;
        gbc.weightx = 0.2;
        gbc.insets = new Insets(0, 16, 0, 0);
        progressBar = new ProgressBar();
        progressBar.setPreferredSize(new Dimension(0, 6));
        updateProgress();
        toolbar.add(progressBar, gbc);

        // Language selector
        gbc.gridx = 6;
        gbc.weightx = 0;
        gbc.insets = new Insets(0, 16, 0, 0);
        languageSelector = new LanguageSelector(appState.getCurrentLanguage());
        languageSelector.setPreferredSize(new Dimension(120, 40));
        languageSelector.setOnLanguageChanged(this::onLanguageChanged);
        toolbar.add(languageSelector, gbc);

        return toolbar;
    }

    private JLabel createLabel(String text) {
        JLabel label = new JLabel(text);
        label.setFont(UITheme.getFont(Font.BOLD, 14));
        label.setForeground(UITheme.TEXT_PRIMARY);
        return label;
    }

    private ModernSplitPane createCenterContent() {
        // Left side: Documentation
        JPanel leftPanel = createDocumentationPanel();

        // Right side: Task & Answer
        JPanel rightPanel = createTaskPanel();

        ModernSplitPane splitPane = new ModernSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);
        splitPane.setResizeWeight(0.5);
        splitPane.setContinuousLayout(true);
        
        // Set divider location to 50% after component is shown to ensure equal split
        SwingUtilities.invokeLater(() -> {
            int totalWidth = splitPane.getWidth();
            if (totalWidth > 0) {
                splitPane.setDividerLocation(totalWidth / 2);
            } else {
                splitPane.setDividerLocation(0.5);
            }
        });
        
        return splitPane;
    }

    private JPanel createDocumentationPanel() {
        JPanel panel = new JPanel(new BorderLayout(0, 12));
        panel.setOpaque(false);

        SectionTitle title = new SectionTitle("Documentation", "📚");
        panel.add(title, BorderLayout.NORTH);

        documentationPane = new ModernEditorPane();
        updateDocumentation();
        
        ModernScrollPane scrollPane = new ModernScrollPane(documentationPane);
        panel.add(scrollPane, BorderLayout.CENTER);

        return panel;
    }

    private JPanel createTaskPanel() {
        JPanel panel = new JPanel(new BorderLayout(0, 16));
        panel.setOpaque(false);

        // Question section
        JPanel questionSection = new JPanel(new BorderLayout(0, 8));
        questionSection.setOpaque(false);
        questionSection.add(new SectionTitle("Task", "📝"), BorderLayout.NORTH);
        questionSection.add(new Divider(), BorderLayout.SOUTH);
        
        questionPane = new ModernEditorPane();
        updateQuestion();
        
        ModernScrollPane questionScroll = new ModernScrollPane(questionPane);
        questionSection.add(questionScroll, BorderLayout.CENTER);

        // Answer section with buttons
        JPanel answerSection = new JPanel(new BorderLayout(0, 12));
        answerSection.setOpaque(false);
        answerSection.setBorder(new EmptyBorder(8, 0, 0, 0));
        answerSection.add(new SectionTitle("Solution", "💻"), BorderLayout.NORTH);

        codeEditorPanel = new CodeEditorPanel();
        setupAutoCompletion();

        answerSection.add(codeEditorPanel, BorderLayout.CENTER);
        answerSection.add(createButtonPanel(), BorderLayout.SOUTH);

        // Vertical split with modern styling
        ModernSplitPane verticalSplit = new ModernSplitPane(JSplitPane.VERTICAL_SPLIT, questionSection, answerSection);
        verticalSplit.setResizeWeight(0.3);
        SwingUtilities.invokeLater(() -> verticalSplit.setDividerLocation(0.3));

        panel.add(verticalSplit, BorderLayout.CENTER);
        return panel;
    }


    private JPanel createButtonPanel() {
        JPanel panel = new JPanel(new BorderLayout(0, 0));
        panel.setOpaque(false);
        panel.setBorder(new EmptyBorder(8, 0, 0, 0));

        // Navigation buttons on the left
        JPanel navPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 8, 0));
        navPanel.setOpaque(false);

        prevTaskButton = ModernButton.secondary("◀ Previous");
        prevTaskButton.setPreferredSize(new Dimension(120, 44));
        prevTaskButton.setToolTipText("Previous task (Ctrl+Left)");
        prevTaskButton.addActionListener(e -> onPreviousTask());
        navPanel.add(prevTaskButton);

        nextTaskButton = ModernButton.secondary("Next ▶");
        nextTaskButton.setPreferredSize(new Dimension(120, 44));
        nextTaskButton.setToolTipText("Next task (Ctrl+Right)");
        nextTaskButton.addActionListener(e -> onNextTask());
        navPanel.add(nextTaskButton);

        // Action buttons on the right
        JPanel actionPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
        actionPanel.setOpaque(false);

        showSolutionButton = ModernButton.secondary("Show Solution");
        showSolutionButton.setPreferredSize(new Dimension(160, 44));
        showSolutionButton.setToolTipText("Show solution (Ctrl+S)");
        showSolutionButton.addActionListener(e -> onShowSolutionClick());
        actionPanel.add(showSolutionButton);

        viewButton = ModernButton.secondary("Run Code");
        viewButton.setPreferredSize(new Dimension(140, 44));
        viewButton.setToolTipText("Run code (Ctrl+R)");
        viewButton.addActionListener(e -> onViewClick());
        actionPanel.add(viewButton);

        checkButton = ModernButton.primary("Submit Answer");
        checkButton.setPreferredSize(new Dimension(160, 44));
        checkButton.setToolTipText("Submit answer (Ctrl+Enter)");
        checkButton.addActionListener(e -> onCheckClick());
        actionPanel.add(checkButton);

        panel.add(navPanel, BorderLayout.WEST);
        panel.add(actionPanel, BorderLayout.EAST);

        setupKeyboardShortcuts();
        updateNavigationButtons();

        return panel;
    }

    private void setupAutoCompletion() {
        var provider = controller.createCompletionProvider();
        var ac = new AutoCompletion(provider);
        ac.install(codeEditorPanel.getTextArea());
    }

    private void setupKeyboardShortcuts() {
        // Ctrl+Left: Previous task
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW)
            .put(KeyStroke.getKeyStroke("ctrl LEFT"), "prevTask");
        getRootPane().getActionMap().put("prevTask", new AbstractAction() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent e) {
                onPreviousTask();
            }
        });

        // Ctrl+Right: Next task
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW)
            .put(KeyStroke.getKeyStroke("ctrl RIGHT"), "nextTask");
        getRootPane().getActionMap().put("nextTask", new AbstractAction() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent e) {
                onNextTask();
            }
        });

        // Ctrl+S: Show solution
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW)
            .put(KeyStroke.getKeyStroke("ctrl S"), "showSolution");
        getRootPane().getActionMap().put("showSolution", new AbstractAction() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent e) {
                onShowSolutionClick();
            }
        });

        // Ctrl+R: Run code
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW)
            .put(KeyStroke.getKeyStroke("ctrl R"), "runCode");
        getRootPane().getActionMap().put("runCode", new AbstractAction() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent e) {
                onViewClick();
            }
        });

        // Ctrl+Enter: Submit answer
        getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW)
            .put(KeyStroke.getKeyStroke("ctrl ENTER"), "submitAnswer");
        getRootPane().getActionMap().put("submitAnswer", new AbstractAction() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent e) {
                onCheckClick();
            }
        });
    }

    private void onPreviousTask() {
        int currentIndex = taskComboBox.getSelectedIndex();
        if (currentIndex > 0) {
            taskComboBox.setSelectedIndex(currentIndex - 1);
        }
    }

    private void onNextTask() {
        int currentIndex = taskComboBox.getSelectedIndex();
        if (currentIndex < taskComboBox.getItemCount() - 1) {
            taskComboBox.setSelectedIndex(currentIndex + 1);
        }
    }

    private void updateNavigationButtons() {
        int currentIndex = taskComboBox.getSelectedIndex();
        prevTaskButton.setEnabled(currentIndex > 0);
        nextTaskButton.setEnabled(currentIndex < taskComboBox.getItemCount() - 1);
    }

    private void updateTaskCounter() {
        int currentIndex = taskComboBox.getSelectedIndex();
        int total = taskComboBox.getItemCount();
        if (total > 0) {
            taskCounterLabel.setText(String.format("Task %d of %d", currentIndex + 1, total));
        } else {
            taskCounterLabel.setText("");
        }
    }

    private void updateProgress() {
        int total = tasks.size();
        int completed = (int) tasks.stream()
            .filter(t -> completedTaskIds.contains(t.id()))
            .count();

        if (total > 0) {
            int progress = (completed * 100) / total;
            progressBar.setProgress(progress);
        } else {
            progressBar.setProgress(0);
        }
    }

    // MARK: - Event Handlers

    private void onLessonChanged() {
        int selectedIndex = lessonComboBox.getSelectedIndex();
        
        tasks = (selectedIndex >= 0 && selectedIndex < lessons.size())
            ? Optional.ofNullable(lessons.get(selectedIndex).tasks()).orElse(List.of())
            : List.of();

        taskComboBox.removeAllItems();
        tasks.forEach(taskComboBox::addItem);
        
        updateQuestion();
        updateDocumentation();
        updateTaskCounter();
        updateProgress();
        updateNavigationButtons();
    }

    private void onTaskChanged() {
        updateQuestion();
        updateDocumentation();
        updateTaskCounter();
        updateNavigationButtons();
    }

    private void updateQuestion() {
        Task task = (Task) taskComboBox.getSelectedItem();
        String text = task != null ? task.question() : "<p>Select a task to begin</p>";
        questionPane.setText(text);
    }

    private void updateDocumentation() {
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task != null) {
            var doc = controller.getDocumentation(task.idDocumentation());
            String text = doc.map(Documentation::text).orElse("<p>Documentation not available</p>");
            documentationPane.setText(text);
        } else {
            documentationPane.setText("<p>Select a task to view documentation</p>");
        }
    }

    private void onShowSolutionClick() {
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task == null) {
            popupController.showError("Please select a task first!");
            return;
        }
        
        String solution = task.solution();
        if (solution == null || solution.isBlank()) {
            popupController.showError("No solution available for this task.");
            return;
        }
        
        // Ask for confirmation before showing solution
        int result = JOptionPane.showConfirmDialog(
            this,
            "Are you sure you want to see the solution?\nThis will replace your current code.",
            "Show Solution",
            JOptionPane.YES_NO_OPTION,
            JOptionPane.QUESTION_MESSAGE
        );
        
        if (result == JOptionPane.YES_OPTION) {
            codeEditorPanel.setText(solution);
        }
    }

    private void onViewClick() {
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task == null) {
            popupController.showError("Please select a task first!");
            return;
        }

        viewButton.setLoading(true);

        new SwingWorker<Void, Void>() {
            @Override
            protected Void doInBackground() {
                String imports = Optional.ofNullable(task).map(Task::imports).orElse("");
                controller.runUserCode(codeEditorPanel.getText(), imports);
                return null;
            }

            @Override
            protected void done() {
                viewButton.setLoading(false);
            }
        }.execute();
    }

    private void onCheckClick() {
        if (taskComboBox.getItemCount() == 0) {
            popupController.showError("Please select a task first!");
            return;
        }
        
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task == null) {
            popupController.showError("Please select a task!");
            return;
        }
        
        if (controller.isTaskCompleted(currentUser.id(), task.id())) {
            popupController.showError("Task already completed!");
            return;
        }

        checkButton.setLoading(true);

        new SwingWorker<Boolean, Void>() {
            private String errorMessage;
            private String errorTitle;

            @Override
            protected Boolean doInBackground() {
                // Compile check
                String errors = controller.compileUserCode(codeEditorPanel.getText(), task.imports());
                if (errors != null && !errors.isEmpty()) {
                    errorMessage = errors;
                    errorTitle = "Compilation Error";
                    return false;
                }

                // Validation check
                errors = controller.validateAnswer(task.answer(), codeEditorPanel.getText());
                if (errors != null && !errors.isEmpty()) {
                    errorMessage = errors;
                    errorTitle = "Execution Error";
                    return false;
                }

                return true;
            }

            @Override
            protected void done() {
                checkButton.setLoading(false);
                try {
                    if (get()) {
                        // Success!
                        controller.markTaskCompleted(currentUser.id(), task.id());
                        completedTaskIds.add(task.id());
                        taskComboBox.repaint();

                        codeEditorPanel.setText("");
                        popupController.showSuccess("Correct! Great job!");
                        updateProgress();

                        // Move to next task
                        if (taskComboBox.getItemCount() > taskComboBox.getSelectedIndex() + 1) {
                            taskComboBox.setSelectedIndex(taskComboBox.getSelectedIndex() + 1);
                        }
                    } else {
                        popupController.showMessage(errorMessage, errorTitle);
                    }
                } catch (Exception e) {
                    log.error("Error checking task", e);
                    popupController.showError("An error occurred. Please try again.");
                }
            }
        }.execute();
    }

    // MARK: - Menu Actions

    private void logout() {
        authService.logout();
        appState.clearUser();
        setVisible(false);
        navigator.showAuth();
    }

    private void showDocumentation() {
            var doc = controller.getDocumentation(0);
        String docText = doc.map(Documentation::text)
                .filter(t -> !t.isBlank())
                .orElse("<h1>Documentation</h1><p>Documentation is not available.</p>");

        showDialog("Documentation", docText, 900, 700);
    }

    private void showAbout() {
        String aboutText = """
            <div style="text-align: center; padding: 20px;">
            <h1>SwingTeacher Desktop</h1>
                <p style="color: #94a3b8;">Version 1.0-SNAPSHOT</p>
                <hr>
                <p>An interactive Java programming learning application.</p>
                <h3>Features</h3>
                <ul style="text-align: left;">
                    <li>Syntax-highlighted code editor</li>
                    <li>Intelligent code completion</li>
            <li>Task-based learning system</li>
            <li>Progress tracking</li>
            <li>Reference documentation</li>
            </ul>
            <hr>
                <p style="color: #64748b; font-size: 12px;">Built with Java & Spring Framework</p>
            </div>
            """;
        showDialog("About SwingTeacher", aboutText, 500, 450);
    }

    private void showDialog(String title, String content, int width, int height) {
        JDialog dialog = new JDialog(this, title, true);
        dialog.setSize(width, height);
        dialog.setLocationRelativeTo(this);

        GradientPanel panel = new GradientPanel(new BorderLayout(0, 16));
        panel.setBorder(new EmptyBorder(16, 16, 16, 16));

        ModernEditorPane editorPane = new ModernEditorPane(content);
        ModernScrollPane scrollPane = new ModernScrollPane(editorPane);
        panel.add(scrollPane, BorderLayout.CENTER);

        ModernButton closeButton = ModernButton.primary("Close");
        closeButton.setPreferredSize(new Dimension(100, 40));
        closeButton.addActionListener(e -> dialog.dispose());
        
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        buttonPanel.setOpaque(false);
        buttonPanel.add(closeButton);
        panel.add(buttonPanel, BorderLayout.SOUTH);

        dialog.setContentPane(panel);
        dialog.setVisible(true);
    }

    // MARK: - Task Cell Renderer

    public JComboBox<Task> getTaskComboBox() {
        return taskComboBox;
    }

    // MARK: - Public Accessors

    public void setUser(User user) {
        this.currentUser = user;
        if (user != null && user.preferredLanguage() != null) {
            String lang = user.getPreferredLanguageOrDefault();
            appState.setCurrentLanguage(lang);
            if (languageSelector != null) {
                languageSelector.setSelectedLanguage(lang);
            }
        }
    }

    public CodeEditorPanel getCodeEditorPanel() {
        return codeEditorPanel;
    }

    private class TaskCellRenderer extends DefaultListCellRenderer {
        @Override
        public java.awt.Component getListCellRendererComponent(
            JList<?> list, Object value, int index, boolean isSelected, boolean cellHasFocus
        ) {
            JPanel panel = new JPanel(new BorderLayout(8, 0));
            panel.setOpaque(false);
            
            JLabel label = (JLabel) super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
            
            label.setFont(UITheme.getFont(Font.PLAIN, 14));
            label.setBorder(new EmptyBorder(8, 12, 8, 12));
            
            if (isSelected) {
                label.setBackground(UITheme.PRIMARY_ACCENT);
                label.setForeground(UITheme.TEXT_PRIMARY);
            } else {
                label.setBackground(UITheme.INPUT_BACKGROUND);
                label.setForeground(UITheme.TEXT_PRIMARY);
            }

            if (value instanceof Task task) {
                String text = task.toString();
                if (completedTaskIds.contains(task.id())) {
                    text = "✓ " + text;
                    label.setForeground(new Color(74, 222, 128)); // Green
                }
                label.setText(text);

                // Add difficulty badge
                DifficultyBadge badge = new DifficultyBadge(task.difficult());
                panel.add(label, BorderLayout.CENTER);
                panel.add(badge, BorderLayout.EAST);
                panel.setBackground(label.getBackground());

                return panel;
            }

            return label;
        }
    }

    public Set<Integer> getCompletedTaskIds() {
        return Collections.unmodifiableSet(completedTaskIds);
    }
}
