package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson18Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JDialog-setSize,setVisible";
        String userSolution = "JFrame parent = new JFrame();\nJDialog dialog = new JDialog(parent, \"Dialog\", true);\ndialog.setSize(400, 300);\ndialog.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JScrollBar-addAdjustmentListener,getValue,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nJLabel label = new JLabel();\nscrollBar.addAdjustmentListener(e -> {\n    int value = e.getValue();\n    label.setText(\"Value: \" + value);\n});\nadd(scrollBar);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JScrollBar-setUnitIncrement,setBlockIncrement,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setUnitIncrement(10);\nscrollBar.setBlockIncrement(50);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JScrollBar-setUnitIncrement,setBlockIncrement,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setUnitIncrement(20);\nscrollBar.setBlockIncrement(100);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JScrollBar-setOrientation,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar();\nscrollBar.setOrientation(JScrollBar.HORIZONTAL);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JScrollBar-setBlockIncrement,add";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setBlockIncrement(100);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JScrollBar-setUnitIncrement";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setUnitIncrement(10);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JScrollBar-setValue";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 200);\nscrollBar.setValue(100);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JScrollBar-setBlockIncrement";
        String userSolution = "JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);\nscrollBar.setBlockIncrement(50);\nadd(scrollBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

