package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson47Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "KeyListener-addKeyListener,requestFocus";
        String userSolution = "JLabel label = new JLabel();\nKeyListener listener = new KeyListener() {\n    @Override\n    public void keyPressed(KeyEvent e) {\n        if (e.getKeyCode() == KeyEvent.VK_ENTER) {\n            label.setText(\"Enter pressed!\");\n        }\n    }\n    @Override\n    public void keyReleased(KeyEvent e) {}\n    @Override\n    public void keyTyped(KeyEvent e) {}\n};\naddKeyListener(listener);\nsetFocusable(true);\nrequestFocus();";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "KeyListener-isControlDown,getKeyCode,add";
        String userSolution = "JPanel panel = new JPanel();\nJLabel label = new JLabel();\npanel.addKeyListener(new KeyListener() {\n    @Override\n    public void keyPressed(KeyEvent e) {\n        if (e.isControlDown() && e.getKeyCode() == KeyEvent.VK_C) {\n            label.setText(\"Ctrl+C pressed!\");\n        }\n    }\n    @Override\n    public void keyReleased(KeyEvent e) {}\n    @Override\n    public void keyTyped(KeyEvent e) {}\n});\npanel.setFocusable(true);\npanel.requestFocus();\nadd(panel);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "KeyListener-keyReleased,getKeyCode,add";
        String userSolution = "JPanel panel = new JPanel();\nJLabel label = new JLabel();\npanel.addKeyListener(new KeyListener() {\n    @Override\n    public void keyPressed(KeyEvent e) {}\n    @Override\n    public void keyReleased(KeyEvent e) {\n        if (e.getKeyCode() == KeyEvent.VK_SPACE) {\n            label.setText(\"Space released!\");\n        }\n    }\n    @Override\n    public void keyTyped(KeyEvent e) {}\n});\npanel.setFocusable(true);\npanel.requestFocus();\nadd(panel);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

