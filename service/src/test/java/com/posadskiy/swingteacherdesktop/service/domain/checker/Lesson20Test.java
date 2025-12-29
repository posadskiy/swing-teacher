package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson20Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JScrollPane-add";
        String userSolution = "JTextArea area = new JTextArea(\"Long text...\");\nJScrollPane scrollPane = new JScrollPane(area);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JPanel-setDoubleBuffered,add";
        String userSolution = "JPanel panel = new JPanel();\npanel.setDoubleBuffered(true);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask12() {
        String expectedSolution = "JPanel-setPreferredSize,add";
        String userSolution = "JPanel panel = new JPanel();\npanel.setPreferredSize(new Dimension(200, 100));\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask13() {
        String expectedSolution = "JPanel-setMinimumSize,add";
        String userSolution = "JPanel panel = new JPanel();\npanel.setMinimumSize(new Dimension(100, 50));\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask14() {
        String expectedSolution = "JPanel-setMaximumSize,add";
        String userSolution = "JPanel panel = new JPanel();\npanel.setMaximumSize(new Dimension(500, 300));\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

