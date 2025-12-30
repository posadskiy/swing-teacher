package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson37Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "BorderLayout-add";
        String userSolution = "setLayout(new BorderLayout());\nadd(new JButton(\"North\"), BorderLayout.NORTH);\nadd(new JButton(\"South\"), BorderLayout.SOUTH);\nadd(new JButton(\"Center\"), BorderLayout.CENTER);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "BorderLayout-add";
        String userSolution = "setLayout(new BorderLayout());\nadd(new JButton(\"North\"), BorderLayout.NORTH);\nadd(new JButton(\"South\"), BorderLayout.SOUTH);\nadd(new JButton(\"West\"), BorderLayout.WEST);\nadd(new JButton(\"East\"), BorderLayout.EAST);\nadd(new JButton(\"Center\"), BorderLayout.CENTER);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "BorderLayout-add";
        String userSolution = "setLayout(new BorderLayout(10, 10));\nadd(new JButton(\"North\"), BorderLayout.NORTH);\nadd(new JButton(\"Center\"), BorderLayout.CENTER);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JButton-setPreferredSize,add";
        String userSolution = "JButton button = new JButton(\"Button\");\nbutton.setPreferredSize(new Dimension(100, 30));\nsetLayout(new BorderLayout());\nadd(button, BorderLayout.NORTH);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

