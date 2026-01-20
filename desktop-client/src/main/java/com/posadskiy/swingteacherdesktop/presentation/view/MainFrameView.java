package com.posadskiy.swingteacherdesktop.presentation.view;

import com.posadskiy.swingteacherdesktop.application.service.AuthenticationService;
import com.posadskiy.swingteacherdesktop.domain.model.*;
import com.posadskiy.swingteacherdesktop.infrastructure.i18n.I18nService;
import com.posadskiy.swingteacherdesktop.infrastructure.state.AppState;
import com.posadskiy.swingteacherdesktop.infrastructure.storage.AppPreferences;
import com.posadskiy.swingteacherdesktop.presentation.component.*;
import com.posadskiy.swingteacherdesktop.presentation.controller.MainFrameController;
import com.posadskiy.swingteacherdesktop.presentation.controller.PopupController;
import com.posadskiy.swingteacherdesktop.presentation.model.ComboBoxModel;
import com.posadskiy.swingteacherdesktop.presentation.model.LessonListCellRenderer;
import com.posadskiy.swingteacherdesktop.presentation.model.TaskListCellRenderer;
import com.posadskiy.swingteacherdesktop.presentation.navigation.AppNavigator;
import lombok.extern.slf4j.Slf4j;
import org.fife.ui.autocomplete.AutoCompletion;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.DefaultEditorKit;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.*;
import java.util.List;

/**
 * Modern main application frame with task management.
 * Uses dark theme UI components for consistent styling.
 */
@Slf4j
@Lazy
@Component
public class MainFrameView extends JFrame implements PropertyChangeListener {

    private final AppState appState;
    private final MainFrameController controller;
    private final PopupController popupController;
    private final AppNavigator navigator;
    private final AuthenticationService authService;
    private final I18nService i18n;
    private final AppPreferences appPreferences;
    
    private int taskCategory = 1;
    
    // UI Components
    private ModernComboBox<Lesson> lessonComboBox;
    private ModernComboBox<Task> taskComboBox;
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
    private JLabel lessonLabel;
    private JLabel taskLabel;
    private SectionTitle documentationTitle;
    private SectionTitle taskTitle;
    private SectionTitle solutionTitle;
    private JMenu settingsMenu;
    private JMenu helpMenu;
    private JMenuItem preferencesItem;
    private JMenuItem logoutItem;
    private JMenuItem exitItem;
    private JMenuItem docsItem;
    private JMenuItem aboutItem;

    // Task switching guard state
    private boolean suppressSelectionEvents = false;
    private boolean skipConfirmationForNavigation = false;
    private Integer pendingTaskIdAfterLessonChange = null;
    private int lastLessonIndex = -1;
    private int lastTaskIndex = -1;
    private Integer lastTaskId = null;
    
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
        AuthenticationService authService,
        I18nService i18n,
        AppPreferences appPreferences
    ) {
        this.controller = controller;
        this.popupController = popupController;
        this.appState = appState;
        this.navigator = navigator;
        this.authService = authService;
        this.i18n = i18n;
        this.appPreferences = appPreferences;
        i18n.addPropertyChangeListener(this);
        appState.addPropertyChangeListener(this);
        initComponents();
    }

    private static boolean shouldSuggestAtCaret(JTextArea textArea) {
        try {
            int pos = textArea.getCaretPosition();
            if (pos <= 0) {
                return false;
            }
            char prev = textArea.getText(pos - 1, 1).charAt(0);
            return Character.isLetterOrDigit(prev) || prev == '_' || prev == '.';
        } catch (Exception ignored) {
            return false;
        }
    }

    private void configureFrame() {
        setTitle(i18n.getString("main.title"));
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

    public void initComponents() {
        currentUser = appState.getCurrentUser();

        // Initialize language selector with user's preference
        String initialLanguage = currentUser != null && currentUser.preferredLanguage() != null
            ? currentUser.getPreferredLanguageOrDefault()
            : appState.getCurrentLanguage();
        appState.setCurrentLanguage(initialLanguage);
        i18n.setLocale(initialLanguage);
        
        loadInitialData();
        
        configureFrame();
        setJMenuBar(createMenuBar());
        setContentPane(createMainContent());

        // Set language selector after UI is created
        SwingUtilities.invokeLater(() -> {
            // Select first non-completed task on startup
            selectFirstNonCompletedTask();
            
            // Capture initial selection for task-switch guard after combo boxes are ready
            lastLessonIndex = lessonComboBox != null ? lessonComboBox.getSelectedIndex() : -1;
            lastTaskIndex = taskComboBox != null ? taskComboBox.getSelectedIndex() : -1;
            Task selectedTask = taskComboBox != null ? (Task) taskComboBox.getSelectedItem() : null;
            lastTaskId = selectedTask != null ? selectedTask.id() : null;
        });
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
                // Update renderers with latest completed task IDs
                taskComboBox.setRenderer(new TaskListCellRenderer(completedTaskIds));
            } else {
                tasks = List.of();
                taskComboBox.removeAllItems();
            }

            // Update lesson renderer with latest completed task IDs
            lessonComboBox.setRenderer(new LessonListCellRenderer(completedTaskIds));

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

    private void onLanguageChanged(String languageCode) {
        log.debug("Language changed to: {}", languageCode);
        appState.setCurrentLanguage(languageCode);
        i18n.setLocale(languageCode);
        controller.setPreferredLanguage(languageCode);
        if (appPreferences != null) {
            appPreferences.setUiLanguage(languageCode);
        }

        // Reload lessons and tasks with new language
        reloadLessonsAndTasks();
        updateUITexts();
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
        lessonLabel = createLabel(i18n.getString("main.lessonLabel"));
        toolbar.add(lessonLabel, gbc);

        // Lesson combo - 40%
        gbc.gridx = 1;
        gbc.weightx = 0.4;
        lessonComboBox = new ModernComboBox<>(new ComboBoxModel<>(new ArrayList<>(lessons)));
        lessonComboBox.setPreferredSize(new Dimension(0, 40));
        lessonComboBox.setRenderer(new LessonListCellRenderer(completedTaskIds));
        lessonComboBox.addActionListener(e -> onLessonChanged());
        toolbar.add(lessonComboBox, gbc);

        // Spacer
        gbc.gridx = 2;
        gbc.weightx = 0;
        gbc.insets = new Insets(0, 16, 0, 8);
        taskLabel = createLabel(i18n.getString("main.taskLabel"));
        toolbar.add(taskLabel, gbc);

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

        return toolbar;
    }

    private JMenuBar createMenuBar() {
        ModernMenuBar menuBar = new ModernMenuBar();

        // Settings menu
        settingsMenu = ModernMenuBar.createMenu(i18n.getString("menu.settings"));

        preferencesItem = ModernMenuBar.createMenuItem(i18n.getString("menu.preferences"));
        preferencesItem.addActionListener(e -> openSettings());
        settingsMenu.add(preferencesItem);
        settingsMenu.add(ModernMenuBar.createSeparator());

        logoutItem = ModernMenuBar.createMenuItem(i18n.getString("menu.logout"));
        logoutItem.addActionListener(e -> logout());
        settingsMenu.add(logoutItem);

        settingsMenu.add(ModernMenuBar.createSeparator());

        exitItem = ModernMenuBar.createMenuItem(i18n.getString("menu.exit"));
        exitItem.addActionListener(e -> System.exit(0));
        settingsMenu.add(exitItem);

        menuBar.add(settingsMenu);

        // Help menu
        helpMenu = ModernMenuBar.createMenu(i18n.getString("menu.help"));

        docsItem = ModernMenuBar.createMenuItem(i18n.getString("menu.documentation"));
        docsItem.addActionListener(e -> showDocumentation());
        helpMenu.add(docsItem);

        aboutItem = ModernMenuBar.createMenuItem(i18n.getString("menu.about"));
        aboutItem.addActionListener(e -> showAbout());
        helpMenu.add(aboutItem);

        menuBar.add(helpMenu);

        return menuBar;
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

        documentationTitle = new SectionTitle(i18n.getString("main.documentationTitle"), "📚");
        panel.add(documentationTitle, BorderLayout.NORTH);

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
        taskTitle = new SectionTitle(i18n.getString("main.taskTitle"), "📝");
        questionSection.add(taskTitle, BorderLayout.NORTH);
        questionSection.add(new Divider(), BorderLayout.SOUTH);
        
        questionPane = new ModernEditorPane();
        updateQuestion();
        
        ModernScrollPane questionScroll = new ModernScrollPane(questionPane);
        questionSection.add(questionScroll, BorderLayout.CENTER);

        // Answer section with buttons
        JPanel answerSection = new JPanel(new BorderLayout(0, 12));
        answerSection.setOpaque(false);
        answerSection.setBorder(new EmptyBorder(8, 0, 0, 0));
        solutionTitle = new SectionTitle(i18n.getString("main.solutionTitle"), "💻");
        answerSection.add(solutionTitle, BorderLayout.NORTH);

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

        prevTaskButton = ModernButton.secondary(i18n.getString("button.previous"));
        prevTaskButton.setPreferredSize(new Dimension(120, 44));
        prevTaskButton.setToolTipText(i18n.getString("tooltip.previousTask"));
        prevTaskButton.addActionListener(e -> onPreviousTask());
        navPanel.add(prevTaskButton);

        nextTaskButton = ModernButton.secondary(i18n.getString("button.next"));
        nextTaskButton.setPreferredSize(new Dimension(120, 44));
        nextTaskButton.setToolTipText(i18n.getString("tooltip.nextTask"));
        nextTaskButton.addActionListener(e -> onNextTask());
        navPanel.add(nextTaskButton);

        // Action buttons on the right
        JPanel actionPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
        actionPanel.setOpaque(false);

        showSolutionButton = ModernButton.secondary(i18n.getString("button.showSolution"));
        showSolutionButton.setPreferredSize(new Dimension(160, 44));
        showSolutionButton.setToolTipText(i18n.getString("tooltip.showSolution"));
        showSolutionButton.addActionListener(e -> onShowSolutionClick());
        actionPanel.add(showSolutionButton);

        viewButton = ModernButton.secondary(i18n.getString("button.runCode"));
        viewButton.setPreferredSize(new Dimension(140, 44));
        viewButton.setToolTipText(i18n.getString("tooltip.runCode"));
        viewButton.addActionListener(e -> onViewClick());
        actionPanel.add(viewButton);

        checkButton = ModernButton.primary(i18n.getString("button.submitAnswer"));
        checkButton.setPreferredSize(new Dimension(160, 44));
        checkButton.setToolTipText(i18n.getString("tooltip.submitAnswer"));
        checkButton.addActionListener(e -> onCheckClick());
        actionPanel.add(checkButton);

        panel.add(navPanel, BorderLayout.WEST);
        panel.add(actionPanel, BorderLayout.EAST);

        setupKeyboardShortcuts();
        updateNavigationButtons();

        return panel;
    }

    private void openSettings() {
        SettingsDialog dialog = new SettingsDialog(
            this,
            i18n,
            appState.getCurrentLanguage(),
            this::onLanguageChanged
        );
        dialog.setVisible(true);
    }

    private void setupAutoCompletion() {
        var provider = controller.createCompletionProvider();
        var ac = new AutoCompletion(provider);
        // We'll drive auto-popup ourselves for consistent behavior across AutoComplete versions.
        ac.setAutoActivationEnabled(false);
        ac.setShowDescWindow(true);
        ac.setParameterAssistanceEnabled(true);
        ac.install(codeEditorPanel.getTextArea());

        var textArea = codeEditorPanel.getTextArea();

        // Auto-popup while typing (like AutoComplete demo), including after '.' and within identifiers.
        javax.swing.Timer completionTimer = new javax.swing.Timer(180, e -> SwingUtilities.invokeLater(ac::doCompletion));
        completionTimer.setRepeats(false);

        DocumentListener docListener = new DocumentListener() {
            private void schedule() {
                if (!shouldSuggestAtCaret(textArea)) {
                    return;
                }
                completionTimer.restart();
            }

            @Override
            public void insertUpdate(DocumentEvent e) {
                schedule();
            }

            @Override
            public void removeUpdate(DocumentEvent e) { /* ignore */ }

            @Override
            public void changedUpdate(DocumentEvent e) { /* ignore */ }
        };
        textArea.getDocument().addDocumentListener(docListener);

        // Accept completion with Tab when we are in a "completion context"; otherwise keep normal Tab behavior.
        Action defaultTabAction = textArea.getActionMap().get(DefaultEditorKit.insertTabAction);
        String completeOrTabActionName = "completeOrTab";
        textArea.getActionMap().put(completeOrTabActionName, new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (shouldSuggestAtCaret(textArea)) {
                    ac.doCompletion();
                    return;
                }
                if (defaultTabAction != null) {
                    defaultTabAction.actionPerformed(e);
                }
            }
        });
        textArea.getInputMap(JComponent.WHEN_FOCUSED).put(
            KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0),
            completeOrTabActionName
        );

        // Optional: keep Ctrl+Space manual trigger working (macOS users often expect this).
        ac.setTriggerKey(KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, InputEvent.CTRL_DOWN_MASK));
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
        int currentLessonIndex = lessonComboBox.getSelectedIndex();

        // If not at first task in current lesson, find previous non-completed task
        if (currentIndex > 0) {
            // Find the previous non-completed task in current lesson
            for (int i = currentIndex - 1; i >= 0; i--) {
                Task task = tasks.get(i);
                if (task.id() == null || !completedTaskIds.contains(task.id())) {
                    taskComboBox.setSelectedIndex(i);
                    return;
                }
            }
            // All previous tasks are completed, so we can't go back within this lesson
            // Fall through to check if we can go to previous lesson
        }

        // If at first task, try to go to previous lesson
        if (currentLessonIndex > 0) {
            Lesson previousLesson = lessons.get(currentLessonIndex - 1);
            Task targetTask = findLastNonCompletedTask(previousLesson);

            // If no non-completed task found, use the last task in the lesson
            if (targetTask == null && previousLesson.tasks() != null && !previousLesson.tasks().isEmpty()) {
                targetTask = previousLesson.tasks().get(previousLesson.tasks().size() - 1);
            }

            final Integer targetTaskId = targetTask != null ? targetTask.id() : null;

            // Set flag to skip confirmation and store target task ID
            skipConfirmationForNavigation = true;
            pendingTaskIdAfterLessonChange = targetTaskId;

            // Switch to previous lesson - this will trigger onLessonChanged which will update UI and select the task
            lessonComboBox.setSelectedIndex(currentLessonIndex - 1);
        }
    }

    private void onNextTask() {
        int currentIndex = taskComboBox.getSelectedIndex();
        int currentLessonIndex = lessonComboBox.getSelectedIndex();
        int taskCount = taskComboBox.getItemCount();

        // If not at last task in current lesson, find next non-completed task
        if (currentIndex < taskCount - 1) {
            // Find the next non-completed task in current lesson
            for (int i = currentIndex + 1; i < taskCount; i++) {
                Task task = tasks.get(i);
                if (task.id() == null || !completedTaskIds.contains(task.id())) {
                    taskComboBox.setSelectedIndex(i);
                    return;
                }
            }
            // All next tasks are completed, so we can't go forward within this lesson
            // Fall through to check if we can go to next lesson
        }

        // If at last task, try to go to next lesson
        if (currentLessonIndex < lessons.size() - 1) {
            Lesson nextLesson = lessons.get(currentLessonIndex + 1);
            Task targetTask = findFirstNonCompletedTask(nextLesson);

            // If no non-completed task found, use the first task in the lesson
            if (targetTask == null && nextLesson.tasks() != null && !nextLesson.tasks().isEmpty()) {
                targetTask = nextLesson.tasks().get(0);
            }

            final Integer targetTaskId = targetTask != null ? targetTask.id() : null;

            // Set flag to skip confirmation and store target task ID
            skipConfirmationForNavigation = true;
            pendingTaskIdAfterLessonChange = targetTaskId;

            // Switch to next lesson - this will trigger onLessonChanged which will update UI and select the task
            lessonComboBox.setSelectedIndex(currentLessonIndex + 1);
        }
    }

    /**
     * Finds the first non-completed task in a lesson.
     */
    private Task findFirstNonCompletedTask(Lesson lesson) {
        if (lesson == null || lesson.tasks() == null) {
            return null;
        }
        return lesson.tasks().stream()
            .filter(task -> task.id() != null && !completedTaskIds.contains(task.id()))
            .findFirst()
            .orElse(null);
    }

    /**
     * Finds the last non-completed task in a lesson.
     */
    private Task findLastNonCompletedTask(Lesson lesson) {
        if (lesson == null || lesson.tasks() == null) {
            return null;
        }
        List<Task> nonCompletedTasks = lesson.tasks().stream()
            .filter(task -> task.id() != null && !completedTaskIds.contains(task.id()))
            .toList();
        return nonCompletedTasks.isEmpty() ? null : nonCompletedTasks.get(nonCompletedTasks.size() - 1);
    }

    /**
     * Finds the index of a task in the current lesson's task list.
     */
    private int findTaskIndexInCurrentLesson(Integer taskId) {
        if (taskId == null || tasks == null) {
            return -1;
        }
        for (int i = 0; i < tasks.size(); i++) {
            if (taskId.equals(tasks.get(i).id())) {
                return i;
            }
        }
        return -1;
    }

    /**
     * Checks if all tasks in a lesson are completed.
     */
    private boolean isLessonCompleted(Lesson lesson) {
        if (lesson == null || lesson.tasks() == null || lesson.tasks().isEmpty()) {
            return false;
        }
        return lesson.tasks().stream()
            .allMatch(task -> task.id() != null && completedTaskIds.contains(task.id()));
    }

    /**
     * Selects the first non-completed task across all lessons.
     * Used on startup to open the main frame to the first uncompleted task.
     */
    private void selectFirstNonCompletedTask() {
        if (lessons == null || lessons.isEmpty() || lessonComboBox == null || taskComboBox == null) {
            return;
        }

        // Find the first lesson with a non-completed task
        for (int lessonIdx = 0; lessonIdx < lessons.size(); lessonIdx++) {
            Lesson lesson = lessons.get(lessonIdx);
            Task firstNonCompleted = findFirstNonCompletedTask(lesson);
            if (firstNonCompleted != null) {
                final Integer targetTaskId = firstNonCompleted.id();

                // Use the same mechanism as navigation to select lesson and task
                skipConfirmationForNavigation = true;
                pendingTaskIdAfterLessonChange = targetTaskId;

                // Select the lesson - this will trigger onLessonChanged which will update UI and select the task
                if (lessonIdx < lessonComboBox.getItemCount()) {
                    lessonComboBox.setSelectedIndex(lessonIdx);
                }
                return; // Found and selected, exit
            }
        }

        // If no non-completed tasks found, just select the first lesson and first task
        if (lessonComboBox.getItemCount() > 0) {
            lessonComboBox.setSelectedIndex(0);
            if (taskComboBox.getItemCount() > 0) {
                taskComboBox.setSelectedIndex(0);
            }
        }
    }

    private void updateNavigationButtons() {
        // Buttons should never be disabled - always allow navigation
        prevTaskButton.setEnabled(true);
        nextTaskButton.setEnabled(true);
    }

    private void updateTaskCounter() {
        int currentIndex = taskComboBox.getSelectedIndex();
        int total = taskComboBox.getItemCount();
        if (total > 0) {
            taskCounterLabel.setText(i18n.getString("main.taskCounter", currentIndex + 1, total));
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
        if (suppressSelectionEvents) {
            return;
        }

        int selectedLessonIndex = lessonComboBox.getSelectedIndex();
        if (selectedLessonIndex != lastLessonIndex && shouldConfirmDraftLoss() && !skipConfirmationForNavigation) {
            int result = JOptionPane.showConfirmDialog(
                this,
                i18n.getString("message.switchTaskConfirm"),
                i18n.getString("message.switchTaskConfirmTitle"),
                JOptionPane.YES_NO_OPTION,
                JOptionPane.WARNING_MESSAGE
            );

            if (result != JOptionPane.YES_OPTION) {
                revertLessonSelection();
                return;
            }
        }

        // Always clear solution when switching tasks/lessons (confirmed above if needed)
        clearUserSolution();

        int selectedIndex = lessonComboBox.getSelectedIndex();
        
        tasks = (selectedIndex >= 0 && selectedIndex < lessons.size())
            ? Optional.ofNullable(lessons.get(selectedIndex).tasks()).orElse(List.of())
            : List.of();

        taskComboBox.removeAllItems();
        tasks.forEach(taskComboBox::addItem);

        // Update renderers with latest completed task IDs
        taskComboBox.setRenderer(new TaskListCellRenderer(completedTaskIds));
        lessonComboBox.setRenderer(new LessonListCellRenderer(completedTaskIds));
        
        updateQuestion();
        updateDocumentation();
        updateTaskCounter();
        updateProgress();
        updateNavigationButtons();

        // Update guard state after lesson change updated tasks
        lastLessonIndex = lessonComboBox.getSelectedIndex();
        lastTaskIndex = taskComboBox.getSelectedIndex();
        Task selectedTask = (Task) taskComboBox.getSelectedItem();
        lastTaskId = selectedTask != null ? selectedTask.id() : null;

        // If there's a pending task to select after lesson change (from navigation), select it now
        if (pendingTaskIdAfterLessonChange != null) {
            Integer taskIdToSelect = pendingTaskIdAfterLessonChange;
            pendingTaskIdAfterLessonChange = null;
            boolean wasNavigation = skipConfirmationForNavigation;
            skipConfirmationForNavigation = false; // Reset flag

            SwingUtilities.invokeLater(() -> {
                if (taskIdToSelect != null) {
                    int taskIndex = findTaskIndexInCurrentLesson(taskIdToSelect);
                    if (taskIndex >= 0) {
                        taskComboBox.setSelectedIndex(taskIndex);
                        return;
                    }
                }

                // Fallback: select first task for next navigation, last task for previous navigation
                int taskCount = taskComboBox.getItemCount();
                if (taskCount > 0 && wasNavigation) {
                    // We can't distinguish between next/previous here, so use first as default
                    // The actual target task should have been found above
                    taskComboBox.setSelectedIndex(0);
                }
            });
        }
    }

    private void onTaskChanged() {
        if (suppressSelectionEvents) {
            return;
        }

        int selectedTaskIndex = taskComboBox.getSelectedIndex();
        if (selectedTaskIndex != lastTaskIndex && shouldConfirmDraftLoss()) {
            int result = JOptionPane.showConfirmDialog(
                this,
                i18n.getString("message.switchTaskConfirm"),
                i18n.getString("message.switchTaskConfirmTitle"),
                JOptionPane.YES_NO_OPTION,
                JOptionPane.WARNING_MESSAGE
            );

            if (result != JOptionPane.YES_OPTION) {
                revertTaskSelection();
                return;
            }
        }

        // Always clear solution when switching tasks (confirmed above if needed)
        if (selectedTaskIndex != lastTaskIndex) {
            clearUserSolution();
        }

        updateQuestion();
        updateDocumentation();
        updateTaskCounter();
        updateNavigationButtons();

        // Update guard state
        lastTaskIndex = taskComboBox.getSelectedIndex();
        Task selectedTask = (Task) taskComboBox.getSelectedItem();
        lastTaskId = selectedTask != null ? selectedTask.id() : null;
    }

    private boolean shouldConfirmDraftLoss() {
        if (!hasUserDraft()) {
            return false;
        }
        if (lastTaskId == null) {
            return false;
        }
        // Only warn if current (previously selected) task isn't completed yet
        return !completedTaskIds.contains(lastTaskId);
    }

    private boolean hasUserDraft() {
        if (codeEditorPanel == null) {
            return false;
        }
        String text = codeEditorPanel.getText();
        return text != null && !text.trim().isEmpty();
    }

    private void clearUserSolution() {
        if (codeEditorPanel == null) {
            return;
        }
        codeEditorPanel.setText("");
        try {
            // RSyntaxTextArea supports undo manager; discard edits to avoid Ctrl+Z restoring old task solution
            codeEditorPanel.getTextArea().discardAllEdits();
        } catch (Exception ignored) {
            // ignore
        }
    }

    private void revertTaskSelection() {
        if (taskComboBox == null) {
            return;
        }
        suppressSelectionEvents = true;
        try {
            if (lastTaskIndex >= 0 && lastTaskIndex < taskComboBox.getItemCount()) {
                taskComboBox.setSelectedIndex(lastTaskIndex);
            }
        } finally {
            suppressSelectionEvents = false;
        }
    }

    private void revertLessonSelection() {
        if (lessonComboBox == null) {
            return;
        }
        suppressSelectionEvents = true;
        try {
            if (lastLessonIndex >= 0 && lastLessonIndex < lessonComboBox.getItemCount()) {
                lessonComboBox.setSelectedIndex(lastLessonIndex);
            }
        } finally {
            suppressSelectionEvents = false;
        }
    }

    private void updateQuestion() {
        Task task = (Task) taskComboBox.getSelectedItem();
        String text = task != null ? task.question() : i18n.getString("placeholder.selectTaskBegin");
        questionPane.setText(text);
    }

    private void updateDocumentation() {
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task != null) {
            String languageCode = appState.getCurrentLanguage();
            var doc = controller.getDocumentation(task.idDocumentation(), languageCode);
            String text = doc.map(Documentation::text).orElse(i18n.getString("placeholder.documentationNotAvailable"));
            documentationPane.setText(text);
        } else {
            documentationPane.setText(i18n.getString("placeholder.selectTaskViewDoc"));
        }
    }

    private void onShowSolutionClick() {
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task == null) {
            popupController.showError(i18n.getString("message.selectTaskFirst"));
            return;
        }
        
        String solution = task.solution();
        if (solution == null || solution.isBlank()) {
            popupController.showError(i18n.getString("message.noSolution"));
            return;
        }
        
        // Ask for confirmation before showing solution
        int result = JOptionPane.showConfirmDialog(
            this,
            i18n.getString("message.showSolutionConfirm"),
            i18n.getString("message.showSolutionTitle"),
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
            popupController.showError(i18n.getString("message.selectTaskFirst"));
            return;
        }

        viewButton.setLoading(true);

        new SwingWorker<Void, Void>() {
            @Override
            protected Void doInBackground() {
                String imports = Optional.ofNullable(task).map(Task::imports).orElse("");
                String frameTitle = buildRunFrameTitle(task);
                boolean openOnLeft = shouldOpenRunFrameOnLeft();
                controller.runUserCode(codeEditorPanel.getText(), imports, frameTitle, openOnLeft);
                return null;
            }

            @Override
            protected void done() {
                viewButton.setLoading(false);
            }
        }.execute();
    }

    private String buildRunFrameTitle(Task task) {
        String lessonName = Optional.ofNullable((Lesson) lessonComboBox.getSelectedItem())
            .map(Object::toString)
            .orElse(i18n.getString("main.lessonLabel"));
        String taskName = Optional.ofNullable(task).map(Object::toString).orElse(i18n.getString("main.taskTitle"));
        return lessonName + " — " + taskName;
    }

    private boolean shouldOpenRunFrameOnLeft() {
        try {
            GraphicsConfiguration gc = getGraphicsConfiguration();
            Rectangle bounds = gc != null ? gc.getBounds() : GraphicsEnvironment.getLocalGraphicsEnvironment()
                .getDefaultScreenDevice()
                .getDefaultConfiguration()
                .getBounds();

            Point p = getLocationOnScreen();
            int centerX = p.x + (getWidth() / 2);
            return centerX < (bounds.x + (bounds.width / 2));
        } catch (Exception ignored) {
            return true;
        }
    }

    private void onCheckClick() {
        if (taskComboBox.getItemCount() == 0) {
            popupController.showError(i18n.getString("message.selectTaskFirst"));
            return;
        }
        
        Task task = (Task) taskComboBox.getSelectedItem();
        if (task == null) {
            popupController.showError(i18n.getString("message.selectTask"));
            return;
        }
        
        if (controller.isTaskCompleted(currentUser.id(), task.id())) {
            popupController.showError(i18n.getString("message.taskAlreadyCompleted"));
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
                    errorTitle = i18n.getString("error.compilationError");
                    return false;
                }

                // Validation check
                errors = controller.validateAnswer(task.answer(), codeEditorPanel.getText());
                if (errors != null && !errors.isEmpty()) {
                    errorMessage = errors;
                    errorTitle = i18n.getString("error.executionError");
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

                        // Check if lesson is now completed
                        int currentLessonIndex = lessonComboBox.getSelectedIndex();
                        if (currentLessonIndex >= 0 && currentLessonIndex < lessons.size()) {
                            Lesson currentLesson = lessons.get(currentLessonIndex);
                            if (isLessonCompleted(currentLesson)) {
                                // Lesson is now completed - update the renderer to show checkmark
                                lessonComboBox.repaint();
                            }
                        }
                        taskComboBox.repaint();

                        codeEditorPanel.setText("");
                        popupController.showSuccess(i18n.getString("message.correct"));
                        updateProgress();
                        updateNavigationButtons();

                        // Move to next task (using cross-lesson navigation if needed)
                        SwingUtilities.invokeLater(() -> onNextTask());
                    } else {
                        popupController.showMessage(errorMessage, errorTitle);
                    }
                } catch (Exception e) {
                    log.error("Error checking task", e);
                    popupController.showError(i18n.getString("message.errorOccurred"));
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
        String languageCode = appState.getCurrentLanguage();
        var doc = controller.getDocumentation(0, languageCode);
        String docText = doc.map(Documentation::text)
                .filter(t -> !t.isBlank())
            .orElse(i18n.getString("documentation.notAvailable"));

        showDialog(i18n.getString("documentation.title"), docText, 900, 700);
    }

    private void showAbout() {
        String aboutText = i18n.getString("about.content");
        showDialog(i18n.getString("about.title"), aboutText, 500, 450);
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

        ModernButton closeButton = ModernButton.primary(i18n.getString("button.close"));
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
        }
    }

    public CodeEditorPanel getCodeEditorPanel() {
        return codeEditorPanel;
    }

    /**
     * Updates all UI texts when language changes.
     */
    public void updateUITexts() {
        SwingUtilities.invokeLater(() -> {
            setTitle(i18n.getString("main.title"));
            if (lessonLabel != null) lessonLabel.setText(i18n.getString("main.lessonLabel"));
            if (taskLabel != null) taskLabel.setText(i18n.getString("main.taskLabel"));
            if (documentationTitle != null) documentationTitle.setText(i18n.getString("main.documentationTitle"));
            if (taskTitle != null) taskTitle.setText(i18n.getString("main.taskTitle"));
            if (solutionTitle != null) solutionTitle.setText(i18n.getString("main.solutionTitle"));
            if (settingsMenu != null) settingsMenu.setText(i18n.getString("menu.settings"));
            if (preferencesItem != null) preferencesItem.setText(i18n.getString("menu.preferences"));
            if (helpMenu != null) helpMenu.setText(i18n.getString("menu.help"));
            if (logoutItem != null) logoutItem.setText(i18n.getString("menu.logout"));
            if (exitItem != null) exitItem.setText(i18n.getString("menu.exit"));
            if (docsItem != null) docsItem.setText(i18n.getString("menu.documentation"));
            if (aboutItem != null) aboutItem.setText(i18n.getString("menu.about"));
            if (prevTaskButton != null) {
                prevTaskButton.setText(i18n.getString("button.previous"));
                prevTaskButton.setToolTipText(i18n.getString("tooltip.previousTask"));
            }
            if (nextTaskButton != null) {
                nextTaskButton.setText(i18n.getString("button.next"));
                nextTaskButton.setToolTipText(i18n.getString("tooltip.nextTask"));
            }
            if (showSolutionButton != null) {
                showSolutionButton.setText(i18n.getString("button.showSolution"));
                showSolutionButton.setToolTipText(i18n.getString("tooltip.showSolution"));
            }
            if (viewButton != null) {
                viewButton.setText(i18n.getString("button.runCode"));
                viewButton.setToolTipText(i18n.getString("tooltip.runCode"));
            }
            if (checkButton != null) {
                checkButton.setText(i18n.getString("button.submitAnswer"));
                checkButton.setToolTipText(i18n.getString("tooltip.submitAnswer"));
            }
            updateTaskCounter();
            updateQuestion();
            updateDocumentation();
        });
    }

    public Set<Integer> getCompletedTaskIds() {
        return Collections.unmodifiableSet(completedTaskIds);
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        if ("locale".equals(evt.getPropertyName()) || "language".equals(evt.getPropertyName())) {
            updateUITexts();
        }
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
                DifficultyBadge badge = new DifficultyBadge(task.difficult(), i18n);
                panel.add(label, BorderLayout.CENTER);
                panel.add(badge, BorderLayout.EAST);
                panel.setBackground(label.getBackground());

                return panel;
            }

            return label;
        }
    }
}
