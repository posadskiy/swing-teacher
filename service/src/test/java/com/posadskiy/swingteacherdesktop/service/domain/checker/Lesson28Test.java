package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson28Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JRadioButtonMenuItem-add";
        String userSolution = "ButtonGroup group = new ButtonGroup();\nJRadioButtonMenuItem item1 = new JRadioButtonMenuItem(\"Small\");\nJRadioButtonMenuItem item2 = new JRadioButtonMenuItem(\"Medium\");\ngroup.add(item1);\ngroup.add(item2);\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item1);\nmenu.add(item2);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JRadioButtonMenuItem-setSelected";
        String userSolution = "JRadioButtonMenuItem item = new JRadioButtonMenuItem(\"Medium\");\nitem.setSelected(true);\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JRadioButtonMenuItem-add";
        String userSolution = "ButtonGroup group = new ButtonGroup();\nJRadioButtonMenuItem item1 = new JRadioButtonMenuItem(\"Small\");\nJRadioButtonMenuItem item2 = new JRadioButtonMenuItem(\"Medium\");\nJRadioButtonMenuItem item3 = new JRadioButtonMenuItem(\"Large\");\ngroup.add(item1);\ngroup.add(item2);\ngroup.add(item3);\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item1);\nmenu.add(item2);\nmenu.add(item3);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JRadioButtonMenuItem-setIcon,add";
        String userSolution = "JRadioButtonMenuItem item = new JRadioButtonMenuItem(\"Small\");\nImageIcon icon = new ImageIcon(\"icon.png\");\nitem.setIcon(icon);\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JRadioButtonMenuItem-setMnemonic,add";
        String userSolution = "JRadioButtonMenuItem item = new JRadioButtonMenuItem(\"Small\");\nitem.setMnemonic(KeyEvent.VK_M);\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JRadioButtonMenuItem-setEnabled";
        String userSolution = "JRadioButtonMenuItem item = new JRadioButtonMenuItem(\"Small\");\nitem.setEnabled(false);\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JRadioButtonMenuItem-setToolTipText";
        String userSolution = "JRadioButtonMenuItem item = new JRadioButtonMenuItem(\"Small\");\nitem.setToolTipText(\"Select small font size\");\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JRadioButtonMenuItem-addActionListener";
        String userSolution = "JRadioButtonMenuItem item = new JRadioButtonMenuItem(\"Small\");\nJLabel label = new JLabel();\nitem.addActionListener(e -> {\n    label.setText(\"Selected option: \" + item.getText());\n});\nJMenu menu = new JMenu(\"Size\");\nmenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

