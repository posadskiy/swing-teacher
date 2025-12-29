package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson42Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "CardLayout-add,add,show";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\ncardLayout.show(this, \"card1\");";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "CardLayout-next,previous";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\ncardLayout.next(this);\ncardLayout.previous(this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "Container-getComponents-isVisible-getName";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.setName(\"card1\");\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.setName(\"card2\");\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\nComponent[] components = getComponents();\nJLabel label = new JLabel();\nfor (Component comp : components) {\n    if (comp.isVisible()) {\n        label.setText(\"Visible card: \" + comp.getName());\n    }\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String rightSolution = "CardLayout-first";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\nCardLayout layout = (CardLayout) getLayout();\nlayout.first(this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "CardLayout-last";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\nCardLayout layout = (CardLayout) getLayout();\nlayout.last(this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String rightSolution = "CardLayout-next";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\nCardLayout layout = (CardLayout) getLayout();\nlayout.next(this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String rightSolution = "CardLayout-previous";
        String userSolution = "CardLayout cardLayout = new CardLayout();\nsetLayout(cardLayout);\nJPanel panel1 = new JPanel();\npanel1.add(new JLabel(\"Panel 1\"));\nJPanel panel2 = new JPanel();\npanel2.add(new JLabel(\"Panel 2\"));\nadd(panel1, \"card1\");\nadd(panel2, \"card2\");\nCardLayout layout = (CardLayout) getLayout();\nlayout.previous(this);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

