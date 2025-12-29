package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson39Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "GridLayout-add";
        String userSolution = "setLayout(new GridLayout(2, 3));\nfor (int i = 1; i <= 6; i++) {\n    add(new JButton(\"Кнопка \" + i));\n}";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask1_2() {
        String expectedSolution = "JCheckBoxMenuItem-add";
        String userSolution = "JCheckBoxMenuItem item = new JCheckBoxMenuItem(\"Show panel\");\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "MouseListener-mouseClicked,getClickCount,add";
        String userSolution = "JPanel panel = new JPanel();\nJLabel label = new JLabel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getClickCount() == 1) {\n            label.setText(\"Одиночный клик!\");\n        } else if (e.getClickCount() == 2) {\n            label.setText(\"Двойной клик!\");\n        }\n    }\n});\nadd(panel);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2_2() {
        String expectedSolution = "JCheckBoxMenuItem-addActionListener,isSelected,add";
        String userSolution = "JCheckBoxMenuItem item = new JCheckBoxMenuItem(\"Show panel\");\nJLabel label = new JLabel();\nitem.addActionListener(e -> {\n    if (item.isSelected()) {\n        label.setText(\"Включено!\");\n    } else {\n        label.setText(\"Выключено!\");\n    }\n});\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "MouseMotionListener-mouseDragged,getX,getY,add";
        String userSolution = "JPanel component = new JPanel();\nJLabel label = new JLabel();\ncomponent.addMouseMotionListener(new MouseMotionListener() {\n    @Override\n    public void mouseDragged(MouseEvent e) {\n        int x = e.getX();\n        int y = e.getY();\n        label.setText(\"Перетаскивание: \" + x + \", \" + y);\n    }\n    @Override\n    public void mouseMoved(MouseEvent e) {}\n});\nadd(component);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3_2() {
        String expectedSolution = "JCheckBoxMenuItem-getModel,setSelected,add";
        String userSolution = "JCheckBoxMenuItem item = new JCheckBoxMenuItem(\"Show panel\");\nButtonModel model = item.getModel();\nmodel.setSelected(true);\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3_3() {
        String expectedSolution = "JPopupMenu-show";
        String userSolution = "JPopupMenu popupMenu = new JPopupMenu();\npopupMenu.add(new JMenuItem(\"Копировать\"));\nJPanel component = new JPanel();\npopupMenu.show(component, 100, 100);\nadd(component);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JCheckBoxMenuItem-addItemListener,isSelected,add";
        String userSolution = "JCheckBoxMenuItem item = new JCheckBoxMenuItem(\"Show panel\");\nJLabel label = new JLabel();\nitem.addItemListener(e -> {\n    boolean selected = item.isSelected();\n    label.setText(\"Selected: \" + selected);\n});\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JCheckBoxMenuItem-setIcon";
        String userSolution = "JCheckBoxMenuItem item = new JCheckBoxMenuItem(\"Show panel\");\nitem.setIcon(new ImageIcon(\"icon.png\"));\nJMenu viewMenu = new JMenu(\"View\");\nviewMenu.add(item);\nJMenuBar menuBar = new JMenuBar();\nmenuBar.add(viewMenu);\nsetJMenuBar(menuBar);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JPopupMenu-setBorder,add";
        String userSolution = "JPopupMenu popupMenu = new JPopupMenu();\nBorder border = BorderFactory.createLineBorder(Color.BLACK, 2);\npopupMenu.setBorder(border);\npopupMenu.add(new JMenuItem(\"Копировать\"));\nJPanel panel = new JPanel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mousePressed(MouseEvent e) {\n        if (e.isPopupTrigger()) {\n            popupMenu.show(e.getComponent(), e.getX(), e.getY());\n        }\n    }\n});\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

