package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson16Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JPanel-add";
        String userSolution = "JPanel panel = new JPanel();\nJButton button = new JButton(\"Кнопка\");\npanel.add(button);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JPanel-setLayout,add;JButton-add;JButton-add";
        String userSolution = "JPanel panel = new JPanel();\npanel.setLayout(new FlowLayout());\nJButton button1 = new JButton(\"Кнопка 1\");\nJButton button2 = new JButton(\"Кнопка 2\");\npanel.add(button1);\npanel.add(button2);\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JSpinner-add";
        String userSolution = "String[] values = {\"January\", \"February\", \"March\"};\nSpinnerListModel model = new SpinnerListModel(values);\nJSpinner spinner = new JSpinner(model);\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JSpinner-add";
        String userSolution = "SpinnerNumberModel model = new SpinnerNumberModel(0, 0, 100, 1);\nJSpinner spinner = new JSpinner(model);\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JSpinner-addChangeListener,getValue,add";
        String userSolution = "JSpinner spinner = new JSpinner();\nJLabel label = new JLabel();\nspinner.addChangeListener(e -> {\n    Object value = spinner.getValue();\n    label.setText(\"Значение: \" + value);\n});\nadd(spinner);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JSpinner-SpinnerDateModel,add";
        String userSolution = "SpinnerDateModel model = new SpinnerDateModel();\nJSpinner spinner = new JSpinner(model);\nJSpinner.DateEditor editor = new JSpinner.DateEditor(spinner, \"dd.MM.yyyy\");\nspinner.setEditor(editor);\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JSpinner-setEditor,add";
        String userSolution = "JSpinner spinner = new JSpinner();\nJSpinner.NumberEditor editor = new JSpinner.NumberEditor(spinner, \"#,##0.00\");\nspinner.setEditor(editor);\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JSpinner-setModel,add";
        String userSolution = "JSpinner spinner = new JSpinner();\nSpinnerNumberModel model = new SpinnerNumberModel(0, 0, 100, 5);\nspinner.setModel(model);\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JSpinner-setValue";
        String userSolution = "JSpinner spinner = new JSpinner();\nspinner.setValue(50);\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JSpinner-getEditor,add";
        String userSolution = "JSpinner spinner = new JSpinner();\nJSpinner.DefaultEditor editor = (JSpinner.DefaultEditor) spinner.getEditor();\nJTextField field = editor.getTextField();\nadd(spinner);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

