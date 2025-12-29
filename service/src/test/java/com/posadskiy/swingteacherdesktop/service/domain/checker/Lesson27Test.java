package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson27Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JCheckBoxMenuItem-setSelected,add";
        String userSolution = "JCheckBoxMenuItem showToolbar = new JCheckBoxMenuItem(\"Show panel\");\nshowToolbar.setSelected(true);\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(showToolbar);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JTabbedPane-addTab,addTab,setSelectedIndex,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.addTab(\"Вкладка 2\", new JPanel());\ntabbedPane.setSelectedIndex(1);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JTabbedPane-addTab,setTabPlacement,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.setTabPlacement(JTabbedPane.BOTTOM);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JTabbedPane-addTab,setToolTipTextAt,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\nJPanel panel = new JPanel();\ntabbedPane.addTab(\"Вкладка\", panel);\ntabbedPane.setToolTipTextAt(0, \"Описание\");\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JTabbedPane-addTab,setEnabledAt,setEnabledAt,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.setEnabledAt(0, false);\ntabbedPane.setEnabledAt(0, true);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JTabbedPane-indexOfTab,getSelectedIndex,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка\", new JPanel());\nint index = tabbedPane.indexOfTab(\"Вкладка\");\nint selected = tabbedPane.getSelectedIndex();\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6_2() {
        String expectedSolution = "JToolBar-addSeparator";
        String userSolution = "JToolBar toolBar = new JToolBar();\ntoolBar.add(new JButton(\"Кнопка 1\"));\ntoolBar.addSeparator();\ntoolBar.add(new JButton(\"Кнопка 2\"));\nadd(toolBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JToolBar-addSeparator";
        String userSolution = "JToolBar toolBar = new JToolBar();\ntoolBar.add(new JButton(\"Кнопка 1\"));\ntoolBar.addSeparator();\ntoolBar.add(new JButton(\"Кнопка 2\"));\nadd(toolBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JToolBar-setOrientation,add";
        String userSolution = "JToolBar toolBar = new JToolBar();\ntoolBar.add(new JButton(\"Кнопка\"));\ntoolBar.setOrientation(SwingConstants.VERTICAL);\nadd(toolBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

