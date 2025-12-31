-- Flyway migration V3: Lesson 10
-- This migration contains lesson, tasks, and documentation for lesson 10

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (83, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Dropdown List</h2>
<p class="intro">Dropdown lists (<code>JComboBox</code>) save space. Instead of many radio buttons — one compact list. Countries, cities, categories — all of this is convenient to select from a list.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JComboBox</code> class — dropdown list</li>
  <li>Creating a list with items</li>
  <li>Selecting an item from the list</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Dropdown lists save space and simplify selection from many options.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create array of items: <code>String[] items = {"Option 1", "Option 2", "Option 3"};</code></li>
  <li>Create dropdown list: <code>JComboBox&lt;String&gt; combo = new JComboBox&lt;&gt;(items);</code></li>
  <li>Add to the form: <code>add(combo);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with array of items</li>
  <li><strong>✅ Excellent:</strong> Use typed <code>JComboBox&lt;String&gt;</code></li>
  <li><strong>⚠️ Avoid:</strong> Empty list — user won''t be able to select</li>
</ul>
<p><strong>Important:</strong> You can create empty: <code>new JComboBox&lt;&gt;()</code> and add items later. Add item: <code>combo.addItem("New item");</code>. Get selected: <code>String selected = (String) combo.getSelectedItem();</code>. Set selected: <code>combo.setSelectedItem("Option 1");</code>. Can make editable: <code>combo.setEditable(true);</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dropdown list will appear on the form. This is a field with a button with down arrow. On click, list of options will open. You can select one option.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (83, 'en', 'Beginner Dropdown List: create a selection list',
        'Create a dropdown list with items "Option 1", "Option 2", "Option 3" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (84, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Editable List</h2>
<p class="intro">Editable lists give more flexibility. User can select from suggested options or enter their own. It''s like autocomplete with customization possibility.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setEditable(boolean editable)</code> method — enabling editing</li>
  <li>Editable dropdown lists</li>
  <li>Combination of selection and input</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Editable lists allow user to select from suggested options or enter their own, which increases interface flexibility.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create dropdown list: <code>JComboBox&lt;String&gt; combo = new JComboBox&lt;&gt;(items);</code></li>
  <li>Make editable: <code>combo.setEditable(true);</code></li>
  <li>Add to the form: <code>add(combo);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEditable(true)</code> for flexible input</li>
  <li><strong>✅ Excellent:</strong> Combination of list and text field</li>
  <li><strong>⚠️ Avoid:</strong> Editable list without items — works like text field</li>
</ul>
<p><strong>Important:</strong> <code>setEditable(false)</code> — only selection from list (default). Get entered text: <code>String text = (String) combo.getSelectedItem();</code>. Use for fields where both standard and custom values are possible.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>List will become editable. User can click in field and enter their text, or select from dropdown list.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (84, 'en', 'Editable List: allow text input',
        'Create a dropdown list, make it editable and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (85, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: List Selection Mode</h2>
<p class="intro">Selection mode determines list behavior. One file for opening, several files for deletion — different tasks require different modes. Proper mode makes the interface intuitive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSelectionMode(int mode)</code> method — setting selection mode</li>
  <li>Modes: <code>SINGLE_SELECTION</code>, <code>SINGLE_INTERVAL_SELECTION</code>, <code>MULTIPLE_INTERVAL_SELECTION</code></li>
  <li>Managing item selection in list</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper selection mode makes the interface intuitive and matches user expectations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code></li>
  <li>Set selection mode: <code>list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);</code></li>
  <li>Add to the form: <code>add(list);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>SINGLE_SELECTION</code> for selecting one element</li>
  <li><strong>✅ Excellent:</strong> <code>MULTIPLE_INTERVAL_SELECTION</code> for multiple selection</li>
  <li><strong>⚠️ Avoid:</strong> Multiple selection where one is needed — confuses user</li>
</ul>
<p><strong>Important:</strong> <code>SINGLE_INTERVAL_SELECTION</code> — one continuous range. Use <code>SINGLE_SELECTION</code> for actions with one element. Use <code>MULTIPLE_INTERVAL_SELECTION</code> for bulk operations.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>List will work in the specified mode. If you chose <code>SINGLE_SELECTION</code>, only one element can be selected. If <code>MULTIPLE_INTERVAL_SELECTION</code> — several with Ctrl/Cmd.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (85, 'en', 'Selection Mode: one or several elements',
        'Create a list, set single selection mode and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (86, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Radio Button Group</h2>
<p class="intro">Radio button groups create mutually exclusive selection. Gender, age, category — all of this requires selecting one option. Without group, multiple buttons can be selected simultaneously.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>ButtonGroup</code> class — button group</li>
  <li>The <code>add()</code> method — adding buttons to group</li>
  <li>Creating mutually exclusive options</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Group ensures mutually exclusive selection, which is critical for proper radio button operation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Add buttons: <code>group.add(radio1);</code><br><code>group.add(radio2);</code><br><code>group.add(radio3);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ButtonGroup for grouping</li>
  <li><strong>✅ Excellent:</strong> Add all radio buttons to one group, use different groups for different categories</li>
  <li><strong>⚠️ Avoid:</strong> Not using groups — multiple can be selected</li>
</ul>
<p><strong>Important:</strong> Only one button in group can be selected. Group is not visual, only logical.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Only one radio button in group can be selected. When selecting another button, previous one will automatically be deselected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (86, 'en', 'Radio Button Master: create button group',
        'Create ButtonGroup, add three radio buttons to group via add()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (87, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Radio Button Icon</h2>
<p class="intro">Icons make radio buttons visually attractive. You can show different icons for selected and unselected state. Without icons, radio buttons will be text-only.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIcon()</code> method — setting icon</li>
  <li>The <code>setSelectedIcon()</code> method — icon when selected</li>
  <li>Creating visually attractive radio buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icons improve visual perception and allow distinguishing radio button states.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set icon: <code>radioButton.setIcon(new ImageIcon("unselected.png"));</code></li>
  <li>Set selection icon: <code>radioButton.setSelectedIcon(new ImageIcon("selected.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIcon()</code> for regular icon, <code>setSelectedIcon()</code> for selected</li>
  <li><strong>✅ Excellent:</strong> Use <code>setPressedIcon()</code> for pressed, combine icon and text</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons — may be messy</li>
</ul>
<p><strong>Important:</strong> <code>setDisabledIcon()</code> — set disabled icon. Use different icons for different states.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Icon will appear on radio button. When selected, icon will change. You can create visually attractive radio buttons.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (87, 'en', 'Radio Button Master: add icon',
        'Set icon via setIcon(), set selection icon via setSelectedIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (88, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Adding Radio Buttons to Group</h2>
<p class="intro">Group makes buttons mutually exclusive. Only one button from group can be selected. Without group, multiple buttons can be selected simultaneously.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>ButtonGroup</code> class — button group</li>
  <li>The <code>add()</code> method — adding to group</li>
  <li>Creating mutually exclusive buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Group ensures mutually exclusive selection, which is necessary for proper radio button operation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Add buttons: <code>group.add(radioButton1);</code><br><code>group.add(radioButton2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ButtonGroup for grouping</li>
  <li><strong>✅ Excellent:</strong> Add all radio buttons to group, use for mutually exclusive options</li>
  <li><strong>⚠️ Avoid:</strong> Adding to multiple groups — may be unexpected</li>
</ul>
<p><strong>Important:</strong> <code>remove()</code> — remove button. <code>getButtonCount()</code> — get count. Use for mutually exclusive options.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Buttons will be in one group. Only one button from group can be selected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (88, 'en', 'Radio Button Master: add to group', 'Create ButtonGroup, add two radio buttons via add()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (89, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Radio Button Mnemonic</h2>
<p class="intro">Mnemonic speeds up work. You can activate radio button via Alt+letter, without using mouse. Without mnemonic, you''ll have to click with mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMnemonic()</code> method — setting mnemonic</li>
  <li>Underlining letter in text</li>
  <li>Creating accessible radio buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Mnemonic improves accessibility and speeds up work for experienced users.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>radioButton.setMnemonic(KeyEvent.VK_R);</code></li>
  <li>Add underline in text: <code>radioButton.setText("Red (&R)");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMnemonic()</code> for setting, KeyEvent.VK_* for keys</li>
  <li><strong>✅ Excellent:</strong> Show mnemonic in text via &, use first letter of word</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating mnemonics</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In radio button text, letter will be underlined. You can activate radio button via Alt+letter.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (89, 'en', 'Radio Button Master: add mnemonic',
        'Set mnemonic VK_R via setMnemonic(), add &R in radio button text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (90, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Handling Radio Button State Change</h2>
<p class="intro">Handling state makes radio button interactive. You can react to selection, update other components. Without handling, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling changes via ItemListener</li>
  <li>Getting state</li>
  <li>Reacting to changes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling state changes allows reacting to user actions and synchronizing interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>radioButton.addItemListener(e -> {<br>
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
  <li><strong>✅ Excellent:</strong> Use <code>getStateChange()</code> for checking, check SELECTED for selection, update other components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state</li>
</ul>
<p><strong>Important:</strong> SELECTED — selected, DESELECTED — deselected. Use for synchronization.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When state changes, handler will fire. You can handle selection and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (90, 'en', 'Radio Button Master: handle state change',
        'Add ItemListener, check getStateChange() == SELECTED, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (91, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Radio Button Action Command</h2>
<p class="intro">Action command allows identifying radio button. You can determine which radio button is selected without checking source. Without command, you''ll have to check source.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setActionCommand()</code> method — setting command</li>
  <li>The <code>getActionCommand()</code> method — getting command</li>
  <li>Identifying radio button via command</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Action command simplifies radio button identification in event handlers.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set command: <code>radioButton.setActionCommand("OPTION1");</code></li>
  <li>Get command in handler: <code>radioButton.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;label.setText("Command: " + cmd);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setActionCommand()</code> for setting, <code>getActionCommand()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Use clear commands, use for identification</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating commands</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In handler, you can get command. When selecting, you can determine command.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (91, 'en', 'Radio Button Master: set action command',
        'Set command "OPTION1" via setActionCommand(), get command in ActionListener via getActionCommand()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (92, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Radio Button Font</h2>
<p class="intro">Font improves visual appearance. You can set needed font, size, style, improve readability. Without setting, font will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setFont()</code> method — setting font</li>
  <li>Improving visual appearance</li>
  <li>Customizing text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting font allows improving visual appearance and readability of text in radio button.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create font: <code>Font font = new Font("Arial", Font.ITALIC, 12);</code></li>
  <li>Set font: <code>radioButton.setFont(font);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setFont()</code> for setting, <code>new Font()</code> for creating</li>
  <li><strong>✅ Excellent:</strong> Use to improve appearance and readability</li>
  <li><strong>⚠️ Avoid:</strong> Too small or large size</li>
</ul>
<p><strong>Important:</strong> Make size reasonable for better readability.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Radio button text will be with set font. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (92, 'en', 'Radio Button Master: set font',
        'Create font new Font("Arial", Font.ITALIC, 12), set via setFont()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (93, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Radio Button Border Painting</h2>
<p class="intro">Border painting affects visual appearance. You can show or hide border, improve design. Without setting, border will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBorderPainted()</code> method — setting border painting</li>
  <li>Managing border visibility</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing border painting allows improving visual appearance and design of radio button.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set painting: <code>radioButton.setBorderPainted(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBorderPainted()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use true for showing, false for hiding, improve visual appearance</li>
  <li><strong>⚠️ Avoid:</strong> Hiding without necessity</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Border will be displayed or hidden. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (93, 'en', 'Radio Button Master: set border painting', 'Set painting true via setBorderPainted()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
