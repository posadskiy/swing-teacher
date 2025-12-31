-- Flyway migration V3: Lesson 28
-- This migration contains lesson, tasks, and documentation for lesson 28

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

-- Task 1: Creating JRadioButtonMenuItem
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (230, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Radio Button in Menu</h2>
<p class="intro">JRadioButtonMenuItem allows selecting one option from a group in menu. Font size, theme, display mode — all of this requires selecting one option. Without them, you''ll have to create separate dialogs.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JRadioButtonMenuItem</code> — radio button in menu</li>
  <li>Creating radio buttons in menu</li>
  <li>Grouping with <code>ButtonGroup</code></li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Radio buttons in menu are necessary for selecting one option from a group of mutually exclusive options.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Create radio buttons: <code>JRadioButtonMenuItem item1 = new JRadioButtonMenuItem("Small");</code> and <code>JRadioButtonMenuItem item2 = new JRadioButtonMenuItem("Medium");</code></li>
  <li>Add to group: <code>group.add(item1);</code> and <code>group.add(item2);</code></li>
  <li>Add to menu: <code>menu.add(item1);</code> and <code>menu.add(item2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ButtonGroup for grouping</li>
  <li><strong>✅ Great:</strong> Create clear option names, select one option by default, add handlers to react to selection</li>
  <li><strong>⚠️ Avoid:</strong> Radio buttons without group — can select multiple</li>
</ul>
<p><strong>Important:</strong> <code>setSelected(true)</code> — select option. <code>isSelected()</code> — check if selected.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Radio buttons will appear in the menu. These are menu items with circles. You can select only one option from the group. When selecting another, previous one is deselected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (230, 'en', 'Menu Radio Button Beginner: Create Option Selection in Menu',
        'Create ButtonGroup, create two JRadioButtonMenuItem, add to group and menu')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 2: Selected State
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (231, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Setting Selected State</h2>
<p class="intro">Selected state shows current choice. User sees which option is active. Without setting state, user doesn''t know current choice.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setSelected(boolean)</code> — setting selected state</li>
  <li>Selecting default option</li>
  <li>Checking state via <code>isSelected()</code></li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Setting selected state is necessary for displaying current choice to user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create radio button: <code>JRadioButtonMenuItem item = new JRadioButtonMenuItem("Medium");</code></li>
  <li>Set selected state: <code>item.setSelected(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Select one option by default</li>
  <li><strong>✅ Great:</strong> Use <code>setSelected(true)</code> to select, check state via <code>isSelected()</code></li>
  <li><strong>⚠️ Avoid:</strong> Selecting multiple options in group — only one will be active</li>
</ul>
<p><strong>Important:</strong> In group only one can be selected.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>One of the options will be selected by default. Circle will be filled.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (231, 'en', 'Menu Radio Button Master: Set Selected State',
        'Create JRadioButtonMenuItem, set selected state via setSelected(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 3: ButtonGroup
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (232, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Creating Selection Group</h2>
<p class="intro">ButtonGroup ensures single selection. In group only one option can be selected. Without group, you can select multiple options simultaneously.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>ButtonGroup</code> — mutual exclusion group</li>
  <li>Adding radio buttons to group</li>
  <li>Ensuring single selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>ButtonGroup is necessary for ensuring single selection among mutually exclusive options.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Create radio buttons: <code>JRadioButtonMenuItem item1 = new JRadioButtonMenuItem("Small");</code> and <code>JRadioButtonMenuItem item2 = new JRadioButtonMenuItem("Medium");</code></li>
  <li>Add to group: <code>group.add(item1);</code> and <code>group.add(item2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ButtonGroup for grouping</li>
  <li><strong>✅ Great:</strong> Add all options to one group, use for mutually exclusive options</li>
  <li><strong>⚠️ Avoid:</strong> Radio buttons without group — can select multiple</li>
</ul>
<p><strong>Important:</strong> You can create multiple groups for different sets of options.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Radio buttons will be in group. You can select only one option. When selecting another, previous one is deselected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (232, 'en', 'Menu Radio Button Master: Create Selection Group',
        'Create ButtonGroup, create three JRadioButtonMenuItem, add all to group and menu')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 4: Icon
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (233, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Adding Icon to Radio Button in Menu</h2>
<p class="intro">Icons improve visual perception. You can quickly recognize option by icon. Without icons, menu looks less attractive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setIcon(Icon)</code> — setting icon</li>
  <li>Class <code>ImageIcon</code> — icon from image</li>
  <li>Visual menu improvement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Icons improve visual perception and help quickly recognize option.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create icon: <code>ImageIcon icon = new ImageIcon("icon.png");</code></li>
  <li>Set icon: <code>item.setIcon(icon);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear icons</li>
  <li><strong>✅ Great:</strong> Use ImageIcon for images, use same icon size, icons should reflect option purpose</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons — may overload menu</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Radio button will have an icon. Icon will be to the left of text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (233, 'en', 'Menu Radio Button Master: Add Icon',
        'Create JRadioButtonMenuItem, create ImageIcon and set via setIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 5: Mnemonic
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (234, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Mnemonic to Radio Button in Menu</h2>
<p class="intro">Mnemonic speeds up work. You can select option by pressing Alt + letter. Without mnemonic, you need to use mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMnemonic(int)</code> — setting mnemonic</li>
  <li>Constants <code>KeyEvent.VK_*</code> — key codes</li>
  <li>Quick keyboard access</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Mnemonics improve accessibility and speed up work from keyboard.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>item.setMnemonic(KeyEvent.VK_M);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> First letter of name</li>
  <li><strong>✅ Great:</strong> Use <code>KeyEvent.VK_*</code> for codes, avoid conflicts with other mnemonics</li>
  <li><strong>⚠️ Avoid:</strong> Duplicate mnemonics — may be conflict</li>
</ul>
<p><strong>Important:</strong> Activated via Alt + letter.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In name, mnemonic letter will be underlined. You can press Alt + letter to select.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (234, 'en', 'Menu Radio Button Master: Add Mnemonic',
        'Create JRadioButtonMenuItem, set mnemonic KeyEvent.VK_M via setMnemonic()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 6: Enabled/Disabled
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (235, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Enable/Disable Option</h2>
<p class="intro">Enable/disable controls availability. You can hide unavailable options or show them gray. Without management, user may try to select unavailable option.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEnabled(boolean)</code> — enable/disable</li>
  <li>Managing option availability</li>
  <li>Visual indication of unavailability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing availability allows you to show option states and control user selection.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Disable option: <code>item.setEnabled(false);</code></li>
  <li>Or enable: <code>item.setEnabled(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Disable unavailable options</li>
  <li><strong>✅ Great:</strong> Use <code>setEnabled(false)</code> to disable, dynamically change availability, show reason for unavailability</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without explanation — user won''t understand why</li>
</ul>
<p><strong>Important:</strong> Disabled option is gray and inactive.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Option will become gray and inactive. You cannot select disabled option.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (235, 'en', 'Menu Radio Button Master: Enable/Disable Option',
        'Create JRadioButtonMenuItem, disable it via setEnabled(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 7: Tooltip
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (236, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Adding Tooltip to Radio Button in Menu</h2>
<p class="intro">Tooltips help user. You can explain option purpose, give additional information. Without tooltips, user may not understand purpose.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipText(String)</code> — setting tooltip</li>
  <li>Adding popup tooltips</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltips improve user experience by providing additional information about options.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>item.setToolTipText("Select small font size");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear tooltips</li>
  <li><strong>✅ Great:</strong> Explain option purpose, give additional information</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Make tooltips short. Show on mouse hover.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When hovering mouse, a tooltip will appear. Tooltip will show additional information.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (236, 'en', 'Menu Radio Button Master: Add Tooltip',
        'Create JRadioButtonMenuItem, set tooltip via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 8: ActionListener
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (237, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Handling Radio Button Selection in Menu</h2>
<p class="intro">Handling selection makes menu functional. You can apply selected option, change settings, update interface. Without handler, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>ActionListener</code> — action handler</li>
  <li>Method <code>addActionListener()</code> — adding listener</li>
  <li>Reacting to option selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling selection is necessary for applying selected option and updating interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>item.addActionListener(e -> {<br>
&nbsp;&nbsp;label.setText("Selected option: " + item.getText());<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> ActionListener to handle</li>
  <li><strong>✅ Great:</strong> Use lambda expressions for simple actions, apply selected option, update interface on selection</li>
  <li><strong>⚠️ Avoid:</strong> Handler without action — selection has no effect</li>
</ul>
<p><strong>Important:</strong> <code>getText()</code> — get option text. <code>isSelected()</code> — check if selected.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When selecting option, an action will be performed. If you used JLabel, a message will appear on screen.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (237, 'en', 'Menu Radio Button Master: Handle Selection',
        'Create JRadioButtonMenuItem, add ActionListener that outputs option text to console')
ON CONFLICT (task_id, language_code) DO NOTHING;
