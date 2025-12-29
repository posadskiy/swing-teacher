package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson1Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson1Task0() {
        String expectedSolution = "";
        String userSolution = "";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

