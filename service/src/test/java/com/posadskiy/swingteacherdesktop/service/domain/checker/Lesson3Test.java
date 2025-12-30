package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson3Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson3Task1() {
        String expectedSolution = "JLabel-add";
        String userSolution = "JLabel label = new JLabel();\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task2() {
        String expectedSolution = "JLabel-setText,add";
        String userSolution = "JLabel label = new JLabel();\nlabel.setText(\"Hello, world!\");\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task3() {
        String expectedSolution = "JLabel-setIcon,add";
        String userSolution = "JLabel label = new JLabel();\nlabel.setIcon(new ImageIcon(\"icon.png\"));\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task4() {
        String expectedSolution = "JLabel-setHorizontalAlignment,add";
        String userSolution = "JLabel label = new JLabel(\"Center\");\nlabel.setHorizontalAlignment(SwingConstants.CENTER);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task5() {
        String expectedSolution = "JLabel-setVerticalAlignment,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setVerticalAlignment(SwingConstants.CENTER);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task6() {
        String expectedSolution = "JLabel-setBackground,setForeground,setOpaque,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setBackground(Color.YELLOW);\nlabel.setForeground(Color.BLACK);\nlabel.setOpaque(true);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task7() {
        String expectedSolution = "JLabel-setFont,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nFont font = new Font(\"Arial\", Font.BOLD, 16);\nlabel.setFont(font);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task8() {
        String expectedSolution = "JLabel-setSize,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setSize(200, 50);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task9() {
        String expectedSolution = "JLabel-setToolTipText,add";
        String userSolution = "JLabel label = new JLabel(\"Hover cursor\");\nlabel.setToolTipText(\"This is a tooltip!\");\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task10() {
        String expectedSolution = "JLabel-setText,add";
        String userSolution = "JLabel label = new JLabel();\nlabel.setText(\"<html><b>Bold</b></html>\");\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task11() {
        String expectedSolution = "JLabel-setIcon,add";
        String userSolution = "ImageIcon icon = new ImageIcon(\"icon.png\");\nJLabel label = new JLabel();\nlabel.setIcon(icon);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task12() {
        String expectedSolution = "JLabel-setHorizontalAlignment,setVerticalAlignment,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setHorizontalAlignment(SwingConstants.CENTER);\nlabel.setVerticalAlignment(SwingConstants.CENTER);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task13() {
        String expectedSolution = "JLabel-setText,add";
        String userSolution = "JLabel label = new JLabel();\nlabel.setText(\"<html><b>Bold</b> and <i>Italic</i></html>\");\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task14() {
        String expectedSolution = "JLabel-setIcon,setHorizontalAlignment,add";
        String userSolution = "JLabel label = new JLabel();\nlabel.setIcon(new ImageIcon(\"icon.png\"));\nlabel.setHorizontalAlignment(SwingConstants.LEFT);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task15() {
        String expectedSolution = "JLabel-setVerticalAlignment,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setVerticalAlignment(SwingConstants.TOP);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task16() {
        String expectedSolution = "JLabel-setIcon,setHorizontalTextPosition,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setIcon(new ImageIcon(\"icon.png\"));\nlabel.setHorizontalTextPosition(SwingConstants.RIGHT);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task17() {
        String expectedSolution = "JLabel-setDisplayedMnemonic,setLabelFor,add;JTextField-add";
        String userSolution = "JTextField textField = new JTextField();\nJLabel label = new JLabel(\"Name\");\nlabel.setDisplayedMnemonic(KeyEvent.VK_N);\nlabel.setLabelFor(textField);\nadd(label);\nadd(textField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task18() {
        String expectedSolution = "JLabel-setBorder,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nBorder border = BorderFactory.createLineBorder(Color.BLACK, 1);\nlabel.setBorder(border);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson3Task19() {
        String expectedSolution = "JLabel-setIcon,setIconTextGap,add";
        String userSolution = "JLabel label = new JLabel(\"Text\");\nlabel.setIcon(new ImageIcon(\"icon.png\"));\nlabel.setIconTextGap(10);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

