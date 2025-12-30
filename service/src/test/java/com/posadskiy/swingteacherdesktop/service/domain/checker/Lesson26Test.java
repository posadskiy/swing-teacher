package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson26Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JMenuItem-addActionListener,add";
        String userSolution = "JMenuItem openItem = new JMenuItem(\"Open\");\nJLabel label = new JLabel();\nopenItem.addActionListener(e -> label.setText(\"Open\"));\nJMenu fileMenu = new JMenu(\"File\");\nfileMenu.add(openItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JSplitPane-setDividerLocation,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setDividerLocation(200);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JSplitPane-setOneTouchExpandable,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setOneTouchExpandable(true);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JSplitPane-setDividerLocation,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setDividerLocation(200);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JSplitPane-setContinuousLayout,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setContinuousLayout(true);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JSplitPane-setResizeWeight";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setResizeWeight(0.5);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JTabbedPane-setEnabledAt";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Tab 1\", new JPanel());\ntabbedPane.setEnabledAt(0, false);\ntabbedPane.setEnabledAt(0, true);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask12() {
        String expectedSolution = "JTabbedPane-setMnemonicAt,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Tab\", new JPanel());\ntabbedPane.setMnemonicAt(0, KeyEvent.VK_T);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask13() {
        String expectedSolution = "JTabbedPane-setTabPlacement";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Tab 1\", new JPanel());\ntabbedPane.setTabPlacement(JTabbedPane.BOTTOM);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

