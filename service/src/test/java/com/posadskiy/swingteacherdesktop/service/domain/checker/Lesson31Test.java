package com.posadskiy.swingteacherdesktop.service.domain.checker;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertTrue;

class Lesson31Test {

    private CodeChecker checker;

    @BeforeEach
    void setUp() {
        checker = new CodeChecker();
    }

    @Test
    void testTask1() {
        String expectedSolution = "JTree-DefaultMutableTreeNode-JScrollPane-add";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nDefaultMutableTreeNode child1 = new DefaultMutableTreeNode(\"Child 1\");\nDefaultMutableTreeNode child2 = new DefaultMutableTreeNode(\"Child 2\");\nroot.add(child1);\nroot.add(child2);\nJTree tree = new JTree(root);\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask2() {
        String expectedSolution = "JTable-getColumnModel,add";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\nTableColumnModel columnModel = table.getColumnModel();\nTableColumn column = columnModel.getColumn(0);\ncolumn.setPreferredWidth(150);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask3() {
        String expectedSolution = "JTree-expandPath,add";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nDefaultMutableTreeNode node = new DefaultMutableTreeNode(\"Node\");\nroot.add(node);\nJTree tree = new JTree(root);\nTreePath path = new TreePath(node.getPath());\ntree.expandPath(path);\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask4() {
        String expectedSolution = "JTable-setModel,add";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nDefaultTableModel model = new DefaultTableModel(data, columns) {\n    @Override\n    public boolean isCellEditable(int row, int column) {\n        return true;\n    }\n};\nJTable table = new JTable(model);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask5() {
        String expectedSolution = "JTree-addTreeSelectionListener,add";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nJTree tree = new JTree(root);\nJLabel label = new JLabel();\ntree.addTreeSelectionListener(e -> {\n    TreePath path = e.getNewLeadSelectionPath();\n    if (path != null) {\n        DefaultMutableTreeNode node = (DefaultMutableTreeNode) path.getLastPathComponent();\n        label.setText(\"Selected: \" + node.getUserObject());\n    }\n});\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);\nadd(label);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask6() {
        String expectedSolution = "JTable-getSelectionModel,setSelectionMode,add";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\nListSelectionModel selectionModel = table.getSelectionModel();\nselectionModel.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask8() {
        String expectedSolution = "JTree-setCellRenderer,add";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nJTree tree = new JTree(root);\ntree.setCellRenderer(new DefaultTreeCellRenderer() {\n    @Override\n    public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row, boolean hasFocus) {\n        Component c = super.getTreeCellRendererComponent(tree, value, selected, expanded, leaf, row, hasFocus);\n        c.setForeground(Color.BLUE);\n        return c;\n    }\n});\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask9() {
        String expectedSolution = "JTable-getColumnModel,setPreferredWidth,add";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\nTableColumnModel columnModel = table.getColumnModel();\nTableColumn column = columnModel.getColumn(0);\ncolumn.setPreferredWidth(150);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask10() {
        String expectedSolution = "JTable-setRowHeight";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\ntable.setRowHeight(30);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11() {
        String expectedSolution = "JTree-getPathForRow,expandPath,add";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nJTree tree = new JTree(root);\nTreePath path = tree.getPathForRow(0);\ntree.expandPath(path);\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask11_2() {
        String expectedSolution = "JTable-setAutoResizeMode-AUTO_RESIZE_ALL_COLUMNS";
        String userSolution = "String[] columns = {\"Name\", \"Age\"};\nString[][] data = {{\"John\", \"25\"}, {\"Mary\", \"30\"}};\nJTable table = new JTable(data, columns);\ntable.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);\nJScrollPane scrollPane = new JScrollPane(table);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask13() {
        String expectedSolution = "JTree-getPathForRow,collapsePath,add";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nJTree tree = new JTree(root);\nTreePath path = tree.getPathForRow(0);\ntree.collapsePath(path);\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }

    @Test
    void testTask14() {
        String expectedSolution = "JTree-setRootVisible";
        String userSolution = "DefaultMutableTreeNode root = new DefaultMutableTreeNode(\"Root\");\nJTree tree = new JTree(root);\ntree.setRootVisible(true);\nJScrollPane scrollPane = new JScrollPane(tree);\nadd(scrollPane);";
        ArrayList<CheckerResult> results = checker.check(expectedSolution, userSolution);
        assertTrue(results.isEmpty());
    }
}

