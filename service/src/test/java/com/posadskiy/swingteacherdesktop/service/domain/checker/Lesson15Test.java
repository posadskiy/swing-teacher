package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson15Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JScrollBar-add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JScrollBar-setOrientation,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar();\nscrollBar.setOrientation(JScrollBar.HORIZONTAL);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JScrollBar-setMinimum,setMaximum,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar();\nscrollBar.setMinimum(0);\nscrollBar.setMaximum(1000);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JScrollBar-setValue,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 1000);\nscrollBar.setValue(500);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JScrollBar-setUnitIncrement,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setUnitIncrement(10);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JScrollBar-setBlockIncrement,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setBlockIncrement(50);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JScrollBar-setForeground,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setForeground(Color.BLUE);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JScrollBar-setPreferredSize,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setPreferredSize(new Dimension(20, 200));\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JScrollBar-setToolTipText";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setToolTipText(\"Прокрутка контента\");\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JScrollBar-addAdjustmentListener,getValue,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nJLabel label = new JLabel();\nscrollBar.addAdjustmentListener(e -> {\n    int value = scrollBar.getValue();\n    label.setText(\"Позиция: \" + value);\n});\nadd(scrollBar);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

