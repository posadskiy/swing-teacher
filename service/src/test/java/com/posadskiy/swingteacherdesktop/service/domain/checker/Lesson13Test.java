package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson13Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask2() {
        String expectedSolution = "JSlider-setMajorTickSpacing,setPaintTicks,setPaintLabels,add";
        String userSolution = "JSlider slider = new JSlider(0, 100, 50);\nslider.setMajorTickSpacing(10);\nslider.setPaintTicks(true);\nslider.setPaintLabels(true);\nadd(slider);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

