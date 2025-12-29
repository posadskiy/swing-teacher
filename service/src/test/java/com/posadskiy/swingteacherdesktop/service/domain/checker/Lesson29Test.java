package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson29Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JPopupMenu-show,add";
        String userSolution = "JPopupMenu popup = new JPopupMenu();\npopup.add(new JMenuItem(\"Copy\"));\npopup.add(new JMenuItem(\"Paste\"));\nJPanel panel = new JPanel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON3) {\n            popup.show(panel, e.getX(), e.getY());\n        }\n    }\n});\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JPopupMenu-JMenuItem-addSeparator-JCheckBoxMenuItem";
        String userSolution = "JPopupMenu popup = new JPopupMenu();\npopup.add(new JMenuItem(\"Копировать\"));\npopup.addSeparator();\npopup.add(new JCheckBoxMenuItem(\"Show panel\"));\nJPanel panel = new JPanel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON3) {\n            popup.show(panel, e.getX(), e.getY());\n        }\n    }\n});\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JPopupMenu-MouseAdapter-MouseEvent-show";
        String userSolution = "JPopupMenu popup = new JPopupMenu();\npopup.add(new JMenuItem(\"Копировать\"));\nJPanel panel = new JPanel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON3) {\n            popup.show(panel, e.getX(), e.getY());\n        }\n    }\n});\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JPopupMenu-getInvoker,show,add";
        String userSolution = "JPopupMenu popup = new JPopupMenu();\npopup.add(new JMenuItem(\"Копировать\"));\nJPanel panel = new JPanel();\nJLabel label = new JLabel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON3) {\n            popup.show(panel, e.getX(), e.getY());\n            Component invoker = popup.getInvoker();\n            label.setText(\"Источник: \" + invoker.getClass().getSimpleName());\n        }\n    }\n});\nadd(panel);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JPopupMenu-setBorder,add";
        String userSolution = "JPopupMenu popup = new JPopupMenu();\npopup.add(new JMenuItem(\"Копировать\"));\nBorder border = BorderFactory.createLineBorder(Color.GRAY);\npopup.setBorder(border);\nJPanel panel = new JPanel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON3) {\n            popup.show(panel, e.getX(), e.getY());\n        }\n    }\n});\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JPopupMenu-PopupMenuListener";
        String userSolution = "JPopupMenu popup = new JPopupMenu();\npopup.add(new JMenuItem(\"Копировать\"));\nJLabel label = new JLabel();\npopup.addPopupMenuListener(new PopupMenuListener() {\n    @Override\n    public void popupMenuWillBecomeVisible(PopupMenuEvent e) {\n        label.setText(\"Меню будет показано\");\n    }\n    @Override\n    public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {\n        label.setText(\"Меню будет скрыто\");\n    }\n    @Override\n    public void popupMenuCanceled(PopupMenuEvent e) {\n        label.setText(\"Меню отменено\");\n    }\n});\nJPanel panel = new JPanel();\npanel.addMouseListener(new MouseAdapter() {\n    @Override\n    public void mouseClicked(MouseEvent e) {\n        if (e.getButton() == MouseEvent.BUTTON3) {\n            popup.show(panel, e.getX(), e.getY());\n        }\n    }\n});\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

