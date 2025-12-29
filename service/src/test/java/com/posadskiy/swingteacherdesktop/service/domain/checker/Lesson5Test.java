package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson5Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson5Task1() {
        String expectedSolution = "JTextArea-add";
        String userSolution = "JTextArea area = new JTextArea();\nadd(area);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson5Task2() {
        String expectedSolution = "JTextArea-setLineWrap,setWrapStyleWord,add";
        String userSolution = "JTextArea area = new JTextArea();\narea.setLineWrap(true);\narea.setWrapStyleWord(true);\nadd(area);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

