package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson38Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "FlowLayout-add";
        String userSolution = "setLayout(new FlowLayout());\nJButton button1 = new JButton(\"Кнопка 1\");\nJButton button2 = new JButton(\"Кнопка 2\");\nJButton button3 = new JButton(\"Кнопка 3\");\nadd(button1);\nadd(button2);\nadd(button3);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JMenuItem-setAccelerator";
        String userSolution = "JMenuItem menuItem = new JMenuItem(\"Save\");\nKeyStroke stroke = KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_DOWN_MASK);\nmenuItem.setAccelerator(stroke);\nJMenu fileMenu = new JMenu(\"File\");\nfileMenu.add(menuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JMenuItem-setEnabled";
        String userSolution = "JMenuItem menuItem = new JMenuItem(\"Item\");\nmenuItem.setEnabled(false);\nmenuItem.setEnabled(true);\nJMenu menu = new JMenu(\"File\");\nmenu.add(menuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JMenuItem-setToolTipText";
        String userSolution = "JMenuItem menuItem = new JMenuItem(\"Save\");\nmenuItem.setToolTipText(\"Save document\");\nJMenu fileMenu = new JMenu(\"File\");\nfileMenu.add(menuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4_2() {
        String expectedSolution = "JRadioButtonMenuItem-setToolTipText";
        String userSolution = "JRadioButtonMenuItem radioButtonMenuItem = new JRadioButtonMenuItem(\"Theme\");\nradioButtonMenuItem.setToolTipText(\"Select theme\");\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(radioButtonMenuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JMenuItem-setAccelerator";
        String userSolution = "JMenuItem menuItem = new JMenuItem(\"Save\");\nKeyStroke keyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_DOWN_MASK);\nmenuItem.setAccelerator(keyStroke);\nJMenu fileMenu = new JMenu(\"File\");\nfileMenu.add(menuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JMenuItem-setIcon";
        String userSolution = "JMenuItem menuItem = new JMenuItem(\"Save\");\nmenuItem.setIcon(new ImageIcon(\"icon.png\"));\nJMenu fileMenu = new JMenu(\"File\");\nfileMenu.add(menuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(fileMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6_2() {
        String expectedSolution = "JRadioButtonMenuItem-setActionCommand,getActionCommand,add";
        String userSolution = "JRadioButtonMenuItem radioButtonMenuItem = new JRadioButtonMenuItem(\"Theme\");\nradioButtonMenuItem.setActionCommand(\"RADIO\");\nJLabel label = new JLabel();\nradioButtonMenuItem.addActionListener(e -> {\n    String cmd = e.getActionCommand();\n    label.setText(\"Команда: \" + cmd);\n});\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(radioButtonMenuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

