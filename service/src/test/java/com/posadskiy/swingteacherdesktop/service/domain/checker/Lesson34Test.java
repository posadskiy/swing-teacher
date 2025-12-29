package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson34Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JOptionPane";
        String userSolution = "JOptionPane.showMessageDialog(null, \"Hello, world!\", \"Greeting\", JOptionPane.INFORMATION_MESSAGE);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JOptionPane";
        String userSolution = "int result = JOptionPane.showConfirmDialog(null, \"Are you sure?\", \"Confirmation\", JOptionPane.YES_NO_OPTION);\nJLabel label = new JLabel();\nif (result == JOptionPane.YES_OPTION) {\n    label.setText(\"User selected Yes\");\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JOptionPane";
        String userSolution = "String name = JOptionPane.showInputDialog(null, \"Enter your name:\", \"Input\", JOptionPane.QUESTION_MESSAGE);\nJLabel label = new JLabel();\nif (name != null && !name.isEmpty()) {\n    label.setText(\"Hello, \" + name + \"!\");\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JOptionPane";
        String userSolution = "String[] options = {\"Save\", \"Cancel\", \"Don't save\"};\nint choice = JOptionPane.showOptionDialog(null, \"Что делать?\", \"Выбор\", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[0]);\nJLabel label = new JLabel(\"Выбрано: \" + choice);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

