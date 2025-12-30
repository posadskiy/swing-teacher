package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson35Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JFileChooser-showOpenDialog";
        String userSolution = "JFileChooser fileChooser = new JFileChooser();\nint result = fileChooser.showOpenDialog(this);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JFileChooser-showSaveDialog";
        String userSolution = "JFrame frame = new JFrame();\nJFileChooser fileChooser = new JFileChooser();\nint result = fileChooser.showSaveDialog(frame);\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Save to: \" + file.getPath());\n}";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JFileChooser-setFileFilter";
        String userSolution = "JFileChooser fileChooser = new JFileChooser();\nFileNameExtensionFilter filter = new FileNameExtensionFilter(\n    \"Text files\",\n    \"txt\", \"text\"\n);\nfileChooser.setFileFilter(filter);\nint result = fileChooser.showOpenDialog(this);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JFileChooser-setMultiSelectionEnabled,getSelectedFiles";
        String userSolution = "JFrame frame = new JFrame();\nJFileChooser fileChooser = new JFileChooser();\nfileChooser.setMultiSelectionEnabled(true);\nint result = fileChooser.showOpenDialog(frame);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File[] files = fileChooser.getSelectedFiles();\n    for (File file : files) {\n        label.setText(\"Selected: \" + file.getName());\n    }\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JFileChooser-addChoosableFileFilter";
        String userSolution = "JFileChooser fileChooser = new JFileChooser();\nFileFilter filter = new FileNameExtensionFilter(\"Text files\", \"txt\");\nfileChooser.addChoosableFileFilter(filter);\nint result = fileChooser.showOpenDialog(this);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JFileChooser-setCurrentDirectory";
        String userSolution = "JFileChooser fileChooser = new JFileChooser();\nFile dir = new File(\"/path/to/directory\");\nfileChooser.setCurrentDirectory(dir);\nint result = fileChooser.showOpenDialog(this);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JFileChooser-setDialogTitle";
        String userSolution = "JFrame frame = new JFrame();\nJFileChooser fileChooser = new JFileChooser();\nfileChooser.setDialogTitle(\"Choose file\");\nint result = fileChooser.showOpenDialog(frame);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JEditorPane-addHyperlinkListener,add";
        String userSolution = "JEditorPane editorPane = new JEditorPane();\neditorPane.setContentType(\"text/html\");\neditorPane.setText(\"<html><body><a href=\\\"http://example.com\\\">Link</a></body></html>\");\nJLabel label = new JLabel();\neditorPane.addHyperlinkListener(e -> {\n    if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {\n        label.setText(\"Link: \" + e.getURL());\n    }\n});\nadd(editorPane);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JEditorPane-setContentType,add";
        String userSolution = "JEditorPane editorPane = new JEditorPane();\neditorPane.setContentType(\"text/html\");\neditorPane.setText(\"<html><body><h1>Hello!</h1></body></html>\");\nJScrollPane scrollPane = new JScrollPane(editorPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JEditorPane-setEditable,add";
        String userSolution = "JEditorPane editorPane = new JEditorPane();\neditorPane.setText(\"Read-only text\");\neditorPane.setEditable(false);\nJScrollPane scrollPane = new JScrollPane(editorPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

