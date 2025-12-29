package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson49Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "JCheckBox-addItemListener,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Select\");\nJLabel label = new JLabel();\ncheckBox.addItemListener(e -> {\n    if (e.getStateChange() == ItemEvent.SELECTED) {\n        label.setText(\"Selected!\");\n    } else {\n        label.setText(\"Unchecked!\");\n    }\n});\nadd(checkBox);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "JSlider-addChangeListener,getValue,add";
        String userSolution = "JSlider slider = new JSlider(0, 100, 50);\nJLabel label = new JLabel();\nslider.addChangeListener(e -> {\n    int value = slider.getValue();\n    label.setText(\"Value: \" + value);\n});\nadd(slider);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "JComboBox-addItemListener,add";
        String userSolution = "JComboBox<String> comboBox = new JComboBox<>(new String[]{\"Item 1\", \"Item 2\"});\nJLabel label = new JLabel();\ncomboBox.addItemListener(e -> {\n    if (e.getStateChange() == ItemEvent.SELECTED) {\n        Object item = e.getItem();\n        label.setText(\"Selected: \" + item);\n    }\n});\nadd(comboBox);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "JSpinner-addChangeListener,getValue,add";
        String userSolution = "JSpinner spinner = new JSpinner(new SpinnerNumberModel(10, 0, 100, 1));\nspinner.addChangeListener(e -> {\n    Object value = spinner.getValue();\n    label.setText(\"Value: \" + value);\n});\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

