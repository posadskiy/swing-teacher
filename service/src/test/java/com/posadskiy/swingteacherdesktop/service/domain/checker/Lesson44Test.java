package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson44Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "SpringLayout-setLayout;SpringLayout.Constraints-setX,setY";
        String userSolution = "SpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton button = new JButton(\"Button\");\nSpringLayout.Constraints constraints = layout.getConstraints(button);\nconstraints.setX(Spring.constant(10));\nconstraints.setY(Spring.constant(10));\nadd(button);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "SpringLayout-putConstraint;JButton-add";
        String userSolution = "SpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nadd(button1);\nadd(button2);\nlayout.putConstraint(SpringLayout.EAST, button1, 10, SpringLayout.WEST, button2);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "SpringLayout-setLayout";
        String userSolution = "SpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton button = new JButton(\"Button\");\nadd(button);\nSpring spring1 = Spring.constant(10);\nSpring spring2 = Spring.constant(20);\nSpring sum = Spring.sum(spring1, spring2);\nlayout.putConstraint(SpringLayout.WEST, button, sum, SpringLayout.WEST, this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String rightSolution = "SpringLayout-getConstraints";
        String userSolution = "SpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton component = new JButton(\"Button\");\nadd(component);\nSpringLayout.Constraints constraints = layout.getConstraints(component);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "SpringLayout-putConstraint";
        String userSolution = "SpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton component1 = new JButton(\"Button 1\");\nJButton component2 = new JButton(\"Button 2\");\nadd(component1);\nadd(component2);\nlayout.putConstraint(SpringLayout.WEST, component2, 10, SpringLayout.EAST, component1);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String rightSolution = "SpringLayout-constant,add";
        String userSolution = "Spring spring = Spring.constant(100);\nSpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton button = new JButton(\"Button\");\nadd(button);\nlayout.putConstraint(SpringLayout.WEST, button, spring, SpringLayout.WEST, this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String rightSolution = "SpringLayout-getConstraints";
        String userSolution = "SpringLayout layout = new SpringLayout();\nsetLayout(layout);\nJButton component = new JButton(\"Button\");\nadd(component);\nSpringLayout.Constraints constraints = layout.getConstraints(component);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

