package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson43Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "GroupLayout-setHorizontalGroup,setVerticalGroup,add";
        String userSolution = "JPanel panel = new JPanel();\nGroupLayout layout = new GroupLayout(panel);\npanel.setLayout(layout);\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nGroupLayout.SequentialGroup hGroup = layout.createSequentialGroup();\nhGroup.addComponent(button1);\nhGroup.addComponent(button2);\nlayout.setHorizontalGroup(hGroup);\nGroupLayout.ParallelGroup vGroup = layout.createParallelGroup();\nvGroup.addComponent(button1);\nvGroup.addComponent(button2);\nlayout.setVerticalGroup(vGroup);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "GroupLayout-addComponent,addGap,addComponent,add";
        String userSolution = "JPanel panel = new JPanel();\nGroupLayout layout = new GroupLayout(panel);\npanel.setLayout(layout);\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nlayout.setHorizontalGroup(\n    layout.createSequentialGroup()\n        .addComponent(button1)\n        .addGap(10)\n        .addComponent(button2)\n);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "GroupLayout-createParallelGroup,setHorizontalGroup,add";
        String userSolution = "JPanel panel = new JPanel();\nGroupLayout layout = new GroupLayout(panel);\npanel.setLayout(layout);\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nlayout.setHorizontalGroup(\n    layout.createParallelGroup()\n        .addComponent(button1)\n        .addComponent(button2)\n);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "GroupLayout-createSequentialGroup,addComponent,add";
        String userSolution = "JPanel panel = new JPanel();\nGroupLayout layout = new GroupLayout(panel);\npanel.setLayout(layout);\nJButton component1 = new JButton(\"Button 1\");\nJButton component2 = new JButton(\"Button 2\");\nGroupLayout.SequentialGroup hGroup = layout.createSequentialGroup();\nhGroup.addComponent(component1).addComponent(component2);\nlayout.setHorizontalGroup(hGroup);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String rightSolution = "GroupLayout-createParallelGroup,addComponent,add";
        String userSolution = "JPanel panel = new JPanel();\nGroupLayout layout = new GroupLayout(panel);\npanel.setLayout(layout);\nJButton component1 = new JButton(\"Button 1\");\nJButton component2 = new JButton(\"Button 2\");\nGroupLayout.ParallelGroup vGroup = layout.createParallelGroup();\nvGroup.addComponent(component1).addComponent(component2);\nlayout.setVerticalGroup(vGroup);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String rightSolution = "GroupLayout-addGap";
        String userSolution = "JPanel panel = new JPanel();\nGroupLayout layout = new GroupLayout(panel);\npanel.setLayout(layout);\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nGroupLayout.SequentialGroup hGroup = layout.createSequentialGroup();\nhGroup.addComponent(button1).addGap(10).addComponent(button2);\nlayout.setHorizontalGroup(hGroup);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

