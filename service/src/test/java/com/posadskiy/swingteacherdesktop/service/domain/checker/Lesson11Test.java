package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson11Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JList-add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\", \"Item 3\"};\nJList<String> list = new JList<>(items);\nadd(list);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JList-setSelectionMode,add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\", \"Item 3\"};\nJList<String> list = new JList<>(items);\nlist.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);\nadd(list);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JList-getSelectedValue,add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\", \"Item 3\"};\nJList<String> list = new JList<>(items);\nString selected = list.getSelectedValue();\nJLabel label = new JLabel();\nif (selected != null) {\n    label.setText(\"Selected: \" + selected);\n}\nadd(list);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JList-addListSelectionListener,getSelectedValue,add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\", \"Item 3\"};\nJList<String> list = new JList<>(items);\nJLabel label = new JLabel();\nlist.addListSelectionListener(e -> {\n    if (!e.getValueIsAdjusting()) {\n        String selected = list.getSelectedValue();\n        label.setText(\"Selected: \" + selected);\n    }\n});\nadd(list);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JList-add";
        String userSolution = "DefaultListModel<String> model = new DefaultListModel<>();\nmodel.addElement(\"Item 1\");\nmodel.addElement(\"Item 2\");\nmodel.addElement(\"Item 3\");\nJList<String> list = new JList<>(model);\nadd(list);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JScrollPane-add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\", \"Item 3\", \"Item 4\", \"Item 5\"};\nJList<String> list = new JList<>(items);\nJScrollPane scrollPane = new JScrollPane(list);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JList-setSelectionMode,getSelectedValuesList,add";
        String userSolution = "String[] items = {\"Item 1\", \"Item 2\", \"Item 3\"};\nJList<String> list = new JList<>(items);\nlist.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);\nList<String> selected = list.getSelectedValuesList();\nfor (String item : selected) {\n    label.setText(\"Selected: \" + item);\n}\nadd(list);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

