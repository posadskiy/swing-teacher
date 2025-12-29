package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson41Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "BoxLayout-add";
        String userSolution = "setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nJButton button3 = new JButton(\"Button 3\");\nadd(button1);\nadd(button2);\nadd(button3);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "Box-createGlue,add,add,add";
        String userSolution = "setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nadd(button1);\nadd(Box.createGlue());\nadd(button2);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "Component-setAlignmentX-setAlignmentY-CENTER_ALIGNMENT";
        String userSolution = "setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));\nJButton button = new JButton(\"Кнопка\");\nbutton.setAlignmentX(Component.CENTER_ALIGNMENT);\nbutton.setAlignmentY(Component.CENTER_ALIGNMENT);\nadd(button);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "BoxLayout-createHorizontalGlue,add,add,add";
        String userSolution = "setLayout(new BoxLayout(this, BoxLayout.X_AXIS));\nJButton button1 = new JButton(\"Button 1\");\nJButton button2 = new JButton(\"Button 2\");\nComponent glue = Box.createHorizontalGlue();\nadd(button1);\nadd(glue);\nadd(button2);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String rightSolution = "JFileChooser-setMultiSelectionEnabled,getSelectedFiles";
        String userSolution = "JFrame frame = new JFrame();\nJFileChooser fileChooser = new JFileChooser();\nfileChooser.setMultiSelectionEnabled(true);\nint result = fileChooser.showOpenDialog(frame);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File[] files = fileChooser.getSelectedFiles();\n    for (File file : files) {\n        label.setText(\"Selected: \" + file.getName());\n    }\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String rightSolution = "JFileChooser-addChoosableFileFilter";
        String userSolution = "JFrame frame = new JFrame();\nJFileChooser fileChooser = new JFileChooser();\nFileNameExtensionFilter filter = new FileNameExtensionFilter(\"Изображения\", \"jpg\", \"png\", \"gif\");\nfileChooser.addChoosableFileFilter(filter);\nint result = fileChooser.showOpenDialog(frame);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String rightSolution = "JFileChooser-setCurrentDirectory";
        String userSolution = "JFrame frame = new JFrame();\nJFileChooser fileChooser = new JFileChooser();\nFile dir = new File(\"/path/to/directory\");\nfileChooser.setCurrentDirectory(dir);\nint result = fileChooser.showOpenDialog(frame);\nJLabel label = new JLabel();\nif (result == JFileChooser.APPROVE_OPTION) {\n    File file = fileChooser.getSelectedFile();\n    label.setText(\"Selected file: \" + file.getName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

