package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson24Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JMenuBar-add,setJMenuBar";
        String userSolution = "JMenuBar menuBar = new JMenuBar();\nJMenu fileMenu = new JMenu(\"Файл\");\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JScrollPane-setHorizontalScrollBarPolicy,setVerticalScrollBarPolicy,add";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nscrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);\nscrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JScrollPane-getViewport,add";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nJViewport viewport = scrollPane.getViewport();\nviewport.setViewPosition(new Point(0, 100));\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JScrollPane-setHorizontalScrollBarPolicy,add";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nscrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JScrollPane-setViewportBorder,add";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nBorder border = BorderFactory.createLineBorder(Color.GRAY);\nscrollPane.setViewportBorder(border);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JScrollPane-setColumnHeaderView";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nJLabel header = new JLabel(\"Header\");\nscrollPane.setColumnHeaderView(header);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JScrollPane-setRowHeaderView";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nJLabel header = new JLabel(\"Header\");\nscrollPane.setRowHeaderView(header);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JScrollPane-setViewportBorder,add";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nBorder border = BorderFactory.createLineBorder(Color.GRAY, 1);\nscrollPane.setViewportBorder(border);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

