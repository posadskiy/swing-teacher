package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson48Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "FocusListener-addFocusListener,add";
        String userSolution = "JLabel label = new JLabel();\nFocusListener listener = new FocusListener() {\n    @Override\n    public void focusGained(FocusEvent e) {\n        label.setText(\"Focus gained!\");\n    }\n    @Override\n    public void focusLost(FocusEvent e) {\n        label.setText(\"Focus lost!\");\n    }\n};\nJTextField field = new JTextField();\nfield.addFocusListener(listener);\nadd(field);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "JTextField-addFocusListener,add";
        String userSolution = "JTextField textField = new JTextField();\nJLabel label = new JLabel();\ntextField.addFocusListener(new FocusListener() {\n    @Override\n    public void focusGained(FocusEvent e) {}\n    @Override\n    public void focusLost(FocusEvent e) {\n        String text = textField.getText();\n        if (text.isEmpty()) {\n            textField.setBackground(Color.RED);\n            label.setText(\"Field cannot be empty!\");\n        } else {\n            textField.setBackground(Color.WHITE);\n        }\n    }\n});\nadd(textField);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "JTextField-setFocusable,setFocusTraversalKeysEnabled,requestFocus";
        String userSolution = "JTextField component = new JTextField();\ncomponent.setFocusable(true);\ncomponent.setFocusTraversalKeysEnabled(true);\ncomponent.requestFocus();\nadd(component);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

