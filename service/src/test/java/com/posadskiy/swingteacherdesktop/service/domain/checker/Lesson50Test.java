package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson50Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "JComponent-paintComponent,drawString,add";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        g.drawString(\"Hello!\", 10, 20);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "Graphics2D-setRenderingHint,add";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        Graphics2D g2d = (Graphics2D) g;\n        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "Graphics2D-fillRect";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        Graphics2D g2d = (Graphics2D) g;\n        g2d.fillRect(10, 10, 100, 50);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "Graphics2D-setColor-Color";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        Graphics2D g2d = (Graphics2D) g;\n        g2d.setColor(Color.RED);\n        g2d.fillRect(10, 10, 100, 50);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String rightSolution = "Graphics2D-GradientPaint-setPaint";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        Graphics2D g2d = (Graphics2D) g;\n        GradientPaint gradient = new GradientPaint(0, 0, Color.RED, 100, 0, Color.BLUE);\n        g2d.setPaint(gradient);\n        g2d.fillRect(0, 0, 100, 50);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String rightSolution = "Graphics2D-drawImage-ImageIO";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        Graphics2D g2d = (Graphics2D) g;\n        try {\n            Image image = ImageIO.read(new File(\"image.png\"));\n            g2d.drawImage(image, 10, 10, this);\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "JComponent-repaint";
        String userSolution = "class MyComponent extends JComponent {\n    @Override\n    protected void paintComponent(Graphics g) {\n        super.paintComponent(g);\n        g.drawString(\"Hello!\", 10, 20);\n    }\n}\nMyComponent comp = new MyComponent();\nadd(comp);\ncomp.repaint();";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

