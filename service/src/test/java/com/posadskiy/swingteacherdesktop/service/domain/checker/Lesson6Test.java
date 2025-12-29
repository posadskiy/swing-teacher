package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson6Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson6Task1() {
        String expectedSolution = "JPasswordField-add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task2() {
        String expectedSolution = "JPasswordField-setEchoChar,add";
        String userSolution = "JPasswordField passwordField = new JPasswordField();\npasswordField.setEchoChar('●');\nadd(passwordField);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task3() {
        String expectedSolution = "JTextArea-setLineWrap,setWrapStyleWord,add";
        String userSolution = "JTextArea textArea = new JTextArea();\ntextArea.setLineWrap(true);\ntextArea.setWrapStyleWord(true);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task4() {
        String expectedSolution = "JTextArea-setTabSize,add";
        String userSolution = "JTextArea textArea = new JTextArea();\ntextArea.setTabSize(4);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task5() {
        String expectedSolution = "JTextArea-setLineWrap,setWrapStyleWord,add";
        String userSolution = "JTextArea textArea = new JTextArea();\ntextArea.setLineWrap(true);\ntextArea.setWrapStyleWord(true);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task6() {
        String expectedSolution = "JTextArea-append,add";
        String userSolution = "JTextArea textArea = new JTextArea();\ntextArea.append(\"Новая строка\\n\");\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task7() {
        String expectedSolution = "JTextArea-insert,add";
        String userSolution = "JTextArea textArea = new JTextArea(\"Text\");\ntextArea.insert(\"Вставленный текст\", 0);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task8() {
        String expectedSolution = "JTextArea-replaceRange,add";
        String userSolution = "JTextArea textArea = new JTextArea(\"Old text\");\ntextArea.replaceRange(\"Новый текст\", 0, 5);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task9() {
        String expectedSolution = "JTextArea-getLineCount,add";
        String userSolution = "JTextArea textArea = new JTextArea(\"Line 1\\nLine 2\");\nint lines = textArea.getLineCount();\nJLabel label = new JLabel(\"Количество строк: \" + lines);\nadd(label);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task10() {
        String expectedSolution = "JTextArea-getLineStartOffset,getLineEndOffset,getText,add";
        String userSolution = "JTextArea textArea = new JTextArea(\"First line\\nSecond line\");\nint start = textArea.getLineStartOffset(0);\nint end = textArea.getLineEndOffset(0);\nString line = textArea.getText(start, end - start);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson6Task11() {
        String expectedSolution = "JTextArea-setLineWrap,add";
        String userSolution = "JTextArea textArea = new JTextArea();\ntextArea.setLineWrap(true);\nadd(textArea);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

