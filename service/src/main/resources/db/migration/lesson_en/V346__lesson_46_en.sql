-- Flyway migration V3: Lesson 46
-- This migration contains lesson, tasks, and documentation for lesson 46

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (406, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Responding to Mouse Clicks with MouseListener</h2>
<p class="intro">MouseListener makes components interactive. You can respond to clicks, determine cursor position, distinguish left and right buttons. Without mouse listener, component cannot respond to user actions.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>MouseListener</code> — mouse event handler</li>
  <li>Method <code>addMouseListener()</code> — adding listener</li>
  <li>Events: click, press, release, enter, exit</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>MouseListener is necessary for creating interactive components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create component (e.g., JPanel): <code>JPanel panel = new JPanel();</code></li>
  <li>Add mouse listener: <code>panel.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Click at position: " + e.getX() + ", " + e.getY());<br>
&nbsp;&nbsp;}<br>
});</code></li>
  <li>Add to form: <code>add(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>MouseAdapter</code> for simplification</li>
  <li><strong>✅ Great:</strong> Lambda for simple actions (if supported), separate class for complex logic</li>
  <li><strong>⚠️ Avoid:</strong> Implementing all MouseListener methods — too much code</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking component, action will execute. If used JLabel, message with click coordinates will appear on screen. Component now responds to mouse.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (406, 'en', 'Mouse Listener Beginner: Respond to Mouse Clicks',
        'Create panel, add MouseListener that outputs "Click!" on click, and add to form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (407, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Radio Buttons in Menu with JRadioButtonMenuItem</h2>
<p class="intro">JRadioButtonMenuItem allows selecting one option from group in menu. Font size, theme, display mode — all of this requires selecting one option. Without them, you''ll have to create separate dialogs.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JRadioButtonMenuItem</code> — radio button in menu</li>
  <li>Creating group of radio buttons in menu</li>
  <li>Adding to menu</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>JRadioButtonMenuItem is necessary for selecting one option from group in menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Create radio items: <code>JRadioButtonMenuItem item1 = new JRadioButtonMenuItem("Small");<br>
JRadioButtonMenuItem item2 = new JRadioButtonMenuItem("Medium");</code></li>
  <li>Add to group and menu: <code>group.add(item1);<br>
group.add(item2);<br>
menu.add(item1);<br>
menu.add(item2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ButtonGroup for grouping</li>
  <li><strong>✅ Great:</strong> Set default selected via <code>setSelected()</code>, add ActionListener for handling</li>
  <li><strong>⚠️ Avoid:</strong> Not using group — can select multiple</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Radio buttons will appear in menu. You can select one option, other will automatically deselect.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (407, 'en', 'Menu Radio Item Beginner: Create Radio Buttons in Menu',
        'Create ButtonGroup, create two JRadioButtonMenuItem, add to group and menu')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (408, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Selection in JRadioButtonMenuItem</h2>
<p class="intro">Handling selection makes radio item interactive. You can update other components, apply settings, perform actions. Without this, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling selection via ActionListener</li>
  <li>Determining selected item</li>
  <li>Responding to selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling selection is necessary for creating interactive radio item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>item.addActionListener(e -> {<br>
&nbsp;&nbsp;if (item.isSelected()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected: " + item.getText());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>isSelected()</code> for checking</li>
  <li><strong>✅ Great:</strong> Get text via <code>getText()</code>, update other components, use ItemListener for more precise handling</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring selection — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When selecting, handler will fire. You can get selected item and perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (408, 'en', 'Menu Radio Item Master: Handle Selection',
        'Add ActionListener, check isSelected(), output item text via getText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (409, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Creating Confirmation Dialog with JOptionPane</h2>
<p class="intro">Confirmation dialogs protect from accidental actions. Deleting file, exiting program, resetting data — all of this requires confirmation. Without them, user may accidentally lose data.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showConfirmDialog()</code> — confirmation dialog</li>
  <li>Constants <code>YES_NO_OPTION</code>, <code>YES_NO_CANCEL_OPTION</code></li>
  <li>Handling confirmation result</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Confirmation dialog is necessary for protecting from accidental actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show confirmation dialog: <code>int result = JOptionPane.showConfirmDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Are you sure?",<br>
&nbsp;&nbsp;"Confirmation",<br>
&nbsp;&nbsp;JOptionPane.YES_NO_OPTION<br>
);</code></li>
  <li>Handle result: <code>if (result == JOptionPane.YES_OPTION) {<br>
&nbsp;&nbsp;label.setText("User agreed!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> YES_NO_OPTION for simple choice</li>
  <li><strong>✅ Great:</strong> Use YES_NO_CANCEL_OPTION for three options, check result before performing action</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring result — action will always execute</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog with question and buttons will appear. User can choose "Yes", "No" or "Cancel". Result can be handled.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (409, 'en', 'Dialog Master: Create Confirmation Dialog',
        'Show confirmation dialog with YES_NO_OPTION, handle YES_OPTION result')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (412, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Adding JRadioButtonMenuItem to Group</h2>
<p class="intro">Group makes items mutually exclusive. You can select only one item from group. Without group, you can select multiple.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>ButtonGroup</code> — button group</li>
  <li>Method <code>add()</code> — adding to group</li>
  <li>Creating mutually exclusive items</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Group is necessary for creating mutually exclusive items.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Add items: <code>group.add(item1);<br>
group.add(item2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ButtonGroup for grouping</li>
  <li><strong>✅ Great:</strong> Add all radio items to group, use for mutually exclusive options</li>
  <li><strong>⚠️ Avoid:</strong> Adding to multiple groups</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Items will be in one group. You can select only one item from group.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (412, 'en', 'Menu Radio Item Master: Add to Group',
        'Create ButtonGroup, add two radio items via add()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (410, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Creating Input Dialog with JOptionPane</h2>
<p class="intro">Input dialog allows requesting data from user. Name, password, settings — all of this can be requested via dialog. Without this, you''ll have to create separate forms.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showInputDialog()</code> — input dialog</li>
  <li>Getting entered text</li>
  <li>Handling input cancellation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Input dialog is necessary for requesting data from user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show input dialog: <code>String input = JOptionPane.showInputDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Enter your name:",<br>
&nbsp;&nbsp;"Input",<br>
&nbsp;&nbsp;JOptionPane.QUESTION_MESSAGE<br>
);</code></li>
  <li>Handle result: <code>if (input != null && !input.isEmpty()) {<br>
&nbsp;&nbsp;label.setText("Entered: " + input);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check for null — user may have cancelled</li>
  <li><strong>✅ Great:</strong> Check for empty string, use QUESTION_MESSAGE for question</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring null — may be error</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog with input field will appear. User can enter text and press OK or cancel. Entered text can be obtained.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (410, 'en', 'Dialog Master: Create Input Dialog',
        'Show input dialog with question "Enter your name:", handle result, check for null and emptiness')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (414, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Handling State Change in JRadioButtonMenuItem</h2>
<p class="intro">Handling state makes item interactive. You can respond to selection, update other components. Without handling, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling changes via ItemListener</li>
  <li>Getting state</li>
  <li>Responding to changes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling state is necessary for creating interactive menu item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>item.addItemListener(e -> {<br>
&nbsp;&nbsp;if (e.getStateChange() == ItemEvent.SELECTED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addItemListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Use <code>getStateChange()</code> for checking, check SELECTED for selection, update other components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When state changes, handler will fire. You can handle selection and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (414, 'en', 'Menu Radio Item Master: Handle State Change',
        'Add ItemListener, check getStateChange() == SELECTED, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (411, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Creating Custom Buttons in JOptionPane</h2>
<p class="intro">Custom buttons make dialog flexible. You can create buttons with needed names, add additional options. Without this, you''ll have to use standard buttons.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Creating custom buttons</li>
  <li>Method <code>showOptionDialog()</code> — dialog with options</li>
  <li>Configuring dialog buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom buttons are necessary for creating flexible dialog with needed options.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create button array: <code>String[] options = {"Yes", "No", "Cancel"};</code></li>
  <li>Show dialog: <code>int result = JOptionPane.showOptionDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Choose action",<br>
&nbsp;&nbsp;"Question",<br>
&nbsp;&nbsp;JOptionPane.YES_NO_CANCEL_OPTION,<br>
&nbsp;&nbsp;JOptionPane.QUESTION_MESSAGE,<br>
&nbsp;&nbsp;null,<br>
&nbsp;&nbsp;options,<br>
&nbsp;&nbsp;options[0]<br>
);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showOptionDialog()</code> for custom buttons</li>
  <li><strong>✅ Great:</strong> Create clear button names, specify default button, handle result by index</li>
  <li><strong>⚠️ Avoid:</strong> Too many buttons — may be overloaded</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog with custom buttons will appear. Buttons will have specified names. You can choose needed button.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (411, 'en', 'Dialog Master: Create Custom Buttons',
        'Create string array with three buttons, show dialog via showOptionDialog() with these buttons')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (416, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Adding Icon to JRadioButtonMenuItem</h2>
<p class="intro">Icon improves readability. You can show visual element, improve understanding of item purpose. Without icon, item will be only with text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setIcon()</code> — setting icon</li>
  <li>Creating visually styled items</li>
  <li>Improving readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Icon is necessary for improving readability and visual styling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set icon: <code>item.setIcon(new ImageIcon("icon.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIcon()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use ImageIcon for loading, use for visual styling, use clear icons</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu item will have icon. Item will have visual element.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (416, 'en', 'Menu Radio Item Master: Add Icon', 'Set icon via setIcon() with ImageIcon')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (413, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Creating Input Dialog with JOptionPane</h2>
<p class="intro">Input dialog allows getting data. You can request name, value, text. Without input dialog, you''ll have to create custom dialog.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showInputDialog()</code> — input dialog</li>
  <li>Getting entered data</li>
  <li>Creating interactive dialogs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Input dialog is necessary for getting data from user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show dialog: <code>String input = JOptionPane.showInputDialog(frame, "Enter name:");</code></li>
  <li>Handle result: <code>if (input != null) {<br>
&nbsp;&nbsp;label.setText("Name: " + input);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showInputDialog()</code> for input</li>
  <li><strong>✅ Great:</strong> Check null for cancellation, use initial value, use for simple input</li>
  <li><strong>⚠️ Avoid:</strong> Too complex input — need custom dialog</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Input dialog will appear. You can enter value and get it.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (413, 'en', 'Dialog Master: Create Input Dialog',
        'Show input dialog via showInputDialog() with message "Enter name:", check result for null')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (415, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Creating Confirmation Dialog with JOptionPane</h2>
<p class="intro">Confirmation dialog allows getting confirmation. You can request action confirmation, get answer. Without dialog, you can''t get confirmation.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showConfirmDialog()</code> — confirmation dialog</li>
  <li>Getting result (YES, NO, CANCEL)</li>
  <li>Creating interactive dialogs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Confirmation dialog is necessary for getting action confirmation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show dialog: <code>int result = JOptionPane.showConfirmDialog(frame, "Delete?", "Confirmation", JOptionPane.YES_NO_OPTION);</code></li>
  <li>Handle result: <code>if (result == JOptionPane.YES_OPTION) {<br>
&nbsp;&nbsp;label.setText("Yes!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showConfirmDialog()</code> for confirmation</li>
  <li><strong>✅ Great:</strong> Use YES_NO_OPTION for yes/no, use YES_NO_CANCEL_OPTION for yes/no/cancel, check result</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring result</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Confirmation dialog will appear. You can choose yes, no or cancel.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (415, 'en', 'Dialog Master: Create Confirmation Dialog',
        'Show confirmation dialog via showConfirmDialog() with YES_NO_OPTION, check result == YES_OPTION')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (417, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Creating Message Dialog with JOptionPane</h2>
<p class="intro">Message dialog allows informing user. You can show message, warning, error. Without dialog, you can''t inform user.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showMessageDialog()</code> — message dialog</li>
  <li>Message types (ERROR, INFORMATION, WARNING, QUESTION, PLAIN)</li>
  <li>Creating informative dialogs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Message dialog is necessary for informing user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show dialog: <code>JOptionPane.showMessageDialog(frame, "Message", "Title", JOptionPane.INFORMATION_MESSAGE);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showMessageDialog()</code> for showing</li>
  <li><strong>✅ Great:</strong> Use INFORMATION_MESSAGE for information, use ERROR_MESSAGE for error, use WARNING_MESSAGE for warning</li>
  <li><strong>⚠️ Avoid:</strong> Wrong message type</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Message dialog will appear. You can show information, warning or error.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (417, 'en', 'Dialog Master: Create Message Dialog',
        'Show message dialog via showMessageDialog() with INFORMATION_MESSAGE')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (418, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Setting Column Width in JTable</h2>
<p class="intro">Column width improves readability. You can set needed width, improve display. Without setting, width will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreferredWidth()</code> — setting preferred width</li>
  <li>Managing column width</li>
  <li>Improving readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Column width is necessary for improving table readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get column model: <code>TableColumnModel columnModel = table.getColumnModel();</code></li>
  <li>Get column: <code>TableColumn column = columnModel.getColumn(0);</code></li>
  <li>Set width: <code>column.setPreferredWidth(200);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreferredWidth()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use <code>getColumnModel()</code> for getting, use for improving readability, improve display</li>
  <li><strong>⚠️ Avoid:</strong> Too narrow or wide columns</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Column will be needed width. You can improve readability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (418, 'en', 'Table Master: Set Column Width',
        'Get column model via getColumnModel(), get column 0, set width 200 via setPreferredWidth()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (419, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Setting Row Height in JTable</h2>
<p class="intro">Row height improves readability. You can set needed height, improve display. Without setting, height will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setRowHeight()</code> — setting row height</li>
  <li>Managing row height</li>
  <li>Improving readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Row height is necessary for improving table readability.</p>
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
  <li><strong>✅ Use:</strong> <code>setRowHeight()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use for improving readability, improve display, make height reasonable</li>
  <li><strong>⚠️ Avoid:</strong> Too small or large height</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Rows will be needed height. You can improve readability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (419, 'en', 'Table Master: Set Row Height', 'Set row height 30 via setRowHeight()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (420, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 15: Setting Auto-Resize Mode in JTable</h2>
<p class="intro">Auto-resize mode determines behavior. You can set how columns change when table size changes, improve layout. Without setting, mode will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAutoResizeMode()</code> — setting mode</li>
  <li>Constants <code>JTable.AUTO_RESIZE_ALL_COLUMNS</code>, <code>JTable.AUTO_RESIZE_OFF</code></li>
  <li>Managing automatic resize</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Auto-resize mode is necessary for managing column behavior when size changes.</p>
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
  <li><strong>✅ Use:</strong> <code>setAutoResizeMode()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use AUTO_RESIZE_ALL_COLUMNS for all, use AUTO_RESIZE_OFF for disabling, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Using inappropriate mode</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Columns will change automatically. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (420, 'en', 'Table Master: Set Auto-Resize Mode',
        'Set mode AUTO_RESIZE_ALL_COLUMNS via setAutoResizeMode()')
ON CONFLICT (task_id, language_code) DO NOTHING;
