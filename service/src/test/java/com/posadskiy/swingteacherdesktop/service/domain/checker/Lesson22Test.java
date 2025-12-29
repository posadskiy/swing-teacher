package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson22Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JTabbedPane-addTab,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.addTab(\"Вкладка 2\", new JPanel());\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JTabbedPane-addTab,setTabPlacement,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.setTabPlacement(JTabbedPane.BOTTOM);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JTabbedPane-addTab,addTab,setSelectedIndex,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.addTab(\"Вкладка 2\", new JPanel());\ntabbedPane.setSelectedIndex(1);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JTabbedPane-addTab,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\nImageIcon icon = new ImageIcon(\"icon.png\");\ntabbedPane.addTab(\"Вкладка\", icon, new JPanel());\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JTabbedPane-addTab,setToolTipTextAt,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.setToolTipTextAt(0, \"Первая вкладка\");\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JTabbedPane-setEnabledAt";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.setEnabledAt(0, false);\nadd(tabbedPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JTabbedPane-addChangeListener,getSelectedIndex,add";
        String userSolution = "JTabbedPane tabbedPane = new JTabbedPane();\ntabbedPane.addTab(\"Вкладка 1\", new JPanel());\ntabbedPane.addTab(\"Вкладка 2\", new JPanel());\nJLabel label = new JLabel();\ntabbedPane.addChangeListener(e -> {\n    int index = tabbedPane.getSelectedIndex();\n    label.setText(\"Selected tab: \" + index);\n});\nadd(tabbedPane);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

