-- Flyway migration V3: Lesson 12
-- This migration contains lesson, tasks, and documentation for lesson 12

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (101, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Handling Toggle Button State</h2>
<p class="intro">Handling state makes toggle button interactive. You can update other components, perform actions, change modes. Without this, toggle button will only be for display.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling state via ActionListener</li>
  <li>The <code>isSelected()</code> method — checking state</li>
  <li>Reacting to toggle</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling state allows reacting to user actions and updating interface in real time.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>JLabel label = new JLabel();<br>
toggleButton.addActionListener(e -> {<br>
&nbsp;&nbsp;if (toggleButton.isSelected()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enabled!");<br>
&nbsp;&nbsp;} else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Disabled!");<br>
&nbsp;&nbsp;}<br>
});<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>isSelected()</code> for checking</li>
  <li><strong>✅ Excellent:</strong> Update other components on toggle, use ItemListener for more precise handling</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state — loss of functionality</li>
</ul>
<p><strong>Important:</strong> <code>setSelected(boolean)</code> — set state. Use for switching modes.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When toggling, handler will fire. You can check state and perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (101, 'en', 'Toggle Button Master: handle state',
        'Add ActionListener, check isSelected(), output message depending on state')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (102, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Toggle Button Mnemonic</h2>
<p class="intro">Mnemonic speeds up work. You can activate toggle button via Alt+letter, without using mouse. Without mnemonic, you''ll have to click with mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMnemonic()</code> method — setting mnemonic</li>
  <li>Underlining letter in text</li>
  <li>Creating accessible toggle buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Mnemonic improves accessibility and speeds up work for experienced users.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>toggleButton.setMnemonic(KeyEvent.VK_T);</code></li>
  <li>Add underline in text: <code>toggleButton.setText("Enable (&T)");</code></li>
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
<p>In toggle button text, letter will be underlined. You can activate toggle button via Alt+letter.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (102, 'en', 'Toggle Button Master: add mnemonic',
        'Set mnemonic VK_T via setMnemonic(), add &T in toggle button text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (103, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling State Change</h2>
<p class="intro">Handling state makes toggle button interactive. You can react to toggle, update other components. Without handling, toggle won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling changes via ItemListener</li>
  <li>Getting state</li>
  <li>Reacting to toggle</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling state changes allows synchronizing interface and reacting to user actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>toggleButton.addItemListener(e -> {<br>
&nbsp;&nbsp;boolean selected = toggleButton.isSelected();<br>
&nbsp;&nbsp;label.setText("Enabled: " + selected);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addItemListener()</code> for handling</li>
  <li><strong>✅ Excellent:</strong> Use <code>isSelected()</code> for checking, <code>getStateChange()</code> for change, update other components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state</li>
</ul>
<p><strong>Important:</strong> Use for synchronizing interface components.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When state changes, handler will fire. You can handle toggle and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (103, 'en', 'Toggle Button Master: handle state change',
        'Add ItemListener, check isSelected(), output state')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (104, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Toggle Button Action Command</h2>
<p class="intro">Action command allows identifying toggle button. You can determine which toggle button is toggled without checking source. Without command, you''ll have to check source.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setActionCommand()</code> method — setting command</li>
  <li>The <code>getActionCommand()</code> method — getting command</li>
  <li>Identifying toggle button via command</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Action command simplifies toggle button identification in event handlers.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set command: <code>toggleButton.setActionCommand("TOGGLE");</code></li>
  <li>Get command in handler: <code>toggleButton.addActionListener(e -> {<br>
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
<p>In handler, you can get command. When toggling, you can determine command.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (104, 'en', 'Toggle Button Master: set action command',
        'Set command "TOGGLE" via setActionCommand(), get command in ActionListener via getActionCommand()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (105, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Toggle Button Font</h2>
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
<p>Setting font allows improving visual appearance and readability of text in toggle button.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create font: <code>Font font = new Font("Serif", Font.PLAIN, 16);</code></li>
  <li>Set font: <code>toggleButton.setFont(font);</code></li>
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
<p>Toggle button text will be with set font. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (105, 'en', 'Toggle Button Master: set font',
        'Create font new Font("Serif", Font.PLAIN, 16), set via setFont()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (106, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Toggle Button Border Painting</h2>
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
<p>Managing border painting allows improving visual appearance and design of toggle button.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set painting: <code>toggleButton.setBorderPainted(true);</code></li>
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
VALUES (106, 'en', 'Toggle Button Master: set border painting', 'Set painting true via setBorderPainted()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
