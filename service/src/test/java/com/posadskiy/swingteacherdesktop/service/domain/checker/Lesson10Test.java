package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson10Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JComboBox-add";
        String userSolution = "String[] items = {\"Option 1\", \"Option 2\", \"Option 3\"};\nJComboBox combo = new JComboBox(items);\nadd(combo);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JComboBox-setEditable,add";
        String userSolution = "String[] items = {\"Option 1\", \"Option 2\", \"Option 3\"};\nJComboBox<String> combo = new JComboBox<>(items);\ncombo.setEditable(true);\nadd(combo);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JList-setSelectionMode,add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\"};\nJList<String> list = new JList<>(items);\nlist.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);\nadd(list);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JRadioButton-add;JRadioButton-add;JRadioButton-add";
        String userSolution = "ButtonGroup group = new ButtonGroup();\nJRadioButton radio1 = new JRadioButton(\"Option 1\");\nJRadioButton radio2 = new JRadioButton(\"Option 2\");\nJRadioButton radio3 = new JRadioButton(\"Option 3\");\ngroup.add(radio1);\ngroup.add(radio2);\ngroup.add(radio3);\nadd(radio1);\nadd(radio2);\nadd(radio3);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JRadioButton-setIcon,setSelectedIcon,add";
        String userSolution = "JRadioButton radioButton = new JRadioButton(\"Option\");\nradioButton.setIcon(new ImageIcon(\"unselected.png\"));\nradioButton.setSelectedIcon(new ImageIcon(\"selected.png\"));\nadd(radioButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JRadioButton-add;JRadioButton-add";
        String userSolution = "ButtonGroup group = new ButtonGroup();\nJRadioButton radioButton1 = new JRadioButton(\"Option 1\");\nJRadioButton radioButton2 = new JRadioButton(\"Option 2\");\ngroup.add(radioButton1);\ngroup.add(radioButton2);\nadd(radioButton1);\nadd(radioButton2);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JRadioButton-setMnemonic,add";
        String userSolution = "JRadioButton radioButton = new JRadioButton(\"Red (&R)\");\nradioButton.setMnemonic(KeyEvent.VK_R);\nadd(radioButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JRadioButton-addItemListener,add";
        String userSolution = "JRadioButton radioButton = new JRadioButton(\"Option\");\nJLabel label = new JLabel();\nradioButton.addItemListener(e -> {\n    if (e.getStateChange() == ItemEvent.SELECTED) {\n        label.setText(\"Selected!\");\n    }\n});\nadd(radioButton);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JRadioButton-setActionCommand,addActionListener,add";
        String userSolution = "JRadioButton radioButton = new JRadioButton(\"Option 1\");\nradioButton.setActionCommand(\"OPTION1\");\nradioButton.addActionListener(e -> {\n    String cmd = e.getActionCommand();\n        label.setText(\"Command: \" + cmd);\n});\nadd(radioButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JRadioButton-setFont,add";
        String userSolution = "JRadioButton radioButton = new JRadioButton(\"Option\");\nFont font = new Font(\"Arial\", Font.ITALIC, 12);\nradioButton.setFont(font);\nadd(radioButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JRadioButton-setBorderPainted,add";
        String userSolution = "JRadioButton radioButton = new JRadioButton(\"Option\");\nradioButton.setBorderPainted(true);\nadd(radioButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

