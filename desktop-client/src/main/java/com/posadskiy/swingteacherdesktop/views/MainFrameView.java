package com.posadskiy.swingteacherdesktop.views;

import com.posadskiy.swingteacherdesktop.controllers.MainFrameController;
import com.posadskiy.swingteacherdesktop.controllers.PopupWindowsController;
import com.posadskiy.swingteacherdesktop.models.ComboBoxModel;
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
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Lazy
@Component
public class MainFrameView extends JFrame {

    private final AppState appState;
    int taskCategory;
    int lesson;
    // Элементы интерфейса
    private JMenuBar menuBar;
    private JLabel lessonLabel;
    private JLabel taskLabel;
    private JComboBox lessonComboBox;
    private JComboBox taskComboBox;
    private JButton lookButton;
    private JButton checkButton;
    private JScrollPane answerScrollPane;
    private JScrollPane questionScrollPane;
    private JScrollPane documentationScrollPane;
    // Вспомогательные компоненты
    private MainFrameController mainFrameController;
    private PopupWindowsController popupWindowsController;
    private AppNavigator navigator;
    private AuthService authService;
    private User currentUser;
    // Данные из БД
    private List<Task> tasks;
    private List<Lesson> lessons;
    private List<CompletedTask> completedTasks;
    private List<Integer> completedTasksId;
    private TaskCategory categoryTask;

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

        // Получение объектов из БД (only if user is authenticated)
        if (currentUser != null && currentUser.getId() != null) {
            try {
                lessons = mainFrameController.getLessonByCategory(taskCategory);
                if (lessons != null && !lessons.isEmpty() && lessons.get(0) != null && lessons.get(0).getId() != null) {
                    lesson = lessons.get(0).getId();
                }
                tasks = mainFrameController.getTasksByLesson(lesson);

                Integer currentUserId = currentUser.getId();
                completedTasks = mainFrameController.getCompletedTaskByUserId(currentUserId);
            } catch (Exception e) {
                log.warn("Failed to load initial data, will retry later", e);
                lessons = new ArrayList<>();
                tasks = new ArrayList<>();
                completedTasks = new ArrayList<>();
            }
        } else {
            // No user authenticated yet, initialize with empty data
            lessons = new ArrayList<>();
            tasks = new ArrayList<>();
            completedTasks = new ArrayList<>();
        }

        completedTasksId = new ArrayList<>();
        for (CompletedTask completedTask : completedTasks) {
            completedTasksId.add(completedTask.getTaskId());
        }

        // Инициализация компонентов 
        menuBar = doCreateMenuBar();
        lessonLabel = doCreateLabel("Lesson");
        taskLabel = doCreateLabel("Task");

        lessonLabel.setFont(new Font("Times New Roman", Font.BOLD, 16));
        taskLabel.setFont(new Font("Times New Roman", Font.BOLD, 16));

        lessonComboBox = new JComboBox(new ComboBoxModel(lessons == null ? new ArrayList<>() : lessons));
        taskComboBox = new JComboBox(new ComboBoxModel(tasks == null ? new ArrayList<>() : tasks));

        lessonComboBox.setFont(new Font("Times New Roman", Font.PLAIN, 16));
        taskComboBox.setFont(new Font("Times New Roman", Font.PLAIN, 16));

        //taskComboBox.setRenderer(new ComplexCellRenderer());

        //if (currentUser.getCompleteTraining() == 0) {
        // (debug) taskComboBox.getEditor().getEditorComponent().getName()
        //}

        for (int i = 0; i < tasks.size(); ++i) {
            Task cTask = (Task) taskComboBox.getItemAt(i);
            if (completedTasksId.contains(cTask.getId())) {
                //taskComboBox.setSelectedItem(cTask);
                cTask.setTitle("☑ " + cTask.getTitle());
            }
        }

        if (!tasks.isEmpty()) {
            Task cTask = tasks.get(0);
            questionScrollPane = doCreateQuestionScrollPane(cTask.getQuestion());
            Documentation doc = mainFrameController.getDocumentation(cTask.getIdDocumentation());
            String docText = (doc != null && doc.getText() != null)
                ? doc.getText()
                : "Documentation not available";
            documentationScrollPane = doCreateDocumentationScrollPane(docText);
        } else {
            questionScrollPane = doCreateQuestionScrollPane("Question not available");
            documentationScrollPane = doCreateDocumentationScrollPane("Documentation not available");
        }

        answerScrollPane = doCreateAnswerScrollPane("");
        lookButton = doCreateButton("View");
        checkButton = doCreateButton("Check");


        // Связывание компонентов
        setJMenuBar(menuBar);

        MigLayout migLayout = new MigLayout("wrap 16", "grow, fill");
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


        // Добавление слушателей

        lessonComboBox.addActionListener(this::changeSelectedElementInLessonComboBox);

        taskComboBox.addActionListener(this::changeSelectedElementInTaskComboBox);

        lookButton.addActionListener(this::clickLookButton);

        checkButton.addActionListener(this::clickOkButton);

        // Настройка компонентов
        doSetupFrame();

    }

    public void doSetupFrame() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(1000, 600));
        //setPreferredSize(new Dimension(1000, 600));
        // setVisible(true) removed - frame should only be shown after successful authentication
        //pack();
        setLocationRelativeTo(null);
        setExtendedState(JFrame.MAXIMIZED_BOTH);
    }

    public void setLookAndFeel() {
        try {
            javax.swing.UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException
                 | ClassNotFoundException ex) {
            log.warn("Failed to set system Look&Feel", ex);
        }
    }

    public JMenuBar doCreateMenuBar() {

        Font font = new Font("Verdana", Font.PLAIN, 11);

        JMenuBar menuBar = new JMenuBar();

        JMenu settingsMenu = new JMenu("Settings");
        settingsMenu.setFont(font);

        JMenuItem logoutItem = new JMenuItem("Logout");
        logoutItem.setFont(font);
        logoutItem.addActionListener(e -> logout());
        settingsMenu.add(logoutItem);

        settingsMenu.addSeparator();

        JMenuItem exitItem = new JMenuItem("Exit");
        exitItem.setFont(font);
        settingsMenu.add(exitItem);

        exitItem.addActionListener(e -> System.exit(0));

        menuBar.add(settingsMenu);

        JMenu refMenu = new JMenu("Help");

        JMenuItem documentationItem = new JMenuItem("Documentation");
        documentationItem.setFont(font);
        documentationItem.addActionListener(e -> showDocumentation());
        refMenu.add(documentationItem);

        JMenuItem aboutProgram = new JMenuItem("About");
        aboutProgram.setFont(font);
        aboutProgram.addActionListener(e -> showAbout());
        refMenu.add(aboutProgram);

        menuBar.add(refMenu);

        return menuBar;

    }

    public JLabel doCreateLabel(String text) {
        JLabel label = new JLabel(text);

        return label;
    }

    public JButton doCreateButton(String text) {
        JButton button = new JButton(text);

        return button;
    }

    public JScrollPane doCreateDocumentationScrollPane(String text) {
        JEditorPane html = new JEditorPane();
        html.setContentType("text/html;Content-Type=windows-1251");
        html.setEditable(false);
        html.setText(text);
        TitledBorder tBorder = BorderFactory.createTitledBorder("Help");
        tBorder.setTitleFont(new Font("Serif", Font.BOLD, 15));
        html.setBorder(tBorder);

        JScrollPane scrollPane = new JScrollPane(html);
        return scrollPane;
    }

    public JScrollPane doCreateQuestionScrollPane(String text) {
        JEditorPane html = new JEditorPane();
        html.setContentType("text/html;Content-Type=windows-1251");
        html.setEditable(false);
        html.setText(text);
        TitledBorder tBorder = BorderFactory.createTitledBorder("Task");
        tBorder.setTitleFont(new Font("Serif", Font.BOLD, 15));
        html.setBorder(tBorder);
        JScrollPane scrollPane = new JScrollPane(html);
        scrollPane.setMinimumSize(new Dimension(500, 60));
        return scrollPane;
    }

    public JScrollPane doCreateAnswerScrollPane(String text) {
        RSyntaxTextArea textArea = new RSyntaxTextArea(text);

        TitledBorder tBorder = BorderFactory.createTitledBorder("Solution");
        tBorder.setTitleFont(new Font("Serif", Font.BOLD, 15));
        textArea.setBorder(tBorder);
        textArea.setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_JAVA);

        CompletionProvider provider = mainFrameController.createCompletionProvider();
        AutoCompletion ac = new AutoCompletion(provider);
        ac.install(textArea);

        JScrollPane scrollPane = new JScrollPane(textArea);
        return scrollPane;
    }

    public void changeSelectedElementInLessonComboBox(ActionEvent ae) {
        tasks = mainFrameController.getTasksByLesson(lessons.get(lessonComboBox.getSelectedIndex()).getId());
        taskComboBox.removeAllItems();
        JEditorPane pane = ((JEditorPane) documentationScrollPane.getViewport().getView());
        Task cTask = null;
        pane.setText("Reference information for this task is not available");
        if (!tasks.isEmpty()) {
            cTask = tasks.get(0);
            ((JEditorPane) questionScrollPane.getViewport().getView()).setText(cTask.getQuestion());
            Documentation doc = mainFrameController.getDocumentation(cTask.getIdDocumentation());
            String docText = (doc != null && doc.getText() != null)
                ? doc.getText()
                : "Reference information for this task is not available";
            pane.setText(docText);
            for (Task task : tasks)
                taskComboBox.addItem(task);
            for (int i = 0; i < tasks.size(); ++i) {
                cTask = (Task) taskComboBox.getItemAt(i);
                if (completedTasksId.contains(cTask.getId()))
                    cTask.setTitle("☑ " + cTask.getTitle());
            }
        }
    }

    public void changeSelectedElementInTaskComboBox(ActionEvent ae) {
        JEditorPane pane = (JEditorPane) questionScrollPane.getViewport().getView();
        JEditorPane paneDoc = (JEditorPane) documentationScrollPane.getViewport().getView();
        if (taskComboBox.getItemCount() != 0) {
            Task cTask = (Task) taskComboBox.getSelectedItem();
            pane.setText(cTask.getQuestion());
            paneDoc.setText(mainFrameController.getDocumentation(cTask.getIdDocumentation()).getText());
        } else {
            pane.setText("Question not available");
            paneDoc.setText("Documentation not available");
        }
    }

    public void clickLookButton(ActionEvent ae) {
        String imports = "";
        Object o = taskComboBox.getSelectedItem();
        if (o != null)
            imports = ((Task) o).getImports();
        mainFrameController.loadAndRunClassFromFile(
            ((JTextArea) answerScrollPane.getViewport().getView()).getText(), imports);
    }

    public void clickOkButton(ActionEvent ae) {
        String errors = null;
        if (taskComboBox.getItemCount() == 0) {
            popupWindowsController.createPopupWindow("Please select a question first!", "Error!");
            return;
        }
        Task cTask = (Task) taskComboBox.getSelectedItem();
        if (mainFrameController.getCompletedTaskByUserIdByTaskId(currentUser.getId(), cTask.getId()) != null) {
            popupWindowsController.createPopupWindow("Task already completed!", "Error!");
            return;
        }
            
        /*
        if (cTask.getAnswer() == null) {
            popupWindowsController.createPopupWindow("No answer available for this task", "Error!");
            return;
        }
        */
        JTextArea cTextArea = (JTextArea) answerScrollPane.getViewport().getView();
        errors = mainFrameController.isFileCompile(cTextArea.getText(), cTask.getImports());
        if (!errors.isEmpty()) {
            popupWindowsController.createPopupWindow(errors, "Compilation error!");
            return;
        }
        errors = mainFrameController.check(cTask.getAnswer(), cTextArea.getText());
        if (!errors.isEmpty()) {
            popupWindowsController.createPopupWindow(errors, "Task execution error!");
            return;
        }

        CompletedTask completedTask = new CompletedTask();
        completedTask.setTaskId(cTask.getId());
        completedTask.setUserId(currentUser.getId());
        mainFrameController.addCompletedTask(completedTask);
        completedTasksId.add(cTask.getId());
        cTask.setTitle("☑ " + cTask.getTitle());
        ((JTextArea) answerScrollPane.getViewport().getView()).setText("");
        popupWindowsController.createPopupWindow(new JFrame(), "Solution is correct!", "Ok");
        if (taskComboBox.getItemCount() > taskComboBox.getSelectedIndex() + 1)
            taskComboBox.setSelectedIndex(taskComboBox.getSelectedIndex() + 1);
    }

    public void setUser(User user) {
        this.currentUser = user;
    }

    public JComboBox getTaskComboBox() {
        return taskComboBox;
    }

    public List<Integer> getCompletedTasksId() {
        return completedTasksId;
    }

    private void logout() {
        authService.logout();
        appState.setCurrentUser(null);
        setVisible(false);
        navigator.showAuth();
    }

    private void showDocumentation() {
        try {
            Documentation doc = mainFrameController.getDocumentation(0); // ID 0 is application documentation
            String docText = (doc != null && doc.getText() != null)
                ? doc.getText()
                : "<h1>Documentation</h1><p>Documentation is not available.</p>";

            JDialog dialog = new JDialog(this, "Documentation", true);
            dialog.setSize(800, 600);
            dialog.setLocationRelativeTo(this);

            JEditorPane editorPane = new JEditorPane();
            editorPane.setContentType("text/html");
            editorPane.setEditable(false);
            editorPane.setText(docText);

            JScrollPane scrollPane = new JScrollPane(editorPane);
            scrollPane.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

            JButton closeButton = new JButton("Close");
            closeButton.addActionListener(e -> dialog.dispose());

            JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
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
        String aboutText = "<html><body style='font-family: Arial; padding: 20px;'>" +
            "<h1>SwingTeacher Desktop</h1>" +
            "<p><strong>Version:</strong> 1.0-SNAPSHOT</p>" +
            "<p><strong>Description:</strong> Educational Java programming application</p>" +
            "<p>This application helps you learn Java programming through interactive tasks and lessons.</p>" +
            "<hr>" +
            "<p><strong>Features:</strong></p>" +
            "<ul>" +
            "<li>Interactive Java code editor with syntax highlighting</li>" +
            "<li>Autocomplete support for keywords and code snippets</li>" +
            "<li>Task-based learning system</li>" +
            "<li>Progress tracking</li>" +
            "<li>Reference documentation</li>" +
            "</ul>" +
            "<hr>" +
            "<p><em>Built with Java 25 and Spring Framework</em></p>" +
            "</body></html>";

        JOptionPane.showMessageDialog(
            this,
            aboutText,
            "About SwingTeacher Desktop",
            JOptionPane.INFORMATION_MESSAGE
        );
    }
}
