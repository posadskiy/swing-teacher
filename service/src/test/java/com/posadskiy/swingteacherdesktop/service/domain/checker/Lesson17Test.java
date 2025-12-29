package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson17Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JFrame-setSize,setVisible";
        String userSolution = "JFrame frame = new JFrame(\"My application\");\nframe.setSize(800, 600);\nframe.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JFrame-setDefaultCloseOperation,setVisible";
        String userSolution = "JFrame frame = new JFrame(\"Application\");\nframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);\nframe.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

