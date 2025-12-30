package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson32Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JOptionPane-showMessageDialog";
        String userSolution = "JFrame frame = new JFrame();\nJOptionPane.showMessageDialog(frame, \"Operation completed successfully!\", \"Information\", JOptionPane.INFORMATION_MESSAGE);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JOptionPane-showConfirmDialog";
        String userSolution = "JFrame frame = new JFrame();\nint result = JOptionPane.showConfirmDialog(frame, \"Are you sure?\", \"Confirmation\", JOptionPane.YES_NO_OPTION);\nJLabel label = new JLabel();\nif (result == JOptionPane.YES_OPTION) {\n    label.setText(\"User agreed\");\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2_2() {
        String expectedSolution = "JMenu-setMnemonic";
        String userSolution = "JMenu menu = new JMenu(\"File\");\nmenu.setMnemonic(KeyEvent.VK_F);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JMenu-add,add,addSeparator,add";
        String userSolution = "JMenu menu = new JMenu(\"File\");\nmenu.add(new JMenuItem(\"Open\"));\nmenu.add(new JMenuItem(\"Save\"));\nmenu.addSeparator();\nmenu.add(new JMenuItem(\"Exit\"));\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JMenu-setMnemonic";
        String userSolution = "JMenu menu = new JMenu(\"File (&F)\");\nmenu.setMnemonic(KeyEvent.VK_F);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4_2() {
        String expectedSolution = "JCheckBoxMenuItem-setToolTipText";
        String userSolution = "JCheckBoxMenuItem checkBoxMenuItem = new JCheckBoxMenuItem(\"Grid\");\ncheckBoxMenuItem.setToolTipText(\"Show grid\");\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(checkBoxMenuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JMenu-add,add,addSeparator,add";
        String userSolution = "JMenu menu = new JMenu(\"File\");\nJMenuItem menuItem1 = new JMenuItem(\"Open\");\nJMenuItem menuItem2 = new JMenuItem(\"Save\");\nJMenuItem menuItem3 = new JMenuItem(\"Exit\");\nmenu.add(menuItem1);\nmenu.add(menuItem2);\nmenu.addSeparator();\nmenu.add(menuItem3);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JMenu-setDelay";
        String userSolution = "JMenu menu = new JMenu(\"File\");\nmenu.setDelay(200);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(menu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6_2() {
        String expectedSolution = "JCheckBoxMenuItem-setActionCommand,getActionCommand,add";
        String userSolution = "JCheckBoxMenuItem checkBoxMenuItem = new JCheckBoxMenuItem(\"Grid\");\ncheckBoxMenuItem.setActionCommand(\"CHECK\");\nJLabel label = new JLabel();\ncheckBoxMenuItem.addActionListener(e -> {\n    String cmd = e.getActionCommand();\n    label.setText(\"Command: \" + cmd);\n});\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(checkBoxMenuItem);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

