package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson53Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "Timer-start";
        String userSolution = "JLabel label = new JLabel();\nActionListener task = new ActionListener() {\n    @Override\n    public void actionPerformed(ActionEvent e) {\n        label.setText(\"Timer fired!\");\n    }\n};\nTimer timer = new Timer(1000, task);\ntimer.start();\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "Timer-stop,restart";
        String userSolution = "JLabel label = new JLabel();\nActionListener task = e -> label.setText(\"Tick!\");\nTimer timer = new Timer(1000, task);\ntimer.start();\ntimer.stop();\ntimer.restart();\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "Timer-setRepeats,start";
        String userSolution = "JLabel label = new JLabel();\nTimer timer = new Timer(3000, e -> {\n    label.setText(\"3 seconds passed!\");\n});\ntimer.setRepeats(false);\ntimer.start();\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "Timer-setInitialDelay,start";
        String userSolution = "JLabel label = new JLabel();\nTimer timer = new Timer(1000, e -> {\n    label.setText(\"Tick!\");\n});\ntimer.setInitialDelay(5000);\ntimer.start();\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

