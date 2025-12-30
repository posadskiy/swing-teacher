package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson7Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson7Task1() {
        String expectedSolution = "JCheckBox-add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Enable\");\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task2() {
        String expectedSolution = "JCheckBox-setSelected,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Enable\");\ncheckBox.setSelected(true);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task3() {
        String expectedSolution = "JPasswordField-setEchoChar,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\npasswordField.setEchoChar('●');\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task4() {
        String expectedSolution = "JPasswordField-getPassword,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\nchar[] password = passwordField.getPassword();\nJLabel label = new JLabel();\nif (password.length < 8) {\n    label.setText(\"Weak password!\");\n}\nadd(passwordField);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task5() {
        String expectedSolution = "JPasswordField-add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\nAbstractDocument doc = (AbstractDocument) passwordField.getDocument();\ndoc.setDocumentFilter(new DocumentFilter() {\n    @Override\n    public void remove(FilterBypass fb, int offset, int length) throws BadLocationException {\n        // Prevent deletion\n    }\n});\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task6() {
        String expectedSolution = "JPasswordField-setEchoChar,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\npasswordField.setEchoChar('●');\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task7() {
        String expectedSolution = "JPasswordField-getEchoChar,setEchoChar,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\nchar echoChar = passwordField.getEchoChar();\npasswordField.setEchoChar((char) 0);\n// Show password, then restore:\n// passwordField.setEchoChar(echoChar);\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task8() {
        String expectedSolution = "JPasswordField-getPassword,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\nchar[] password = passwordField.getPassword();\nboolean isStrong = password.length >= 8 && new String(password).matches(\".*[A-Z].*\");\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task9() {
        String expectedSolution = "JPasswordField-add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\nchar[] password = passwordField.getPassword();\nStringSelection selection = new StringSelection(new String(password));\nToolkit.getDefaultToolkit().getSystemClipboard().setContents(selection, null);\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson7Task10() {
        String expectedSolution = "JPasswordField-setEchoChar,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\npasswordField.setEchoChar('*');\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

