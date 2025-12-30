package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson21Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JSplitPane-add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JPanel;JSplitPane-add";
        String userSolution = "JPanel topPanel = new JPanel();\nJPanel bottomPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT, topPanel, bottomPanel);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JSplitPane-setDividerLocation,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setDividerLocation(200);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JSplitPane-setResizeWeight,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setResizeWeight(0.3);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JSplitPane-setOneTouchExpandable,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setOneTouchExpandable(true);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JSplitPane-setContinuousLayout";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setContinuousLayout(true);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JSplitPane-setBorder,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nsplitPane.setBorder(BorderFactory.createEtchedBorder());\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JSplitPane-setMinimumSize,add";
        String userSolution = "JPanel leftPanel = new JPanel();\nJPanel rightPanel = new JPanel();\nleftPanel.setMinimumSize(new Dimension(100, 0));\nJSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);\nadd(splitPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

