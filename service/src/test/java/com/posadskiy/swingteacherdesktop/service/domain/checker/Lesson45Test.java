package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson45Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "JEditorPane-setContentType,setText,add";
        String userSolution = "JEditorPane editor = new JEditorPane();\neditor.setContentType(\"text/html\");\neditor.setText(\"<html><b>Bold text</b></html>\");\nadd(editor);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "JEditorPane-setContentType,setPage";
        String userSolution = "JEditorPane editor = new JEditorPane();\neditor.setContentType(\"text/html\");\nJLabel label = new JLabel();\ntry {\n    editor.setPage(new URL(\"https://example.com\"));\n} catch (IOException e) {\n    label.setText(\"Loading error: \" + e.getMessage());\n}\nJScrollPane scrollPane = new JScrollPane(editor);\nadd(scrollPane);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "JEditorPane-addHyperlinkListener,setPage,add";
        String userSolution = "JEditorPane editor = new JEditorPane();\neditor.setContentType(\"text/html\");\neditor.setText(\"<html><a href=\\\"https://example.com\\\">Link</a></html>\");\neditor.addHyperlinkListener(e -> {\n    if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {\n        try {\n            editor.setPage(e.getURL());\n        } catch (IOException ex) {\n            ex.printStackTrace();\n        }\n    }\n});\nJScrollPane scrollPane = new JScrollPane(editor);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "JEditorPane-setContentType";
        String userSolution = "JEditorPane editor = new JEditorPane();\neditor.setContentType(\"text/html\");\neditor.setText(\"<html><b>Text</b></html>\");\nJScrollPane scrollPane = new JScrollPane(editor);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String rightSolution = "JEditorPane-addHyperlinkListener,add";
        String userSolution = "JEditorPane editor = new JEditorPane();\neditor.setContentType(\"text/html\");\neditor.setText(\"<html><a href=\\\"https://example.com\\\">Link</a></html>\");\nJLabel label = new JLabel();\neditor.addHyperlinkListener(e -> {\n    if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {\n        label.setText(\"Link: \" + e.getURL());\n    }\n});\nJScrollPane scrollPane = new JScrollPane(editor);\nadd(scrollPane);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String rightSolution = "JEditorPane-setText";
        String userSolution = "JEditorPane editor = new JEditorPane();\neditor.setContentType(\"text/html\");\neditor.setText(\"<html><h1>Title</h1></html>\");\nJScrollPane scrollPane = new JScrollPane(editor);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "JButton-getActionCommand,add";
        String userSolution = "JButton button = new JButton(\"Button\");\nJLabel label = new JLabel();\nbutton.addActionListener(e -> {\n    String cmd = e.getActionCommand();\n    label.setText(\"Command: \" + cmd);\n});\nadd(button);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

