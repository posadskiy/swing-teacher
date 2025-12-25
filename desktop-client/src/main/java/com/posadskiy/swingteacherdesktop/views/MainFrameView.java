package com.posadskiy.swingteacherdesktop.views;

import com.posadskiy.swingteacherdesktop.controllers.MainFrameController;
import com.posadskiy.swingteacherdesktop.controllers.PopupWindowsController;
import com.posadskiy.swingteacherdesktop.models.ComboBoxModel;
import com.posadskiy.swingteacherdesktop.models.TaskListCellRenderer;
import com.posadskiy.swingteacherdesktop.navigation.AppNavigator;
import com.posadskiy.swingteacherdesktop.service.AuthService;
import com.posadskiy.swingteacherdesktop.state.AppState;
import com.posadskiy.swingteacherdesktop.tables.*;
import lombok.extern.slf4j.Slf4j;
import net.miginfocom.swing.MigLayout;
import org.fife.ui.autocomplete.AutoCompletion;
import org.fife.ui.autocomplete.CompletionProvider;
import org.fife.ui.rsyntaxtextarea.RSyntaxTextArea;
import org.fife.ui.rsyntaxtextarea.SyntaxConstants;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.*;
import java.util.List;

/**
 * Main application frame view with task management.
 */
@Slf4j
@Lazy
@Component
public class MainFrameView extends JFrame {

    private final AppState appState;
    private final MainFrameController mainFrameController;
    private final PopupWindowsController popupWindowsController;
    private final AppNavigator navigator;
    private final AuthService authService;
    
    private int taskCategory;
    private int lesson;
    
    // UI Components
    private JMenuBar menuBar;
    private JLabel lessonLabel;
    private JLabel taskLabel;
    private JComboBox<Lesson> lessonComboBox;
    private JComboBox<Task> taskComboBox;
    private JButton lookButton;
    private JButton checkButton;
    private JScrollPane answerScrollPane;
    private JScrollPane questionScrollPane;
    private JScrollPane documentationScrollPane;
    
    // Data
    private User currentUser;
    private List<Task> tasks;
    private List<Lesson> lessons;
    private final Set<Integer> completedTaskIds = new HashSet<>();

    public MainFrameView(
        MainFrameController mainFrameController,
        PopupWindowsController popupWindowsController,
        AppState appState,
        AppNavigator navigator,
        AuthService authService) {
        this.mainFrameController = mainFrameController;
        this.popupWindowsController = popupWindowsController;
        this.appState = appState;
        this.navigator = navigator;
        this.authService = authService;
        initComponents();
    }

    public void initComponents() {
        currentUser = appState.getCurrentUser();
        taskCategory = 1;
        lesson = -1;

        loadInitialData();
        createUIComponents();
        setupLayout();
        setupListeners();
        doSetupFrame();
    }
    
    private void loadInitialData() {
        if (currentUser == null || currentUser.id() == null) {
            lessons = List.of();
            tasks = List.of();
            return;
        }
        
        try {
            lessons = Optional.ofNullable(mainFrameController.getLessonByCategory(taskCategory))
                .orElse(List.of());
            
            if (!lessons.isEmpty() && lessons.getFirst().id() != null) {
                lesson = lessons.getFirst().id();
                tasks = Optional.ofNullable(lessons.getFirst().tasks())
                    .orElse(List.of());
            } else {
                tasks = List.of();
            }
            
            // Load completed tasks
            var completedTasks = mainFrameController.getCompletedTaskByUserId(currentUser.id());
            completedTasks.stream()
                .map(CompletedTask::taskId)
                .filter(Objects::nonNull)
                .forEach(completedTaskIds::add);
                
        } catch (Exception e) {
            log.warn("Failed to load initial data, will retry later", e);
            lessons = List.of();
            tasks = List.of();
        }
    }
    
    private void createUIComponents() {
        menuBar = doCreateMenuBar();
        lessonLabel = createLabel("Lesson");
        taskLabel = createLabel("Task");
        
        lessonComboBox = new JComboBox<>(new ComboBoxModel<>(new ArrayList<>(lessons)));
        taskComboBox = new JComboBox<>(new ComboBoxModel<>(new ArrayList<>(tasks)));
        
        // Use custom renderer for completed task display
        taskComboBox.setRenderer(new TaskListCellRenderer(completedTaskIds));
        
        lessonComboBox.setFont(new Font("Times New Roman", Font.PLAIN, 16));
        taskComboBox.setFont(new Font("Times New Roman", Font.PLAIN, 16));
        
        if (!tasks.isEmpty()) {
            var firstTask = tasks.getFirst();
            questionScrollPane = doCreateQuestionScrollPane(firstTask.question());
            var doc = mainFrameController.getDocumentation(firstTask.idDocumentation());
            var docText = Optional.ofNullable(doc)
                .map(Documentation::text)
                .filter(t -> !t.isBlank())
                .orElse("Documentation not available");
            documentationScrollPane = doCreateDocumentationScrollPane(docText);
        } else {
            questionScrollPane = doCreateQuestionScrollPane("Question not available");
            documentationScrollPane = doCreateDocumentationScrollPane("Documentation not available");
        }
        
        answerScrollPane = doCreateAnswerScrollPane("");
        lookButton = new JButton("View");
        checkButton = new JButton("Check");
    }
    
    private void setupLayout() {
        setJMenuBar(menuBar);
        
        var migLayout = new MigLayout("wrap 16", "grow, fill");
        setLayout(migLayout);
        
        add(lessonLabel, "span 2");
        add(lessonComboBox, "span 2, w 20%");
        add(taskLabel, "span 2");
        add(taskComboBox, "span 2, w 20%");
        add(documentationScrollPane, "span 8 8, w 50%, h 100%");
        add(questionScrollPane, "span 8 2, h 30%");
        add(answerScrollPane, "span 8 4, h 70%");
        add(lookButton, "span 4");
        add(checkButton, "span 4");
    }
    
    private void setupListeners() {
        lessonComboBox.addActionListener(this::changeSelectedElementInLessonComboBox);
        taskComboBox.addActionListener(this::changeSelectedElementInTaskComboBox);
        lookButton.addActionListener(this::clickLookButton);
        checkButton.addActionListener(this::clickOkButton);
    }
    
    private JLabel createLabel(String text) {
        var label = new JLabel(text);
        label.setFont(new Font("Times New Roman", Font.BOLD, 16));
        return label;
    }

    public void doSetupFrame() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(1000, 600));
        setLocationRelativeTo(null);
        setExtendedState(JFrame.MAXIMIZED_BOTH);
    }

    public JMenuBar doCreateMenuBar() {
        var font = new Font("Verdana", Font.PLAIN, 11);
        var menuBar = new JMenuBar();

        var settingsMenu = new JMenu("Settings");
        settingsMenu.setFont(font);

        var logoutItem = new JMenuItem("Logout");
        logoutItem.setFont(font);
        logoutItem.addActionListener(e -> logout());
        settingsMenu.add(logoutItem);

        settingsMenu.addSeparator();

        var exitItem = new JMenuItem("Exit");
        exitItem.setFont(font);
        exitItem.addActionListener(e -> System.exit(0));
        settingsMenu.add(exitItem);

        menuBar.add(settingsMenu);

        var refMenu = new JMenu("Help");

        var documentationItem = new JMenuItem("Documentation");
        documentationItem.setFont(font);
        documentationItem.addActionListener(e -> showDocumentation());
        refMenu.add(documentationItem);

        var aboutProgram = new JMenuItem("About");
        aboutProgram.setFont(font);
        aboutProgram.addActionListener(e -> showAbout());
        refMenu.add(aboutProgram);

        menuBar.add(refMenu);

        return menuBar;
    }

    public JScrollPane doCreateDocumentationScrollPane(String text) {
        var html = new JEditorPane();
        html.setContentType("text/html;Content-Type=windows-1251");
        html.setEditable(false);
        html.setText(text);
        var tBorder = BorderFactory.createTitledBorder("Help");
        tBorder.setTitleFont(new Font("Serif", Font.BOLD, 15));
        html.setBorder(tBorder);

        return new JScrollPane(html);
    }

    public JScrollPane doCreateQuestionScrollPane(String text) {
        var html = new JEditorPane();
        html.setContentType("text/html;Content-Type=windows-1251");
        html.setEditable(false);
        html.setText(text);
        var tBorder = BorderFactory.createTitledBorder("Task");
        tBorder.setTitleFont(new Font("Serif", Font.BOLD, 15));
        html.setBorder(tBorder);
        var scrollPane = new JScrollPane(html);
        scrollPane.setMinimumSize(new Dimension(500, 60));
        return scrollPane;
    }

    public JScrollPane doCreateAnswerScrollPane(String text) {
        var textArea = new RSyntaxTextArea(text);

        var tBorder = BorderFactory.createTitledBorder("Solution");
        tBorder.setTitleFont(new Font("Serif", Font.BOLD, 15));
        textArea.setBorder(tBorder);
        textArea.setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_JAVA);

        CompletionProvider provider = mainFrameController.createCompletionProvider();
        var ac = new AutoCompletion(provider);
        ac.install(textArea);

        return new JScrollPane(textArea);
    }

    public void changeSelectedElementInLessonComboBox(ActionEvent ae) {
        var selectedIndex = lessonComboBox.getSelectedIndex();
        
        tasks = (selectedIndex >= 0 && selectedIndex < lessons.size())
            ? Optional.ofNullable(lessons.get(selectedIndex).tasks()).orElse(List.of())
            : List.of();

        taskComboBox.removeAllItems();
        
        var questionPane = (JEditorPane) questionScrollPane.getViewport().getView();
        var docPane = (JEditorPane) documentationScrollPane.getViewport().getView();
        
        if (!tasks.isEmpty()) {
            var firstTask = tasks.getFirst();
            questionPane.setText(firstTask.question());
            
            var doc = mainFrameController.getDocumentation(firstTask.idDocumentation());
            var docText = Optional.ofNullable(doc)
                .map(Documentation::text)
                .orElse("Reference information for this task is not available");
            docPane.setText(docText);
            
            tasks.forEach(taskComboBox::addItem);
        } else {
            docPane.setText("Reference information for this task is not available");
        }
    }

    public void changeSelectedElementInTaskComboBox(ActionEvent ae) {
        var questionPane = (JEditorPane) questionScrollPane.getViewport().getView();
        var docPane = (JEditorPane) documentationScrollPane.getViewport().getView();
        
        if (taskComboBox.getItemCount() != 0) {
            var selectedTask = (Task) taskComboBox.getSelectedItem();
            if (selectedTask != null) {
                questionPane.setText(selectedTask.question());
                var doc = mainFrameController.getDocumentation(selectedTask.idDocumentation());
                docPane.setText(doc != null ? doc.text() : "Documentation not available");
            }
        } else {
            questionPane.setText("Question not available");
            docPane.setText("Documentation not available");
        }
    }

    public void clickLookButton(ActionEvent ae) {
        var selectedTask = (Task) taskComboBox.getSelectedItem();
        var imports = Optional.ofNullable(selectedTask)
            .map(Task::imports)
            .orElse("");
        
        var answerText = ((JTextArea) answerScrollPane.getViewport().getView()).getText();
        mainFrameController.loadAndRunClassFromFile(answerText, imports);
    }

    public void clickOkButton(ActionEvent ae) {
        if (taskComboBox.getItemCount() == 0) {
            popupWindowsController.createPopupWindow("Please select a question first!", "Error!");
            return;
        }
        
        var selectedTask = (Task) taskComboBox.getSelectedItem();
        if (selectedTask == null) {
            popupWindowsController.createPopupWindow("Please select a task!", "Error!");
            return;
        }
        
        if (mainFrameController.getCompletedTaskByUserIdByTaskId(currentUser.id(), selectedTask.id()) != null) {
            popupWindowsController.createPopupWindow("Task already completed!", "Error!");
            return;
        }

        var answerTextArea = (JTextArea) answerScrollPane.getViewport().getView();
        var errors = mainFrameController.isFileCompile(answerTextArea.getText(), selectedTask.imports());
        
        if (!errors.isEmpty()) {
            popupWindowsController.createPopupWindow(errors, "Compilation error!");
            return;
        }
        
        errors = mainFrameController.check(selectedTask.answer(), answerTextArea.getText());
        if (!errors.isEmpty()) {
            popupWindowsController.createPopupWindow(errors, "Task execution error!");
            return;
        }

        // Create completed task using factory method
        var completedTask = CompletedTask.forUser(currentUser.id(), selectedTask.id());
        mainFrameController.addCompletedTask(completedTask);
        completedTaskIds.add(selectedTask.id());
        
        // Refresh combo box to show checkmark
        taskComboBox.repaint();
        
        answerTextArea.setText("");
        popupWindowsController.createPopupWindow(new JFrame(), "Solution is correct!", "Ok");
        
        if (taskComboBox.getItemCount() > taskComboBox.getSelectedIndex() + 1) {
            taskComboBox.setSelectedIndex(taskComboBox.getSelectedIndex() + 1);
        }
    }

    public void setUser(User user) {
        this.currentUser = user;
    }

    public JComboBox<Task> getTaskComboBox() {
        return taskComboBox;
    }

    public Set<Integer> getCompletedTaskIds() {
        return Collections.unmodifiableSet(completedTaskIds);
    }

    private void logout() {
        authService.logout();
        appState.clearUser();
        setVisible(false);
        navigator.showAuth();
    }

    private void showDocumentation() {
        try {
            var doc = mainFrameController.getDocumentation(0);
            var docText = Optional.ofNullable(doc)
                .map(Documentation::text)
                .filter(t -> !t.isBlank())
                .orElse("<h1>Documentation</h1><p>Documentation is not available.</p>");

            var dialog = new JDialog(this, "Documentation", true);
            dialog.setSize(800, 600);
            dialog.setLocationRelativeTo(this);

            var editorPane = new JEditorPane();
            editorPane.setContentType("text/html");
            editorPane.setEditable(false);
            editorPane.setText(docText);

            var scrollPane = new JScrollPane(editorPane);
            scrollPane.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

            var closeButton = new JButton("Close");
            closeButton.addActionListener(e -> dialog.dispose());

            var buttonPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
            buttonPanel.add(closeButton);

            dialog.setLayout(new BorderLayout());
            dialog.add(scrollPane, BorderLayout.CENTER);
            dialog.add(buttonPanel, BorderLayout.SOUTH);

            dialog.setVisible(true);
        } catch (Exception ex) {
            log.error("Failed to show documentation", ex);
            popupWindowsController.createPopupWindow("Failed to load documentation", "Error!");
        }
    }

    private void showAbout() {
        var aboutText = """
            <html><body style='font-family: Arial; padding: 20px;'>
            <h1>SwingTeacher Desktop</h1>
            <p><strong>Version:</strong> 1.0-SNAPSHOT</p>
            <p><strong>Description:</strong> Educational Java programming application</p>
            <p>This application helps you learn Java programming through interactive tasks and lessons.</p>
            <hr>
            <p><strong>Features:</strong></p>
            <ul>
            <li>Interactive Java code editor with syntax highlighting</li>
            <li>Autocomplete support for keywords and code snippets</li>
            <li>Task-based learning system</li>
            <li>Progress tracking</li>
            <li>Reference documentation</li>
            </ul>
            <hr>
            <p><em>Built with Java 25 and Spring Framework</em></p>
            </body></html>
            """;

        JOptionPane.showMessageDialog(
            this,
            aboutText,
            "About SwingTeacher Desktop",
            JOptionPane.INFORMATION_MESSAGE
        );
    }
}
