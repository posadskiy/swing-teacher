package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson8Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson8Task1() {
        String expectedSolution = "JRadioButton-add";
        String userSolution = "JRadioButton radio = new JRadioButton(\"Option 1\");\nadd(radio);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson8Task2() {
        String expectedSolution = "JRadioButton-add;JRadioButton-add";
        String userSolution = "ButtonGroup group = new ButtonGroup();\nJRadioButton radio1 = new JRadioButton(\"Option 1\");\nJRadioButton radio2 = new JRadioButton(\"Option 2\");\ngroup.add(radio1);\ngroup.add(radio2);\nadd(radio1);\nadd(radio2);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

