package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson33Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JTextPane-add";
        String userSolution = "JTextPane textPane = new JTextPane();\nStyledDocument doc = textPane.getStyledDocument();\nStyle style = textPane.addStyle(\"bold\", null);\nStyleConstants.setBold(style, true);\ntry {\n    doc.insertString(0, \"Bold text\", style);\n} catch (BadLocationException e) {\n    e.printStackTrace();\n}\nadd(textPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JTextPane-getSelectionStart,getSelectionEnd,add";
        String userSolution = "JTextPane textPane = new JTextPane();\ntextPane.setText(\"Select this text\");\nint start = textPane.getSelectionStart();\nint end = textPane.getSelectionEnd();\nStyle style = textPane.addStyle(\"bold\", null);\nStyleConstants.setBold(style, true);\nStyledDocument doc = textPane.getStyledDocument();\ndoc.setCharacterAttributes(start, end - start, style, false);\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JTextPane-setFont,add";
        String userSolution = "JTextPane textPane = new JTextPane();\ntextPane.setFont(new Font(\"Arial\", Font.BOLD, 14));\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JTextPane-getStyledDocument,add";
        String userSolution = "JTextPane textPane = new JTextPane();\nStyledDocument doc = textPane.getStyledDocument();\ntry {\n    doc.insertString(0, \"Text\", null);\n} catch (BadLocationException e) {\n    e.printStackTrace();\n}\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JTextPane-setCharacterAttributes,add";
        String userSolution = "JTextPane textPane = new JTextPane();\ntextPane.setText(\"Text for styling\");\nStyledDocument doc = textPane.getStyledDocument();\nStyle style = doc.addStyle(\"bold\", null);\nStyleConstants.setBold(style, true);\ndoc.setCharacterAttributes(0, 5, style, false);\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JTextPane-getText,add";
        String userSolution = "JTextPane textPane = new JTextPane();\ntextPane.setText(\"Text\");\nString text = textPane.getText();\nJLabel label = new JLabel(\"Text: \" + text);\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6_2() {
        String expectedSolution = "MouseListener-getButton,add";
        String userSolution = "JPanel component = new JPanel();\ncomponent.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON1) {\n            label.setText(\"Left button\");\n        }\n    }\n});\nadd(component);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "MouseListener-getX,getY,add";
        String userSolution = "JPanel component = new JPanel();\ncomponent.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        int x = e.getX();\n        int y = e.getY();\n        label.setText(\"Coordinates: \" + x + \", \" + y);\n    }\n});\nadd(component);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "MouseListener-getClickCount,add";
        String userSolution = "JPanel component = new JPanel();\ncomponent.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        int count = e.getClickCount();\n        if (count == 2) {\n            label.setText(\"Double click\");\n        }\n    }\n});\nadd(component);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

