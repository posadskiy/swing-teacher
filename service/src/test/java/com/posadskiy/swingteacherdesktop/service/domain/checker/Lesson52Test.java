package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson52Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "UIManager-SwingUtilities";
        String userSolution = "try {\n    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());\n    SwingUtilities.updateComponentTreeUI(frame);\n} catch (Exception e) {\n    e.printStackTrace();\n}";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String rightSolution = "UIManager-SwingUtilities";
        String userSolution = "try {\n    UIManager.setLookAndFeel(\"javax.swing.plaf.metal.MetalLookAndFeel\");\n    SwingUtilities.updateComponentTreeUI(frame);\n} catch (Exception e) {\n    e.printStackTrace();\n}";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "UIManager-SwingUtilities";
        String userSolution = "try {\n    UIManager.setLookAndFeel(\"javax.swing.plaf.nimbus.NimbusLookAndFeel\");\n    SwingUtilities.updateComponentTreeUI(frame);\n} catch (Exception e) {\n    e.printStackTrace();\n}";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "UIManager-getInstalledLookAndFeels";
        String userSolution = "UIManager.LookAndFeelInfo[] lafs = UIManager.getInstalledLookAndFeels();\nJLabel label = new JLabel();\nfor (UIManager.LookAndFeelInfo laf : lafs) {\n    label.setText(laf.getName() + \": \" + laf.getClassName());\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String rightSolution = "UIManager-SwingUtilities";
        String userSolution = "try {\n    UIManager.setLookAndFeel(\"com.example.CustomLookAndFeel\");\n    SwingUtilities.updateComponentTreeUI(frame);\n} catch (Exception e) {\n    e.printStackTrace();\n}";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

