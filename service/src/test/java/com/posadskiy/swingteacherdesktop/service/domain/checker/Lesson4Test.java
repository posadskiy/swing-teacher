package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson4Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson4Task1() {
        String expectedSolution = "JTextField-add";
        String userSolution = "JTextField field = new JTextField();\nadd(field);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task2() {
        String expectedSolution = "JTextField-setText,add";
        String userSolution = "JTextField field = new JTextField();\nfield.setText(\"Enter name\");\nadd(field);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task3() {
        String expectedSolution = "JTextField-setColumns,add";
        String userSolution = "JTextField field = new JTextField();\nfield.setColumns(20);\nadd(field);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task4() {
        String expectedSolution = "JTextField-setBackground,setForeground,add";
        String userSolution = "JTextField field = new JTextField();\nfield.setBackground(Color.YELLOW);\nfield.setForeground(Color.BLACK);\nadd(field);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task5() {
        String expectedSolution = "JTextField-setEditable,add";
        String userSolution = "JTextField field = new JTextField(\"Text\");\nfield.setEditable(false);\nadd(field);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task6() {
        String expectedSolution = "JTextField-setToolTipText,add";
        String userSolution = "JTextField textField = new JTextField();\ntextField.setToolTipText(\"Enter your name\");\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task7() {
        String expectedSolution = "JTextField-add";
        String userSolution = "JTextField textField = new JTextField();\nAbstractDocument doc = (AbstractDocument) textField.getDocument();\ndoc.setDocumentFilter(new DocumentFilter() {\n    @Override\n    public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) throws BadLocationException {\n        if (string.matches(\"\\\\d+\")) {\n            super.insertString(fb, offset, string, attr);\n        }\n    }\n});\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task8() {
        String expectedSolution = "JTextField-setCaretPosition,add";
        String userSolution = "JTextField textField = new JTextField(\"Text\");\ntextField.setCaretPosition(0);\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task9() {
        String expectedSolution = "JTextField-selectAll,add";
        String userSolution = "JTextField textField = new JTextField(\"Text\");\ntextField.selectAll();\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task10() {
        String expectedSolution = "JTextField-select,replaceSelection,add";
        String userSolution = "JTextField textField = new JTextField(\"Old text\");\ntextField.select(0, 5);\ntextField.replaceSelection(\"New text\");\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task11() {
        String expectedSolution = "JTextField-add";
        String userSolution = "JTextField textField = new JTextField();\nAbstractDocument doc = (AbstractDocument) textField.getDocument();\ndoc.setDocumentFilter(new DocumentFilter() {\n    @Override\n    public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) throws BadLocationException {\n        if (string.matches(\"[0-9]+\")) {\n            super.insertString(fb, offset, string, attr);\n        }\n    }\n});\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task12() {
        String expectedSolution = "JTextField-setCaretPosition,add";
        String userSolution = "JTextField textField = new JTextField(\"Text\");\ntextField.setCaretPosition(5);\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task13() {
        String expectedSolution = "JTextField-selectAll,add";
        String userSolution = "JTextField textField = new JTextField(\"Text\");\ntextField.selectAll();\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson4Task14() {
        String expectedSolution = "JTextField-setHorizontalAlignment,add";
        String userSolution = "JTextField textField = new JTextField(\"Text\");\ntextField.setHorizontalAlignment(JTextField.CENTER);\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

