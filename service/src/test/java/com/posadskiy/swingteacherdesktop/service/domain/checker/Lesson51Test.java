package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson51Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "JComponent-setPreferredSize,paintComponent,add";
        String userSolution = "class MyComponent extends JComponent {\n    public MyComponent() {\n        setPreferredSize(new Dimension(200, 100));\n    }\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "JComponent-setPreferredSize,add";
        String userSolution = "class MyComponent extends JComponent {\n    public MyComponent() {\n        setPreferredSize(new Dimension(300, 200));\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "JComponent-addMouseListener,add";
        String userSolution = "class MyComponent extends JComponent {\n    public MyComponent() {\n        JLabel label = new JLabel();\n        addMouseListener(new MouseAdapter() {\n            @Override\n            public void mouseClicked(MouseEvent e) {\n                label.setText(\"Click!\");\n            }\n        });\n        add(label);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "JComponent-repaint,add";
        String userSolution = "class MyComponent extends JComponent {\n    private String text = \"Text\";\n    \n    public String getText() {\n        return text;\n    }\n    \n    public void setText(String text) {\n        this.text = text;\n        repaint();\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String rightSolution = "JComponent-setToolTipText,add";
        String userSolution = "class MyComponent extends JComponent {\n    public MyComponent() {\n        setToolTipText(\"Custom component\");\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

