-- Flyway migration V3: Lesson 32
-- This migration contains lesson, tasks, and documentation for lesson 32

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (269, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Showing Information to User</h2>
<p class="intro">Dialogs inform user about important information. "File saved", "Loading error", "Are you sure?" — all of this is dialogs. Without them, user doesn''t know what''s happening.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JOptionPane</code> — dialog windows</li>
  <li>Method <code>showMessageDialog()</code> — show message</li>
  <li>Message types: information, warning, error, question</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Dialogs are necessary for informing user about important events and application states.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show information message: <code>JOptionPane.showMessageDialog(frame, "File saved successfully!", "Information", JOptionPane.INFORMATION_MESSAGE);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>INFORMATION_MESSAGE</code> for information</li>
  <li><strong>✅ Great:</strong> <code>WARNING_MESSAGE</code> for warnings, <code>ERROR_MESSAGE</code> for errors, <code>QUESTION_MESSAGE</code> for questions</li>
</ul>
<p><strong>Important:</strong> Parent: <code>frame</code> or <code>null</code> (centers on screen). You can use HTML in message for formatting. Dialog blocks execution until closed (modal).</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dialog window with message will appear. This is a window with icon (information, warning, error) and OK button. User must close dialog to continue.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (269, 'en', 'Message Dialog: Show Information to User',
        'Show information dialog window with message "Operation completed successfully!"')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (270, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Requesting Confirmation</h2>
<p class="intro">Confirmation protects from errors. Deleting file, exiting without saving, dangerous operations — all of this requires confirmation. This prevents accidental actions.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showConfirmDialog()</code> — confirmation dialog</li>
  <li>Answer options: YES, NO, CANCEL</li>
  <li>Handling dialog result</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Confirmation is necessary for preventing accidental actions and protecting from errors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show confirmation dialog: <code>int result = JOptionPane.showConfirmDialog(frame, "Are you sure?", "Confirmation", JOptionPane.YES_NO_OPTION);</code></li>
  <li>Handle result: <code>if (result == JOptionPane.YES_OPTION) {<br>
&nbsp;&nbsp;label.setText("User agreed");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>YES_NO_OPTION</code> for simple choice</li>
  <li><strong>✅ Great:</strong> <code>YES_NO_CANCEL_OPTION</code> for three options, handle all possible results</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring result — action will always execute</li>
</ul>
<p><strong>Important:</strong> Always check result before executing action. Use for dangerous operations (deletion, exit without saving).</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dialog with question and buttons will appear. This is a window with question and buttons (Yes/No or Yes/No/Cancel). User chooses option, and you get result.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (270, 'en', 'Confirmation Dialog: Ask Permission',
        'Show confirmation dialog with question "Are you sure?" and handle result')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (271, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Adding Hotkey to Menu</h2>
<p class="intro">Hotkeys speed up work. You can open menu without mouse, which is convenient for experienced users. Without them, you''ll have to always use mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMnemonic()</code> — setting mnemonic</li>
  <li>Hotkeys for menus</li>
  <li>Improving accessibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Hotkeys are necessary for improving accessibility and speeding up work with application.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>menu.setMnemonic(KeyEvent.VK_F);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMnemonic()</code> for hotkey</li>
  <li><strong>✅ Great:</strong> Use first letter of menu name, underline letter in text</li>
  <li><strong>⚠️ Avoid:</strong> Using rare letters — user won''t remember</li>
</ul>
<p><strong>Important:</strong> Alt + mnemonic opens menu. Letter is automatically underlined. Avoid conflicts with other hotkeys.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In menu name, letter will be underlined. You can press Alt+letter to open menu.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (271, 'en', 'Menu Master: Add Hotkey', 'Set mnemonic VK_F via setMnemonic()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (272, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Adding Separator to Menu</h2>
<p class="intro">Separators group menu items. You can separate related commands, create visual groups. Without separators, all items will be in one group.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addSeparator()</code> — adding separator</li>
  <li>Creating visual separation</li>
  <li>Grouping menu items</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Separators are necessary for visual grouping of menu items and improving organization.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add items: <code>menu.add(new JMenuItem("Open"));</code> and <code>menu.add(new JMenuItem("Save"));</code></li>
  <li>Add separator: <code>menu.addSeparator();</code></li>
  <li>Add more items: <code>menu.add(new JMenuItem("Exit"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addSeparator()</code> for separation</li>
  <li><strong>✅ Great:</strong> Group related commands, separate different categories</li>
  <li><strong>⚠️ Avoid:</strong> Too many separators — may be overloaded</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A separator will appear in menu. Horizontal line will separate menu items. You can create visual groups.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (272, 'en', 'Menu Master: Add Separator',
        'Add two menu items, add separator via addSeparator(), add another item')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (273, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Mnemonic to Menu</h2>
<p class="intro">Mnemonic speeds up work. You can activate menu via Alt+letter, without using mouse. Without mnemonic, you''ll have to click with mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMnemonic()</code> — setting mnemonic</li>
  <li>Underlining letter in text</li>
  <li>Creating accessible menus</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Mnemonic is necessary for improving accessibility and speeding up work with menus.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>menu.setMnemonic(KeyEvent.VK_F);</code></li>
  <li>Add underline in text: <code>menu.setText("File (&F)");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMnemonic()</code> to set</li>
  <li><strong>✅ Great:</strong> Use KeyEvent.VK_* for keys, show mnemonic in text via &, use first letter of word</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating mnemonics</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In menu text, letter will be underlined. You can activate menu via Alt+letter.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (273, 'en', 'Menu Master: Add Mnemonic',
        'Set mnemonic VK_F via setMnemonic(), add &F in menu text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (277, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Adding Tooltip to Checkbox Menu Item</h2>
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
  <li>Set tooltip: <code>checkBoxMenuItem.setToolTipText("Show grid");</code></li>
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
VALUES (277, 'en', 'Checkbox Menu Item Master: Add Tooltip',
        'Set tooltip "Show grid" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (274, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Adding Separator to Menu (Extended)</h2>
<p class="intro">Separator creates visual separation. You can separate groups of menu items, improve organization. Without separator, items will blend together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addSeparator()</code> — adding separator</li>
  <li>Creating visual separation</li>
  <li>Improving menu organization</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Separators are necessary for visual organization of menu items.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add items: <code>menu.add(menuItem1);</code> and <code>menu.add(menuItem2);</code></li>
  <li>Add separator: <code>menu.addSeparator();</code></li>
  <li>Add more items: <code>menu.add(menuItem3);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addSeparator()</code> for separation</li>
  <li><strong>✅ Great:</strong> Separate groups of items, use for organization, combine with other elements</li>
  <li><strong>⚠️ Avoid:</strong> Too many separators</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A separator will appear between items. Groups of items will be visually separated.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (274, 'en', 'Menu Master: Add Separator',
        'Add two menu items, add separator via addSeparator(), add another item')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (275, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Configuring Menu Opening Delay</h2>
<p class="intro">Delay determines opening speed. You can configure how fast menu will open on hover, improve user experience. Without configuration, delay will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDelay()</code> — setting delay</li>
  <li>Managing opening speed</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring delay is necessary for optimizing user experience when working with menus.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set delay: <code>menu.setDelay(200);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDelay()</code> to set</li>
  <li><strong>✅ Great:</strong> Use reasonable values, adapt to needs, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Too small delay — may be annoying</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu opening delay will change. Menu will open with specified delay.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (275, 'en', 'Menu Master: Configure Delay', 'Set delay 200 via setDelay(200)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (276, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Setting Action Command for Checkbox Menu Item</h2>
<p class="intro">Action command allows identifying menu item. You can determine which item is selected without checking source. Without command, you''ll have to check source.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setActionCommand()</code> — setting command</li>
  <li>Method <code>getActionCommand()</code> — getting command</li>
  <li>Identifying menu item through command</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Action commands are necessary for identifying menu items in event handlers.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set command: <code>checkBoxMenuItem.setActionCommand("CHECK");</code></li>
  <li>Get command in handler: <code>checkBoxMenuItem.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;label.setText("Command: " + cmd);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setActionCommand()</code> to set</li>
  <li><strong>✅ Great:</strong> Use <code>getActionCommand()</code> to get, use clear commands, use for identification</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating commands</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In handler, you can get command. When selecting, you can determine command.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (276, 'en', 'Checkbox Menu Master: Set Action Command',
        'Set command "CHECK" via setActionCommand(), get command in ActionListener via getActionCommand()')
ON CONFLICT (task_id, language_code) DO NOTHING;
