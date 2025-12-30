package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson40Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "GridBagLayout-add";
        String userSolution = "setLayout(new GridBagLayout());\nGridBagConstraints gbc = new GridBagConstraints();\ngbc.gridx = 0;\ngbc.gridy = 0;\ngbc.fill = GridBagConstraints.HORIZONTAL;\nJButton button = new JButton(\"Button\");\nadd(button, gbc);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "GridBagLayout-add";
        String userSolution = "setLayout(new GridBagLayout());\nGridBagConstraints gbc = new GridBagConstraints();\ngbc.gridx = 0;\ngbc.gridy = 0;\ngbc.weightx = 1.0;\ngbc.weighty = 1.0;\ngbc.fill = GridBagConstraints.BOTH;\nJButton button = new JButton(\"Button\");\nadd(button, gbc);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2_2() {
        String expectedSolution = "FlowLayout-setLayout";
        String userSolution = "FlowLayout layout = new FlowLayout(FlowLayout.CENTER);\nsetLayout(layout);\nJButton button = new JButton(\"Button\");\nadd(button);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "GridBagConstraints-gridx,gridy,gridwidth,gridheight,fill";
        String userSolution = "setLayout(new GridBagLayout());\nGridBagConstraints gbc = new GridBagConstraints();\ngbc.gridx = 0;\ngbc.gridy = 0;\ngbc.gridwidth = 2;\ngbc.gridheight = 2;\ngbc.fill = GridBagConstraints.BOTH;\nJButton button = new JButton(\"Button\");\nadd(button, gbc);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3_2() {
        String expectedSolution = "FlowLayout-setHgap,setVgap,add";
        String userSolution = "FlowLayout layout = new FlowLayout();\nlayout.setHgap(10);\nlayout.setVgap(10);\nsetLayout(layout);\nJButton button = new JButton(\"Button\");\nadd(button);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "GridBagLayout-add";
        String userSolution = "setLayout(new GridBagLayout());\nGridBagConstraints constraints = new GridBagConstraints();\nconstraints.gridx = 0;\nconstraints.gridy = 0;\nconstraints.anchor = GridBagConstraints.CENTER;\nJButton button = new JButton(\"Button\");\nadd(button, constraints);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JOptionPane-showInputDialog";
        String userSolution = "String input = JOptionPane.showInputDialog(\"Enter name:\");\nJLabel label = new JLabel();\nif (input != null) {\n    label.setText(\"Entered: \" + input);\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8_2() {
        String expectedSolution = "GridBagLayout-add";
        String userSolution = "setLayout(new GridBagLayout());\nGridBagConstraints constraints = new GridBagConstraints();\nconstraints.gridx = 0;\nconstraints.gridy = 0;\nconstraints.fill = GridBagConstraints.BOTH;\nJButton button = new JButton(\"Button\");\nadd(button, constraints);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JOptionPane-showConfirmDialog";
        String userSolution = "int result = JOptionPane.showConfirmDialog(null, \"Confirm action?\", \"Confirmation\", JOptionPane.YES_NO_OPTION);\nJLabel label = new JLabel();\nif (result == JOptionPane.YES_OPTION) {\n    label.setText(\"Confirmed!\");\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JOptionPane-showMessageDialog";
        String userSolution = "JOptionPane.showMessageDialog(null, \"Operation completed\", \"Information\", JOptionPane.INFORMATION_MESSAGE);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

