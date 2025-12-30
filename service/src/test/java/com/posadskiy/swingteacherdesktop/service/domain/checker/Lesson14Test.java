package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson14Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JProgressBar-setValue,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setValue(50);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JProgressBar-setMinimum,setMaximum,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar();\nprogressBar.setMinimum(0);\nprogressBar.setMaximum(100);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JProgressBar-setValue,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setValue(75);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JProgressBar-setOrientation,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setOrientation(JProgressBar.VERTICAL);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JProgressBar-setValue,setStringPainted,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setValue(50);\nprogressBar.setStringPainted(true);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JProgressBar-setValue,setForeground,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setValue(50);\nprogressBar.setForeground(Color.GREEN);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JProgressBar-setStringPainted,setFont,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setValue(50);\nprogressBar.setStringPainted(true);\nFont font = new Font(\"Arial\", Font.BOLD, 14);\nprogressBar.setFont(font);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JProgressBar-setPreferredSize,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setPreferredSize(new Dimension(300, 25));\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JProgressBar-setToolTipText";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nprogressBar.setToolTipText(\"Loading progress\");\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JProgressBar-setIndeterminate";
        String userSolution = "JProgressBar progressBar = new JProgressBar();\nprogressBar.setIndeterminate(true);\nadd(progressBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JProgressBar-addChangeListener,getValue,add";
        String userSolution = "JProgressBar progressBar = new JProgressBar(0, 100);\nJLabel label = new JLabel();\nprogressBar.addChangeListener(e -> {\n    int value = progressBar.getValue();\n    label.setText(\"Progress: \" + value + \"%\");\n});\nadd(progressBar);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

