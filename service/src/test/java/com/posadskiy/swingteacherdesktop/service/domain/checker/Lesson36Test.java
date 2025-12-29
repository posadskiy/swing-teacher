package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson36Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JColorChooser-showDialog";
        String userSolution = "JFrame frame = new JFrame();\nColor color = JColorChooser.showDialog(frame, \"Выбери цвет\", Color.WHITE);\nJLabel label = new JLabel();\nif (color != null) {\n    label.setText(\"Selected color: \" + color);\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JColorChooser-createDialog,setVisible";
        String userSolution = "JFrame frame = new JFrame();\nJColorChooser colorChooser = new JColorChooser(Color.WHITE);\nJDialog dialog = JColorChooser.createDialog(\n    frame,\n    \"Choose color\",\n    true,\n    colorChooser,\n    null,\n    null\n);\ndialog.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2_2() {
        String expectedSolution = "BorderLayout-add,add,add,add,add";
        String userSolution = "setLayout(new BorderLayout());\nJButton buttonNorth = new JButton(\"Север\");\nJButton buttonSouth = new JButton(\"Юг\");\nJButton buttonEast = new JButton(\"Восток\");\nJButton buttonWest = new JButton(\"Запад\");\nJPanel panelCenter = new JPanel();\nadd(buttonNorth, BorderLayout.NORTH);\nadd(buttonSouth, BorderLayout.SOUTH);\nadd(buttonEast, BorderLayout.EAST);\nadd(buttonWest, BorderLayout.WEST);\nadd(panelCenter, BorderLayout.CENTER);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JColorChooser-setChooserPanels,setVisible";
        String userSolution = "JColorChooser colorChooser = new JColorChooser();\nAbstractColorChooserPanel[] panels = ColorChooserComponentFactory.getDefaultChooserPanels();\ncolorChooser.setChooserPanels(panels);\nJFrame frame = new JFrame();\nJDialog dialog = JColorChooser.createDialog(frame, \"Выбери цвет\", true, colorChooser, null, null);\ndialog.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3_2() {
        String expectedSolution = "BorderLayout-setHgap,setVgap,add";
        String userSolution = "BorderLayout layout = new BorderLayout();\nlayout.setHgap(10);\nlayout.setVgap(10);\nsetLayout(layout);\nJButton button = new JButton(\"Кнопка\");\nadd(button, BorderLayout.CENTER);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JColorChooser-setPreviewPanel,addChangeListener,setVisible";
        String userSolution = "JColorChooser colorChooser = new JColorChooser();\nJPanel previewPanel = new JPanel();\npreviewPanel.setPreferredSize(new Dimension(100, 50));\ncolorChooser.setPreviewPanel(previewPanel);\ncolorChooser.getSelectionModel().addChangeListener(e -> {\n    previewPanel.setBackground(colorChooser.getColor());\n});\nJFrame frame = new JFrame();\nJDialog dialog = JColorChooser.createDialog(frame, \"Выбери цвет\", true, colorChooser, null, null);\ndialog.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JColorChooser-getSelectionModel,setSelectedColor,add";
        String userSolution = "JColorChooser colorChooser = new JColorChooser();\nColorSelectionModel model = colorChooser.getSelectionModel();\nmodel.setSelectedColor(Color.RED);\nJFrame frame = new JFrame();\nJDialog dialog = JColorChooser.createDialog(frame, \"Выбери цвет\", true, colorChooser, null, null);\ndialog.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JColorChooser-showDialog";
        String userSolution = "JFrame frame = new JFrame();\nColor color = JColorChooser.showDialog(frame, \"Выбери цвет\", Color.WHITE);\nJLabel label = new JLabel();\nif (color != null) {\n    label.setText(\"Selected color: \" + color);\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String expectedSolution = "JColorChooser-setColorSelectionModel,add";
        String userSolution = "JColorChooser colorChooser = new JColorChooser();\nDefaultColorSelectionModel model = new DefaultColorSelectionModel();\nmodel.setSelectedColor(Color.RED);\ncolorChooser.setColorSelectionModel(model);\nJFrame frame = new JFrame();\nJDialog dialog = JColorChooser.createDialog(frame, \"Выбери цвет\", true, colorChooser, null, null);\ndialog.setVisible(true);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JTextPane-insertIcon,add";
        String userSolution = "JTextPane textPane = new JTextPane();\nImageIcon icon = new ImageIcon(\"icon.png\");\ntextPane.insertIcon(icon);\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JTextPane-getStyledDocument";
        String userSolution = "JTextPane textPane = new JTextPane();\nStyledDocument doc = textPane.getStyledDocument();\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JTextPane-setEditable";
        String userSolution = "JTextPane textPane = new JTextPane();\ntextPane.setText(\"Текст для чтения\");\ntextPane.setEditable(false);\nJScrollPane scrollPane = new JScrollPane(textPane);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

