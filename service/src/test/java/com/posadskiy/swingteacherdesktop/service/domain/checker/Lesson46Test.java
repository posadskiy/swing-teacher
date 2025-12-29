package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson46Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String rightSolution = "JPanel-addMouseListener,add";
        String userSolution = "JPanel panel = new JPanel();\nJLabel label = new JLabel();\npanel.addMouseListener(new MouseAdapter() {\n    public void mouseClicked(MouseEvent e) {\n        label.setText(\"Click!\");\n    }\n});\nadd(panel);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String rightSolution = "JOptionPane-showConfirmDialog";
        String userSolution = "JFrame frame = new JFrame();\nint result = JOptionPane.showConfirmDialog(\n    frame,\n    \"Ты уверен?\",\n    \"Подтверждение\",\n    JOptionPane.YES_NO_OPTION\n);\nJLabel label = new JLabel();\nif (result == JOptionPane.YES_OPTION) {\n    label.setText(\"Пользователь согласился!\");\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String rightSolution = "JOptionPane-showInputDialog";
        String userSolution = "JFrame frame = new JFrame();\nString input = JOptionPane.showInputDialog(\n    frame,\n    \"Введи своё имя:\",\n    \"Ввод\",\n    JOptionPane.QUESTION_MESSAGE\n);\nJLabel label = new JLabel();\nif (input != null && !input.isEmpty()) {\n    label.setText(\"Введено: \" + input);\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String rightSolution = "JOptionPane-showOptionDialog";
        String userSolution = "JFrame frame = new JFrame();\nString[] options = {\"Да\", \"Нет\", \"Отмена\"};\nint result = JOptionPane.showOptionDialog(\n    frame,\n    \"Выбери действие\",\n    \"Вопрос\",\n    JOptionPane.YES_NO_CANCEL_OPTION,\n    JOptionPane.QUESTION_MESSAGE,\n    null,\n    options,\n    options[0]\n);\nJLabel label = new JLabel();\nif (result >= 0) {\n    label.setText(\"Selected: \" + options[result]);\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String rightSolution = "JOptionPane-showInputDialog";
        String userSolution = "JFrame frame = new JFrame();\nString input = JOptionPane.showInputDialog(frame, \"Введите имя:\");\nJLabel label = new JLabel();\nif (input != null) {\n    label.setText(\"Имя: \" + input);\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask7() {
        String rightSolution = "JOptionPane-showConfirmDialog-YES_NO_OPTION";
        String userSolution = "JFrame frame = new JFrame();\nint result = JOptionPane.showConfirmDialog(frame, \"Удалить?\", \"Подтверждение\", JOptionPane.YES_NO_OPTION);\nJLabel label = new JLabel();\nif (result == JOptionPane.YES_OPTION) {\n    label.setText(\"Да!\");\n}\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String rightSolution = "JOptionPane-showMessageDialog-INFORMATION_MESSAGE";
        String userSolution = "JFrame frame = new JFrame();\nJOptionPane.showMessageDialog(frame, \"Сообщение\", \"Заголовок\", JOptionPane.INFORMATION_MESSAGE);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask12() {
        String rightSolution = "JTable-getColumnModel-TableColumn-setPreferredWidth";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\nTableColumnModel columnModel = table.getColumnModel();\nTableColumn column = columnModel.getColumn(0);\ncolumn.setPreferredWidth(200);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask13() {
        String rightSolution = "JTable-setRowHeight";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\ntable.setRowHeight(30);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask14() {
        String rightSolution = "JTable-setAutoResizeMode";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\ntable.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(rightSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

