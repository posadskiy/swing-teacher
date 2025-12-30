package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson12Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask2() {
        String expectedSolution = "JToggleButton-addActionListener,isSelected,add";
        String userSolution = "JToggleButton toggleButton = new JToggleButton(\"Enable\");\nJLabel label = new JLabel();\ntoggleButton.addActionListener(e -> {\n    if (toggleButton.isSelected()) {\n        label.setText(\"Enabled!\");\n    } else {\n        label.setText(\"Disabled!\");\n    }\n});\nadd(toggleButton);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JToggleButton-setMnemonic,add";
        String userSolution = "JToggleButton toggleButton = new JToggleButton(\"Enable (&T)\");\ntoggleButton.setMnemonic(KeyEvent.VK_T);\nadd(toggleButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JToggleButton-addItemListener,isSelected,add";
        String userSolution = "JToggleButton toggleButton = new JToggleButton(\"Enable\");\ntoggleButton.addItemListener(e -> {\n    boolean selected = toggleButton.isSelected();\n    label.setText(\"Enabled: \" + selected);\n});\nadd(toggleButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JToggleButton-setActionCommand,addActionListener,add";
        String userSolution = "JToggleButton toggleButton = new JToggleButton(\"Enable\");\ntoggleButton.setActionCommand(\"TOGGLE\");\ntoggleButton.addActionListener(e -> {\n    String cmd = e.getActionCommand();\n    label.setText(\"Command: \" + cmd);\n});\nadd(toggleButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JToggleButton-setFont,add";
        String userSolution = "JToggleButton toggleButton = new JToggleButton(\"Enable\");\nFont font = new Font(\"Serif\", Font.PLAIN, 16);\ntoggleButton.setFont(font);\nadd(toggleButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JToggleButton-setBorderPainted,add";
        String userSolution = "JToggleButton toggleButton = new JToggleButton(\"Enable\");\ntoggleButton.setBorderPainted(true);\nadd(toggleButton);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

