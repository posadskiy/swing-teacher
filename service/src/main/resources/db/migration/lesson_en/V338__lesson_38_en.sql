-- Flyway migration V3: Lesson 38
-- This migration contains lesson, tasks, and documentation for lesson 38

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (317, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Placing Components in Row with FlowLayout</h2>
<p class="intro">FlowLayout — simplest layout. Components line up in row and automatically wrap. Perfect for toolbars, buttons, simple forms. This is default layout for JPanel.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>FlowLayout</code> — row layout manager</li>
  <li>Creating FlowLayout</li>
  <li>Automatic component arrangement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>FlowLayout is necessary for simple row layout of components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set FlowLayout: <code>setLayout(new FlowLayout());</code></li>
  <li>Add components: <code>add(new JButton("Button 1"));</code><br>
<code>add(new JButton("Button 2"));</code><br>
<code>add(new JButton("Button 3"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> For simple panels</li>
  <li><strong>✅ Great:</strong> Configure alignment, configure gaps</li>
  <li><strong>⚠️ Avoid:</strong> For complex interfaces better use other layouts</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will line up in row. They will be placed one after another from left to right. If they don''t fit — will wrap to new line.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (317, 'en', 'FlowLayout Beginner: Place Components in Row', 'Set FlowLayout and add three buttons')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (318, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Accelerator to Menu Item</h2>
<p class="intro">Accelerators speed up work. You can perform action without opening menu, which is very fast. Without them, you''ll have to always open menu.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAccelerator()</code> — setting accelerator</li>
  <li>Class <code>KeyStroke</code> — key combination</li>
  <li>Creating hotkeys for menu items</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Accelerators are necessary for speeding up work with menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create key combination: <code>KeyStroke stroke = KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_DOWN_MASK);</code></li>
  <li>Set accelerator: <code>menuItem.setAccelerator(stroke);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAccelerator()</code> for hotkey</li>
  <li><strong>✅ Great:</strong> Use standard combinations (Ctrl+S, Ctrl+C, Ctrl+V), show accelerator in menu text</li>
  <li><strong>⚠️ Avoid:</strong> Using non-standard combinations — user won''t remember</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu item will show label with key combination. You can press Ctrl+key to perform action.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (318, 'en', 'Menu Item Master: Add Accelerator',
        'Create KeyStroke for Ctrl+S via getKeyStroke(), set accelerator via setAccelerator()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (319, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Enabling and Disabling Menu Item</h2>
<p class="intro">Enabling/disabling items makes menu contextual. You can disable unavailable commands, enable when needed. Without this, user may try to perform unavailable command.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEnabled()</code> — enabling/disabling</li>
  <li>Managing menu item availability</li>
  <li>Dynamic state change</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing menu item availability is necessary for creating contextual interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Disable item: <code>menuItem.setEnabled(false);</code></li>
  <li>Or enable: <code>menuItem.setEnabled(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEnabled(false)</code> for disabling</li>
  <li><strong>✅ Great:</strong> Dynamically change state, disable unavailable commands, enable when state changes</li>
  <li><strong>⚠️ Avoid:</strong> Always disabled — may be unclear</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu item will become unavailable. Disabled item will be gray and inactive. You can enable when needed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (319, 'en', 'Menu Item Master: Enable and Disable Item',
        'Disable item via setEnabled(false), then enable via setEnabled(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (320, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Adding Tooltip to Menu Item</h2>
<p class="intro">Tooltip provides additional information. You can show command description, hotkeys. Without tooltip, user won''t see additional information.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipText()</code> — setting tooltip</li>
  <li>Creating informative menu items</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltip is necessary for providing additional information about menu item.</p>
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
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use clear tooltips, use for description, use for hotkeys</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tooltip will appear on hover. You can show command description.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (320, 'en', 'Menu Item Master: Add Tooltip',
        'Set tooltip "Save document" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (324, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Adding Tooltip to JRadioButtonMenuItem</h2>
<p class="intro">Tooltip improves informativeness. You can add menu item description, improve understanding. Without tooltip, user may not understand purpose.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipText()</code> — setting tooltip</li>
  <li>Improving informativeness</li>
  <li>Creating clear interface</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltip is necessary for improving informativeness of menu item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>radioButtonMenuItem.setToolTipText("Select theme");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use clear texts, use for improving informativeness, improve understanding</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tooltip will appear on hover. You can improve informativeness.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (324, 'en', 'Radio Button Menu Item Master: Add Tooltip',
        'Set tooltip "Select theme" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (321, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Accelerator to Menu Item (Extended)</h2>
<p class="intro">Accelerator speeds up work. You can activate menu item via key combination, without opening menu. Without accelerator, you''ll have to open menu.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAccelerator()</code> — setting accelerator</li>
  <li>Class <code>KeyStroke</code> — key combination</li>
  <li>Creating quick keys</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Accelerators are necessary for speeding up work with menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create combination: <code>KeyStroke keyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_DOWN_MASK);</code></li>
  <li>Set accelerator: <code>menuItem.setAccelerator(keyStroke);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAccelerator()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use <code>KeyStroke.getKeyStroke()</code> for creating, use CTRL, ALT, SHIFT, use standard combinations</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating combinations</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Key combination will appear in menu. You can activate item via combination.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (321, 'en', 'Menu Item Master: Add Accelerator',
        'Create KeyStroke for Ctrl+S via getKeyStroke(), set via setAccelerator()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (322, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Adding Icon to Menu Item</h2>
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
<p>Icon is necessary for improving readability and visual styling of menu items.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set icon: <code>menuItem.setIcon(new ImageIcon("icon.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIcon()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use ImageIcon for loading, use for visual styling, use clear icons</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons — may be ugly</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu item will have icon. Item will have visual element.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (322, 'en', 'Menu Item Master: Add Icon', 'Set icon via setIcon() with ImageIcon')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (323, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Setting Action Command for JRadioButtonMenuItem</h2>
<p class="intro">Action command allows identifying menu item. You can determine which item is selected without checking source. Without command, you''ll have to check source.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setActionCommand()</code> — setting command</li>
  <li>Method <code>getActionCommand()</code> — getting command</li>
  <li>Identifying menu item via command</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Action command is necessary for identifying menu item in handler.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set command: <code>radioButtonMenuItem.setActionCommand("RADIO");</code></li>
  <li>Get command in handler: <code>radioButtonMenuItem.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;label.setText("Command: " + cmd);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setActionCommand()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use <code>getActionCommand()</code> for getting, use clear commands, use for identification</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating commands</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get command in handler. When selecting, you can determine command.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (323, 'en', 'Radio Menu Master: Set Action Command',
        'Set command "RADIO" via setActionCommand(), get command in ActionListener via getActionCommand()')
ON CONFLICT (task_id, language_code) DO NOTHING;
