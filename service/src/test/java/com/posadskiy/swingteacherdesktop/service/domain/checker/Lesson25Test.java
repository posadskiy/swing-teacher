package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson25Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JMenu-add";
        String userSolution = "JMenu fileMenu = new JMenu(\"File\");\nJMenuItem openItem = new JMenuItem(\"Открыть\");\nfileMenu.add(openItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask1_2() {
        String expectedSolution = "JWindow-add,pack,setVisible";
        String userSolution = "JFrame parent = new JFrame();\nJWindow window = new JWindow(parent);\nwindow.add(new JLabel(\"Всплывающее окно\"));\nwindow.pack();\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JWindow-setAlwaysOnTop,setVisible";
        String userSolution = "JFrame parent = new JFrame();\nJWindow window = new JWindow(parent);\nwindow.setAlwaysOnTop(true);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JWindow-setBackground,setVisible";
        String userSolution = "JFrame parent = new JFrame();\nJWindow window = new JWindow(parent);\nwindow.setBackground(Color.LIGHT_GRAY);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JWindow-setAlwaysOnTop,setVisible";
        String userSolution = "JFrame parent = new JFrame();\nJWindow window = new JWindow(parent);\nwindow.setAlwaysOnTop(true);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JWindow-setBackground";
        String userSolution = "JFrame parent = new JFrame();\nJWindow window = new JWindow(parent);\nwindow.setBackground(Color.LIGHT_GRAY);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JSplitPane-setOneTouchExpandable";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setOneTouchExpandable(true);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JSplitPane-setContinuousLayout";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setContinuousLayout(true);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JSplitPane-setResizeWeight";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setResizeWeight(0.5);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

