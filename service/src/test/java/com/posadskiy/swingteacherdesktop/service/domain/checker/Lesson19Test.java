package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson19Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JWindow-setSize,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(400, 300);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JWindow-setSize,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(500, 400);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JWindow-setSize,setLocation,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(400, 300);\nwindow.setLocation(100, 100);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JWindow-setSize,setAlwaysOnTop,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(400, 300);\nwindow.setAlwaysOnTop(true);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JWindow-setSize,setBackground,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(400, 300);\nwindow.setBackground(Color.WHITE);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JWindow-setSize,setOpacity,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(400, 300);\nwindow.setOpacity(0.8f);\nwindow.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JWindow-setSize,setVisible,dispose";
        String userSolution = "JFrame frame = new JFrame();\nJWindow window = new JWindow(frame);\nwindow.setSize(400, 300);\nwindow.setVisible(true);\nwindow.dispose();";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

