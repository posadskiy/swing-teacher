-- Flyway migration V3: Lesson 31
-- This migration contains lesson, tasks, and documentation for lesson 31

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (253, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Hierarchical Structure</h2>
<p class="intro">Trees display hierarchical data. File system, organization structure, product categories — all of this is convenient to show in tree. Trees make complex structures understandable.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JTree</code> — tree for hierarchical data</li>
  <li>Creating tree with nodes</li>
  <li>Displaying hierarchical structure</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Trees are necessary for displaying hierarchical data in convenient format.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create root node: <code>DefaultMutableTreeNode root = new DefaultMutableTreeNode("Root");</code></li>
  <li>Add child nodes: <code>root.add(new DefaultMutableTreeNode("Node 1"));</code> and <code>root.add(new DefaultMutableTreeNode("Node 2"));</code></li>
  <li>Create tree: <code>JTree tree = new JTree(root);</code></li>
  <li>Wrap in JScrollPane and add: <code>JScrollPane scrollPane = new JScrollPane(tree);</code> and <code>add(scrollPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> DefaultMutableTreeNode for nodes</li>
  <li><strong>✅ Great:</strong> Wrap in JScrollPane for scrolling, create multi-level hierarchy</li>
  <li><strong>⚠️ Avoid:</strong> Without JScrollPane — large trees don''t scroll</li>
</ul>
<p><strong>Important:</strong> Always wrap in JScrollPane for scrolling. Nodes can be expanded/collapsed by clicking.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A tree with nodes will appear. This is a hierarchical structure with root node and children. You can expand nodes to see content.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (253, 'en', 'Tree Beginner: Create Hierarchical Structure',
        'Create tree with root node "Root" and two child nodes, wrap in JScrollPane and add to form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (254, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Configuring Column Width</h2>
<p class="intro">Configuring column width makes table convenient. Long texts won''t be cut off, short columns won''t take extra space. Without configuration, table may look messy.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreferredWidth()</code> — setting column width</li>
  <li>Class <code>TableColumn</code> — table column</li>
  <li>Configuring column sizes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring column width is necessary for improving readability and table appearance.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get column model: <code>TableColumnModel columnModel = table.getColumnModel();</code></li>
  <li>Get column: <code>TableColumn column = columnModel.getColumn(0);</code></li>
  <li>Set width: <code>column.setPreferredWidth(150);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreferredWidth()</code> for preferred width</li>
  <li><strong>✅ Great:</strong> Use <code>setMinWidth()</code> and <code>setMaxWidth()</code> for constraints, configure width for all columns</li>
  <li><strong>⚠️ Avoid:</strong> Too narrow columns — text will be cut off</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Table columns will be of needed width. Long texts will be fully visible, short columns won''t take extra space.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (254, 'en', 'Table Master: Configure Column Width',
        'Get column model, get first column, set preferred width 150')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (255, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Expanding and Collapsing Nodes</h2>
<p class="intro">Managing node expansion makes tree convenient. You can automatically open needed branches, hide unnecessary ones. Without this, user will have to manually open each node.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>expandPath()</code> — expand path</li>
  <li>Method <code>collapsePath()</code> — collapse path</li>
  <li>Class <code>TreePath</code> — path to node</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing expansion is necessary for convenient tree navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get path to node: <code>TreePath path = new TreePath(node.getPath());</code></li>
  <li>Expand path: <code>tree.expandPath(path);</code></li>
  <li>Or collapse path: <code>tree.collapsePath(path);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>expandPath()</code> to expand</li>
  <li><strong>✅ Great:</strong> Use <code>expandRow()</code> to expand by row index, use <code>expandAll()</code> to expand all nodes</li>
  <li><strong>⚠️ Avoid:</strong> Expanding all nodes at once — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tree nodes will expand and collapse. You can programmatically manage node visibility.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (255, 'en', 'Tree Master: Expand and Collapse Nodes', 'Get path to node, expand path in tree')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (256, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Enabling Cell Editing</h2>
<p class="intro">Cell editing makes table interactive. You can change data directly in table, without opening separate forms. Without this, you''ll have to create separate dialogs for editing.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>isCellEditable()</code> — allowing editing</li>
  <li>Class <code>DefaultTableModel</code> — table model</li>
  <li>Enabling cell editing</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Cell editing is necessary for creating interactive tables with ability to change data.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>DefaultTableModel model = new DefaultTableModel(data, columns) {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public boolean isCellEditable(int row, int column) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;return true;<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Set model: <code>table.setModel(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Override <code>isCellEditable()</code> in model</li>
  <li><strong>✅ Great:</strong> Allow editing only for specific columns, add validation when editing</li>
  <li><strong>⚠️ Avoid:</strong> Allowing editing of all cells — may be unsafe</li>
</ul>
<p><strong>Important:</strong> You can use different editors for different data types. Add TableModelListener to track changes.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Table cells can be edited. Double-click on cell will open editor. You can change values directly in table.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (256, 'en', 'Table Master: Enable Cell Editing',
        'Create DefaultTableModel, override isCellEditable() to return true, set model to table')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (257, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Handling Node Selection</h2>
<p class="intro">Handling node selection makes tree interactive. You can show details of selected node, perform actions, update other components. Without this, tree will be only for viewing.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>TreeSelectionListener</code> — handling selection</li>
  <li>Getting selected node</li>
  <li>Handling node selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling selection is necessary for creating interactive trees with reaction to user actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>tree.addTreeSelectionListener(e -> {<br>
&nbsp;&nbsp;TreePath path = e.getNewLeadSelectionPath();<br>
&nbsp;&nbsp;if (path != null) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;DefaultMutableTreeNode node = (DefaultMutableTreeNode) path.getLastPathComponent();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected: " + node.getUserObject());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check path for null before using</li>
  <li><strong>✅ Great:</strong> Use <code>getLastPathComponent()</code> to get node, handle multiple selection</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring null — may be error</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When selecting node, handler will trigger. You can get selected node and perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (257, 'en', 'Tree Master: Handle Node Selection',
        'Add TreeSelectionListener, get path of selected node, get node and output its object')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (258, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Configuring Row Selection</h2>
<p class="intro">Selection mode determines how many rows can be selected. Single selection for details, multiple for operations — all of this requires configuring mode. Without this, only single selection will be available.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setSelectionMode()</code> — selection mode</li>
  <li>Selection mode constants</li>
  <li>Configuring row selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring selection mode is necessary for controlling table behavior when selecting rows.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get selection model: <code>ListSelectionModel selectionModel = table.getSelectionModel();</code></li>
  <li>Set mode: <code>selectionModel.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SINGLE_SELECTION for single</li>
  <li><strong>✅ Great:</strong> Use MULTIPLE_INTERVAL_SELECTION for multiple, use SINGLE_INTERVAL_SELECTION for range</li>
  <li><strong>⚠️ Avoid:</strong> Multiple selection where single is needed</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can select multiple rows. With multiple selection, you can select several rows simultaneously.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (258, 'en', 'Table Master: Configure Row Selection',
        'Get selection model via getSelectionModel(), set MULTIPLE_INTERVAL_SELECTION')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (259, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Configuring Node Display</h2>
<p class="intro">Custom renderer allows changing node appearance. You can add icons, colors, formatting. Without this, all nodes will be displayed the same.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>TreeCellRenderer</code> — node renderer</li>
  <li>Method <code>setCellRenderer()</code> — setting renderer</li>
  <li>Creating custom display</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom renderer is necessary for improving visual representation of tree nodes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create renderer: <code>tree.setCellRenderer(new DefaultTreeCellRenderer() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public Component getTreeCellRendererComponent(...) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;Component c = super.getTreeCellRendererComponent(...);<br>
&nbsp;&nbsp;&nbsp;&nbsp;c.setForeground(Color.BLUE);<br>
&nbsp;&nbsp;&nbsp;&nbsp;return c;<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Extend DefaultTreeCellRenderer</li>
  <li><strong>✅ Great:</strong> Configure color, font, icons, conditional formatting depending on node</li>
  <li><strong>⚠️ Avoid:</strong> Too complex formatting — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Nodes will be displayed with custom formatting. You can add colors, icons, change font.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (259, 'en', 'Tree Master: Configure Node Display',
        'Create DefaultTreeCellRenderer, override getTreeCellRendererComponent(), set blue text color, set renderer')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (266, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Adding Accelerator to Menu Item</h2>
<p class="intro">Accelerator speeds up access. You can assign hotkey for menu item, improve performance. Without accelerator, you need to use menu.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAccelerator()</code> — setting accelerator</li>
  <li>Hotkeys for menu items</li>
  <li>Improving accessibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Accelerators are necessary for quick access to functions through hotkeys.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create accelerator: <code>KeyStroke keyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_DOWN_MASK);</code></li>
  <li>Set accelerator: <code>menuItem.setAccelerator(keyStroke);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAccelerator()</code> to set</li>
  <li><strong>✅ Great:</strong> Use KeyStroke to create, use standard combinations, improve accessibility</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating accelerators</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Accelerator will appear next to menu item. You can use hotkey for quick access.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (266, 'en', 'Menu Item Master: Add Accelerator',
        'Create KeyStroke for Ctrl+S, set via setAccelerator()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (260, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Configuring Column Width (Extended)</h2>
<p class="intro">Column width determines readability. You can set needed width, improve display. Without configuration, columns will be standard width.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreferredWidth()</code> — setting column width</li>
  <li>Method <code>setAutoResizeMode()</code> — resize mode</li>
  <li>Configuring column sizes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring column width is necessary for improving table readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get column model: <code>TableColumnModel columnModel = table.getColumnModel();</code></li>
  <li>Set width: <code>TableColumn column = columnModel.getColumn(0);</code> and <code>column.setPreferredWidth(150);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getColumnModel()</code> to get</li>
  <li><strong>✅ Great:</strong> Use <code>setPreferredWidth()</code> for width, use <code>setMinWidth()</code> and <code>setMaxWidth()</code>, adapt to content</li>
  <li><strong>⚠️ Avoid:</strong> Too narrow columns</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Columns will be of needed width. Table will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (260, 'en', 'Table Master: Configure Column Width',
        'Get column model, get column 0, set width 150 via setPreferredWidth()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (267, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Setting Mnemonic in Menu Item</h2>
<p class="intro">Mnemonic improves accessibility. You can assign hotkey for menu item, improve navigation. Without mnemonic, you need to use mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMnemonic()</code> — setting mnemonic</li>
  <li>Hotkeys for menu items</li>
  <li>Improving accessibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Mnemonics are necessary for improving accessibility and navigation through keyboard.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>menuItem.setMnemonic(KeyEvent.VK_S);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMnemonic()</code> to set</li>
  <li><strong>✅ Great:</strong> Use KeyEvent.VK_* for keys, use to improve accessibility, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating mnemonics</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In menu item text, mnemonic letter will be underlined. When pressing Alt+key, item activates.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (267, 'en', 'Menu Item Master: Set Mnemonic', 'Set mnemonic VK_S via setMnemonic()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (262, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Configuring Row Height</h2>
<p class="intro">Row height determines readability. You can set needed height, improve display. Without configuration, height will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setRowHeight()</code> — setting height</li>
  <li>Creating uniform rows</li>
  <li>Improving readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring row height is necessary for improving table readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set height: <code>table.setRowHeight(30);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRowHeight()</code> to set</li>
  <li><strong>✅ Great:</strong> Use reasonable values, adapt to content, use for uniformity</li>
  <li><strong>⚠️ Avoid:</strong> Too small height — may be unreadable</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Rows will be of needed height. Table will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (262, 'en', 'Table Master: Configure Row Height', 'Set row height 30 via setRowHeight(30)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (268, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Adding Tooltip to Menu Item</h2>
<p class="intro">Tooltip improves informativeness. You can add menu item description, improve understanding. Without tooltip, user may not understand purpose.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipText()</code> — setting tooltip</li>
  <li>Improving informativeness</li>
  <li>Creating understandable interface</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltips are necessary for improving informativeness and understanding of interface element purposes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>menuItem.setToolTipText("Save document");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> to set</li>
  <li><strong>✅ Great:</strong> Use clear texts, use to improve informativeness, improve understanding</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When hovering, a tooltip will appear. You can improve informativeness.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (268, 'en', 'Menu Item Master: Add Tooltip',
        'Set tooltip "Save document" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (261, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Expanding Path in Tree</h2>
<p class="intro">Expanding path shows nodes. You can programmatically expand needed nodes, show structure. Without expansion, nodes will be collapsed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>TreePath</code> — path to node</li>
  <li>Method <code>expandPath()</code> — expanding path</li>
  <li>Tree navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Expanding path is necessary for programmatic management of tree node visibility.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get path: <code>TreePath path = tree.getPathForRow(0);</code></li>
  <li>Expand path: <code>tree.expandPath(path);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>expandPath()</code> to expand</li>
  <li><strong>✅ Great:</strong> Use <code>getPathForRow()</code> to get path, use <code>collapsePath()</code> to collapse, use <code>expandRow()</code> to expand row</li>
  <li><strong>⚠️ Avoid:</strong> Expanding all nodes — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Nodes will be expanded. You can see child nodes.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (261, 'en', 'Tree Master: Expand Path', 'Get path via getPathForRow(0), expand via expandPath()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (264, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Configuring Automatic Resize</h2>
<p class="intro">Resize mode determines behavior. You can configure how columns will change when window size changes. Without configuration, standard mode will be used.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAutoResizeMode()</code> — setting mode</li>
  <li>Mode constants (OFF, ALL_COLUMNS, NEXT_COLUMN, SUBSEQUENT_COLUMNS, LAST_COLUMN)</li>
  <li>Managing column resize</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring resize mode is necessary for controlling table behavior when window size changes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mode: <code>table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAutoResizeMode()</code> to set</li>
  <li><strong>✅ Great:</strong> Use AUTO_RESIZE_ALL_COLUMNS for all, use AUTO_RESIZE_OFF to disable, use AUTO_RESIZE_LAST_COLUMN for last</li>
  <li><strong>⚠️ Avoid:</strong> Wrong mode — may be inconvenient</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Resize mode will be configured. Columns will change according to mode.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (264, 'en', 'Table Master: Configure Automatic Resize',
        'Set mode AUTO_RESIZE_ALL_COLUMNS via setAutoResizeMode()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (263, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 15: Collapsing Path in Tree</h2>
<p class="intro">Collapsing path hides nodes. You can hide child nodes, simplify structure. Without collapsing, all nodes will be visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>collapsePath()</code> — collapsing path</li>
  <li>Hiding child nodes</li>
  <li>Improving navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Collapsing path is necessary for simplifying tree structure and improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get path: <code>TreePath path = tree.getPathForRow(0);</code></li>
  <li>Collapse path: <code>tree.collapsePath(path);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>collapsePath()</code> to collapse</li>
  <li><strong>✅ Great:</strong> Use <code>getPathForRow()</code> to get path, use <code>collapseRow()</code> to collapse row, use to simplify structure</li>
  <li><strong>⚠️ Avoid:</strong> Collapsing all nodes — may be inconvenient</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Nodes will be collapsed. Child nodes will be hidden. You can simplify structure.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (263, 'en', 'Tree Master: Collapse Path', 'Get path via getPathForRow(0), collapse via collapsePath()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (265, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 16: Managing Root Visibility</h2>
<p class="intro">Root visibility determines structure. You can show or hide root node, improve tree representation. Without configuration, root will be visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setRootVisible()</code> — showing root</li>
  <li>Managing root node visibility</li>
  <li>Improving tree structure</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing root visibility is necessary for improving tree structure representation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show root: <code>tree.setRootVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRootVisible(true)</code> to show</li>
  <li><strong>✅ Great:</strong> Use <code>setRootVisible(false)</code> to hide, use to improve structure, adapt to needs</li>
  <li><strong>⚠️ Avoid:</strong> Hiding root without need</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Root will be visible or hidden. You can manage root node visibility.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (265, 'en', 'Tree Master: Show Root', 'Show root via setRootVisible(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
