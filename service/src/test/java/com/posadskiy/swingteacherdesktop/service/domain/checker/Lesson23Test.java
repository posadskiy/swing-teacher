package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson23Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JToolBar-add";
        String userSolution = "JToolBar toolbar = new JToolBar();\ntoolbar.add(new JButton(\"Button 1\"));\ntoolbar.add(new JButton(\"Button 2\"));\nsetLayout(new BorderLayout());\nadd(toolbar, BorderLayout.NORTH);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JToolBar-setOrientation,add";
        String userSolution = "JToolBar toolbar = new JToolBar();\ntoolbar.add(new JButton(\"Button\"));\ntoolbar.setOrientation(JToolBar.VERTICAL);\nadd(toolbar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JToolBar-setFloatable,add";
        String userSolution = "JToolBar toolbar = new JToolBar();\ntoolbar.add(new JButton(\"Button\"));\ntoolbar.setFloatable(true);\nadd(toolbar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JToolBar-setRollover,add";
        String userSolution = "JToolBar toolbar = new JToolBar();\ntoolbar.add(new JButton(\"Button\"));\ntoolbar.setRollover(true);\nadd(toolbar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JToolBar-addSeparator,add";
        String userSolution = "JToolBar toolbar = new JToolBar();\ntoolbar.add(new JButton(\"Button 1\"));\ntoolbar.addSeparator();\ntoolbar.add(new JButton(\"Button 2\"));\nadd(toolbar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JToolBar-setBorder,add";
        String userSolution = "JToolBar toolbar = new JToolBar();\ntoolbar.add(new JButton(\"Button\"));\ntoolbar.setBorder(BorderFactory.createEtchedBorder());\nadd(toolbar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

