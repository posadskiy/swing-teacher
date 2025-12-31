-- Flyway migration V3: Lesson 9
-- This migration contains lesson, tasks, and documentation for lesson 9

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (74, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Toggle Button</h2>
<p class="intro">Toggle buttons (<code>JToggleButton</code>) allow turning functions on and off. "Bold text", "Italic", "Underlined" — all of this are toggle buttons. They remain in the selected state until the next press.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JToggleButton</code> class — toggle button</li>
  <li>Creating a toggle button</li>
  <li>Two states: pressed/not pressed</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Toggle buttons allow turning functions on and off with one press. They remain in the selected state until the next press.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a toggle button: <code>JToggleButton toggle = new JToggleButton("Enable");</code></li>
  <li>Add to the form: <code>add(toggle);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with text: <code>new JToggleButton("Text")</code></li>
  <li><strong>✅ Excellent:</strong> Use icon for visual distinction of states</li>
  <li><strong>⚠️ Avoid:</strong> Empty toggle button — unclear purpose</li>
</ul>
<p><strong>Important:</strong> Toggle button has two states: selected/not selected. Check state: <code>toggle.isSelected()</code>. Set state: <code>toggle.setSelected(true)</code>. Similar to JCheckBox, but looks like a button. Can be grouped via <code>ButtonGroup</code> for single selection.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A toggle button will appear on the form. This is a button that stays pressed after clicking. On second click, it unpresses.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (74, 'en', 'Beginner Toggle Button: create a toggle button',
        'Create a toggle button with text "Enable" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (75, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Handling Checkbox Clicks</h2>
<p class="intro">Handling clicks makes checkbox interactive. You can update other components, perform actions, show/hide elements. Without this, checkbox will only be for display.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Adding <code>ActionListener</code> to checkbox</li>
  <li>Handling checkbox clicks</li>
  <li>Reacting to state changes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling clicks allows reacting to user actions and updating the interface in real time.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>JLabel label = new JLabel();<br>
checkBox.addActionListener(e -> {<br>
&nbsp;&nbsp;if (checkBox.isSelected()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Checkbox selected!");<br>
&nbsp;&nbsp;} else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Checkbox unchecked!");<br>
&nbsp;&nbsp;}<br>
});<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addActionListener()</code> for handling</li>
  <li><strong>✅ Excellent:</strong> Check <code>isSelected()</code> to determine state, update other components on change</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state — loss of functionality</li>
</ul>
<p><strong>Important:</strong> <code>setSelected(boolean)</code> — set state programmatically. You can use ItemListener instead of ActionListener. ActionListener fires on click.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking checkbox, handler will fire. You can check state and perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (75, 'en', 'Checkbox Master: handle clicks',
        'Add ActionListener to checkbox, check isSelected(), output message depending on state')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (76, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Checkbox Text Position</h2>
<p class="intro">Text position makes checkboxes flexible. You can place text on left or right. Without setting, text will be on right by default.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setHorizontalTextPosition()</code> method — text position</li>
  <li>Configuring text placement relative to checkbox</li>
  <li>Creating custom placement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Configuring text position allows creating a more flexible and customized interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set text position: <code>checkBox.setHorizontalTextPosition(SwingConstants.LEFT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> LEFT for text on left, RIGHT for text on right (default)</li>
  <li><strong>✅ Excellent:</strong> CENTER for centering, LEADING/TRAILING for text direction</li>
  <li><strong>⚠️ Avoid:</strong> Changing position frequently — may be unexpected</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be at the specified position. Text can be on left or right of checkbox.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (76, 'en', 'Checkbox Master: configure text position',
        'Set text position LEFT via setHorizontalTextPosition()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (77, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Checkbox State Model</h2>
<p class="intro">State model allows controlling state. You can get model, change it, create custom model. Without model, you cannot control state programmatically.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getModel()</code> method — getting model</li>
  <li>The <code>setModel()</code> method — setting model</li>
  <li>Working with ButtonModel</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Working with state model allows programmatically controlling checkbox state and creating custom models.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get model: <code>ButtonModel model = checkBox.getModel();</code></li>
  <li>Set state: <code>model.setSelected(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getModel()</code> for getting, <code>setModel()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Create custom models, use for programmatic management</li>
  <li><strong>⚠️ Avoid:</strong> Changing model directly — may be unexpected</li>
</ul>
<p><strong>Important:</strong> <code>isSelected()</code> — check state. Use for programmatic management.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can manage state through model. State can be changed programmatically.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (77, 'en', 'Checkbox Master: work with state model',
        'Get model via getModel(), set state true via setSelected()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (78, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Checkbox Mnemonic</h2>
<p class="intro">Mnemonic speeds up work. You can activate checkbox via Alt+letter, without using mouse. Without mnemonic, you''ll have to click with mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMnemonic()</code> method — setting mnemonic</li>
  <li>Underlining letter in text</li>
  <li>Creating accessible checkboxes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Mnemonic improves accessibility and speeds up work for experienced users.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>checkBox.setMnemonic(KeyEvent.VK_C);</code></li>
  <li>Add underline in text: <code>checkBox.setText("Agree (&C)");</code></li>
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
<p>In checkbox text, letter will be underlined. You can activate checkbox via Alt+letter.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (78, 'en', 'Checkbox Master: add mnemonic',
        'Set mnemonic VK_C via setMnemonic(), add &C in checkbox text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (79, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Handling State Changes</h2>
<p class="intro">Handling state makes checkbox interactive. You can react to selection, update other components. Without handling, selection won''t have effect.</p>
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
  <li>Add listener: <code>checkBox.addItemListener(e -> {<br>
&nbsp;&nbsp;boolean selected = checkBox.isSelected();<br>
&nbsp;&nbsp;label.setText("Selected: " + selected);<br>
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
<p>When state changes, handler will fire. You can handle selection and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (79, 'en', 'Checkbox Master: handle state changes',
        'Add ItemListener, check isSelected(), output state')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (80, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Three-State Checkbox</h2>
<p class="intro">Three-state checkbox adds indeterminate state. You can show that selection is not made, improve user experience. Without three-state, only two states.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setModel()</code> method — setting model</li>
  <li>The <code>JToggleButton.ToggleButtonModel</code> class — toggle button model</li>
  <li>Creating three-state checkbox</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Three-state checkbox allows showing indeterminate state, which improves user experience in some scenarios.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>ButtonModel model = new JToggleButton.ToggleButtonModel();</code></li>
  <li>Set model: <code>checkBox.setModel(model);</code></li>
  <li>Set indeterminate state: <code>checkBox.getModel().setPressed(true);<br>
checkBox.getModel().setArmed(true);<br>
checkBox.getModel().setSelected(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setModel()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use for indeterminate state, combine states, use to improve UX</li>
  <li><strong>⚠️ Avoid:</strong> Too complex states</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Checkbox will be three-state. You can show indeterminate state.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (80, 'en', 'Checkbox Master: make three-state',
        'Create ToggleButtonModel, set via setModel(), configure states for indeterminate')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (81, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Grouping Checkboxes</h2>
<p class="intro">Grouping improves organization. You can logically link checkboxes, improve understanding. Without grouping, checkboxes will be scattered.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Logical grouping of checkboxes</li>
  <li>Creating groups of related checkboxes</li>
  <li>Improving interface organization</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Grouping related checkboxes improves interface organization and simplifies handling logically related elements.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>List&lt;JCheckBox&gt; group = Arrays.asList(checkBox1, checkBox2, checkBox3);</code></li>
  <li>Handle group: <code>group.forEach(cb -> cb.addItemListener(e -> updateGroup()));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Collections for grouping</li>
  <li><strong>✅ Excellent:</strong> Use for logical linking, handle group together, improve organization</li>
  <li><strong>⚠️ Avoid:</strong> Grouping unrelated checkboxes</li>
</ul>
<p><strong>Important:</strong> Group logically related checkboxes. Make groups clear.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Checkboxes will be logically grouped. You can handle group together.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (81, 'en', 'Checkbox Master: group checkboxes',
        'Create list from checkboxes, add ItemListener to all via forEach()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (82, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Checkbox Font</h2>
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
<p>Setting font allows improving visual appearance and readability of text in checkbox.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create font: <code>Font font = new Font("Arial", Font.BOLD, 14);</code></li>
  <li>Set font: <code>checkBox.setFont(font);</code></li>
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
<p>Checkbox text will be with set font. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (82, 'en', 'Checkbox Master: set font',
        'Create font new Font("Arial", Font.BOLD, 14), set via setFont()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
