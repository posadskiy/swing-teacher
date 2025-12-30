package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson2Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson2Task1() {
        String expectedSolution = "JButton-add";
        String userSolution = "JButton button = new JButton();\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task2() {
        String expectedSolution = "JButton-setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setText(\"Text\");\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task3() {
        String expectedSolution = "JButton-setBackground,add";
        String userSolution = "JButton button = new JButton();\nbutton.setBackground(Color.YELLOW);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task4() {
        String expectedSolution = "JButton-setForeground,add";
        String userSolution = "JButton button = new JButton();\nbutton.setForeground(Color.WHITE);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task5() {
        String expectedSolution = "JButton-setSize,add";
        String userSolution = "JButton button = new JButton();\nbutton.setSize(320, 200);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task6() {
        String expectedSolution = "JButton-setMnemonic,setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setMnemonic(KeyEvent.VK_O);\nbutton.setText(\"<html>B<u>o</u>tton</html>\");\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task7() {
        String expectedSolution = "JButton-setIcon,setText,setIconTextGap,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"icon.png\"));\nbutton.setText(\"Text\");\nbutton.setIconTextGap(5);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task8() {
        String expectedSolution = "JButton-setMnemonic,setText,add";
        String userSolution = "JButton button = new JButton();\nbutton.setMnemonic(KeyEvent.VK_S);\nbutton.setText(\"Button &S\");\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task9() {
        String expectedSolution = "JButton-setIcon,setRolloverIcon,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"normal.png\"));\nbutton.setRolloverIcon(new ImageIcon(\"hover.png\"));\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task10() {
        String expectedSolution = "JButton-setIcon,setDisabledIcon,setEnabled,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"normal.png\"));\nbutton.setDisabledIcon(new ImageIcon(\"disabled.png\"));\nbutton.setEnabled(false);\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task11() {
        String expectedSolution = "JButton-setIcon,setPressedIcon,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"normal.png\"));\nbutton.setPressedIcon(new ImageIcon(\"pressed.png\"));\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task12() {
        String expectedSolution = "JButton-setIcon,setRolloverIcon,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"normal.png\"));\nbutton.setRolloverIcon(new ImageIcon(\"hover.png\"));\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task13() {
        String expectedSolution = "JButton-setIcon,setSelectedIcon,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"normal.png\"));\nbutton.setSelectedIcon(new ImageIcon(\"selected.png\"));\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson2Task14() {
        String expectedSolution = "JButton-setIcon,setDisabledIcon,add";
        String userSolution = "JButton button = new JButton();\nbutton.setIcon(new ImageIcon(\"normal.png\"));\nbutton.setDisabledIcon(new ImageIcon(\"disabled.png\"));\nadd(button);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

