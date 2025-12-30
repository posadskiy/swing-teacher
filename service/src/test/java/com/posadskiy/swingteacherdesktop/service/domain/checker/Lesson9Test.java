package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson9Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testLesson9Task1() {
        String expectedSolution = "JToggleButton-add";
        String userSolution = "JToggleButton toggle = new JToggleButton(\"Enable\");\nadd(toggle);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task3() {
        String expectedSolution = "JCheckBox-addActionListener,isSelected,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\nJLabel label = new JLabel();\ncheckBox.addActionListener(e -> {\n    if (checkBox.isSelected()) {\n        label.setText(\"Checkbox selected!\");\n    } else {\n        label.setText(\"Checkbox unchecked!\");\n    }\n});\nadd(checkBox);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task4() {
        String expectedSolution = "JCheckBox-setHorizontalTextPosition,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\ncheckBox.setHorizontalTextPosition(SwingConstants.LEFT);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task5() {
        String expectedSolution = "JCheckBox-getModel,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\nButtonModel model = checkBox.getModel();\nmodel.setSelected(true);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task6() {
        String expectedSolution = "JCheckBox-setMnemonic,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Agree (&C)\");\ncheckBox.setMnemonic(KeyEvent.VK_C);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task7() {
        String expectedSolution = "JCheckBox-addItemListener,isSelected,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\nJLabel label = new JLabel();\ncheckBox.addItemListener(e -> {\n    boolean selected = checkBox.isSelected();\n    label.setText(\"Selected: \" + selected);\n});\nadd(checkBox);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task8() {
        String expectedSolution = "JCheckBox-setModel,getModel,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\nButtonModel model = new JToggleButton.ToggleButtonModel();\ncheckBox.setModel(model);\ncheckBox.getModel().setPressed(true);\ncheckBox.getModel().setArmed(true);\ncheckBox.getModel().setSelected(false);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task9() {
        String expectedSolution = "JCheckBox-add";
        String userSolution = "JCheckBox checkBox1 = new JCheckBox(\"Option 1\");\nJCheckBox checkBox2 = new JCheckBox(\"Option 2\");\nJCheckBox checkBox3 = new JCheckBox(\"Option 3\");\nList<JCheckBox> group = Arrays.asList(checkBox1, checkBox2, checkBox3);\nJLabel label = new JLabel();\ngroup.forEach(cb -> cb.addItemListener(e -> label.setText(\"Changed\")));\nadd(checkBox1);\nadd(checkBox2);\nadd(checkBox3);\nadd(label);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task10() {
        String expectedSolution = "JCheckBox-setFont,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\nFont font = new Font(\"Arial\", Font.BOLD, 14);\ncheckBox.setFont(font);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }

    @Test
    void testLesson9Task11() {
        String expectedSolution = "JCheckBox-setBorderPainted,add";
        String userSolution = "JCheckBox checkBox = new JCheckBox(\"Option\");\ncheckBox.setBorderPainted(true);\nadd(checkBox);";

        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);

        assertTrue(results.isEmpty());
    }
}

