-- Flyway migration V3: Lesson 43
-- This migration contains lesson, tasks, and documentation for lesson 43

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (370, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Group Layout with GroupLayout</h2>
<p class="intro">GroupLayout allows creating complex layouts. Component groups, alignment, sequential and parallel placement — all of this requires GroupLayout. Without it, complex forms will look messy.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>GroupLayout</code> — group layout</li>
  <li>Classes <code>SequentialGroup</code> and <code>ParallelGroup</code> — groups</li>
  <li>Creating group layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>GroupLayout is necessary for creating complex layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create manager: <code>GroupLayout layout = new GroupLayout(panel);<br>
panel.setLayout(layout);</code></li>
  <li>Create horizontal group: <code>layout.setHorizontalGroup(<br>
&nbsp;&nbsp;layout.createSequentialGroup()<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button2)<br>
);</code></li>
  <li>Create vertical group: <code>layout.setVerticalGroup(<br>
&nbsp;&nbsp;layout.createParallelGroup()<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button2)<br>
);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createSequentialGroup()</code> for sequential placement</li>
  <li><strong>✅ Great:</strong> Use <code>createParallelGroup()</code> for parallel placement, combine sequential and parallel groups</li>
  <li><strong>⚠️ Avoid:</strong> Too complex structure — difficult to maintain</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed in groups. Horizontally and vertically — as you configure.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (370, 'en', 'GroupLayout Beginner: Create Group Layout',
        'Create GroupLayout, create horizontal sequential group with two buttons, create vertical parallel group')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (371, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Gaps Between Components in GroupLayout</h2>
<p class="intro">Gaps make interface neat. Components won''t be pressed against each other, there will be visual separation. Without gaps, interface will look overloaded.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addGap()</code> — adding gap</li>
  <li>Creating gaps between components</li>
  <li>Configuring gap sizes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gaps are necessary for creating neat interface with visual separation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add component: <code>layout.createSequentialGroup()<br>
&nbsp;&nbsp;.addComponent(button1)</code></li>
  <li>Add gap: <code>.addGap(10)</code></li>
  <li>Add another component: <code>.addComponent(button2)</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addGap()</code> for gaps</li>
  <li><strong>✅ Great:</strong> Use same gaps for uniformity, add gaps at start and end of groups</li>
  <li><strong>⚠️ Avoid:</strong> Too large gaps — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Gaps will appear between components. Components won''t be pressed against each other. Interface will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (371, 'en', 'GroupLayout Master: Add Gaps Between Components',
        'In sequential group add component, add gap 10, add another component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (373, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Handling Multiple Buttons with One ActionListener</h2>
<p class="intro">One handler for multiple buttons simplifies code. You can determine event source and perform needed action. Without this, you''ll have to create separate handler for each button.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling multiple event sources</li>
  <li>Method <code>getSource()</code> — determining source</li>
  <li>Creating universal handlers</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>One handler is necessary for simplifying code when handling multiple buttons.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create handler: <code>ActionListener listener = e -> {<br>
&nbsp;&nbsp;if (e.getSource() == button1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Button 1");<br>
&nbsp;&nbsp;} else if (e.getSource() == button2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Button 2");<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Add to buttons: <code>button1.addActionListener(listener);<br>
button2.addActionListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getSource()</code> for determining</li>
  <li><strong>✅ Great:</strong> Use <code>getActionCommand()</code> for command, use one handler for group, use switch for multiple options</li>
  <li><strong>⚠️ Avoid:</strong> Too many conditions — may be complex</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>One handler will work for all buttons. When clicking any button, handler will trigger, which will determine source.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (373, 'en', 'ActionListener Master: Handle Multiple Buttons',
        'Create ActionListener, check getSource() for two buttons, add handler to both buttons')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (372, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Creating Parallel Groups in GroupLayout</h2>
<p class="intro">Parallel groups allow aligning components. You can create columns, rows, complex layouts. Without this, components will only be placed sequentially.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>createParallelGroup()</code> — creating parallel group</li>
  <li>Aligning components in parallel</li>
  <li>Creating complex layouts</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Parallel groups are necessary for aligning components and creating complex layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create parallel group: <code>layout.setHorizontalGroup(<br>
&nbsp;&nbsp;layout.createParallelGroup()<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button2)<br>
);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createParallelGroup()</code> for parallel placement</li>
  <li><strong>✅ Great:</strong> Combine sequential and parallel groups, use for creating columns and rows</li>
  <li><strong>⚠️ Avoid:</strong> Only parallel groups — may be inflexible</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be aligned in parallel. They will be placed next to each other.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (372, 'en', 'GroupLayout Master: Create Parallel Groups',
        'Create horizontal parallel group with two buttons')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (374, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Using Action Command in ActionListener</h2>
<p class="intro">Action command allows identifying source. You can determine which button is pressed without checking source. Without command, you''ll have to check source.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getActionCommand()</code> — getting command</li>
  <li>Method <code>setActionCommand()</code> — setting command</li>
  <li>Identifying source through command</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Action command is necessary for identifying event source.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set command: <code>button.setActionCommand("SAVE");</code></li>
  <li>Get command in handler: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;if ("SAVE".equals(cmd)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Saving!");<br>
&nbsp;&nbsp;}<br>
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
<p>In handler you''ll be able to get command. When clicking, you can determine command.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (374, 'en', 'ActionListener Master: Use Action Command',
        'Set command "SAVE" via setActionCommand(), get command in ActionListener via getActionCommand()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (375, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Determining Event Time in ActionListener</h2>
<p class="intro">Event time allows tracking actions. You can know when event occurred, create logs, track sequence. Without time, you can''t track actions.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getWhen()</code> — getting time</li>
  <li>Determining event time</li>
  <li>Creating timestamps</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Event time is necessary for tracking actions and creating logs.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get time: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;long when = e.getWhen();<br>
&nbsp;&nbsp;label.setText("Time: " + new Date(when));<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getWhen()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for logging, use for tracking, convert to Date</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring time</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get event time. When clicking, you can know time.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (375, 'en', 'ActionListener Master: Determine When',
        'Add ActionListener, get time via getWhen(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (377, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Getting Key Character in KeyListener</h2>
<p class="intro">Key character is important for text input. You can get character, process text, improve functionality. Without character, you can''t process text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getKeyChar()</code> — getting character</li>
  <li>Getting pressed key character</li>
  <li>Processing text input</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Key character is necessary for processing text input.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get character: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyTyped(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;char ch = e.getKeyChar();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Character: " + ch);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getKeyChar()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use <code>keyTyped()</code> for characters, process text input, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring special keys</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get pressed key character. You can process text input.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (377, 'en', 'KeyListener Master: Get Key Character',
        'Add KeyListener, override keyTyped(), get character via getKeyChar(), output')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (376, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Determining Modifiers in ActionListener</h2>
<p class="intro">Modifiers allow handling combinations. You can determine if Ctrl, Alt, Shift are pressed, handle combinations. Without modifiers, you can''t handle combinations.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getModifiers()</code> — getting modifiers</li>
  <li>Checking Ctrl, Alt, Shift</li>
  <li>Handling key combinations</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Modifiers are necessary for handling key combinations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get modifiers: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;int modifiers = e.getModifiers();<br>
&nbsp;&nbsp;if ((modifiers & ActionEvent.CTRL_MASK) != 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Ctrl pressed!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getModifiers()</code> for getting</li>
  <li><strong>✅ Great:</strong> Check CTRL_MASK for Ctrl, check ALT_MASK for Alt, check SHIFT_MASK for Shift</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring modifiers</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to determine modifiers. When clicking, you can know if Ctrl, Alt, Shift are pressed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (376, 'en', 'ActionListener Master: Determine Modifiers',
        'Add ActionListener, check getModifiers() & CTRL_MASK, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (379, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Getting Key Code in KeyListener</h2>
<p class="intro">Key code is important for special keys. You can handle Enter, Escape, arrows, improve functionality. Without code, you can''t handle special keys.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getKeyCode()</code> — getting key code</li>
  <li>Constants <code>KeyEvent.VK_*</code> — key codes</li>
  <li>Handling special keys</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Key code is necessary for handling special keys.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get code: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int code = e.getKeyCode();<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (code == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enter pressed");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getKeyCode()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use <code>keyPressed()</code> for codes, use VK_* constants, handle special keys</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring special keys</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get pressed key code. You can handle special keys.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (379, 'en', 'KeyListener Master: Get Key Code',
        'Add KeyListener, override keyPressed(), get code via getKeyCode(), check VK_ENTER')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (382, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Getting Key Character in KeyListener</h2>
<p class="intro">Key character is important for text input. You can process characters, improve functionality. Without character, you can''t process text input.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getKeyChar()</code> — getting character</li>
  <li>Processing character keys</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Key character is necessary for processing text input.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get character: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyTyped(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;char ch = e.getKeyChar();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Character: " + ch);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getKeyChar()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use <code>keyTyped()</code> for characters, use for text input, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring special characters</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get pressed key character. You can process text input.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (382, 'en', 'KeyListener Master: Get Key Character',
        'Add KeyListener, override keyTyped(), get character via getKeyChar(), output')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (378, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Creating Sequential Group in GroupLayout</h2>
<p class="intro">Sequential group places components sequentially. You can place components one after another, improve layout. Without group, components won''t be placed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>createSequentialGroup()</code> — creating sequential group</li>
  <li>Sequential component placement</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Sequential group is necessary for sequential component placement.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>GroupLayout.SequentialGroup hGroup = layout.createSequentialGroup();</code></li>
  <li>Add components: <code>hGroup.addComponent(component1).addComponent(component2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createSequentialGroup()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use <code>addComponent()</code> for adding, use for sequence, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Mixing with parallel group incorrectly</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed sequentially. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (378, 'en', 'GroupLayout Master: Create Sequential Group',
        'Create sequential group via createSequentialGroup(), add components via addComponent()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (380, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Creating Parallel Group in GroupLayout</h2>
<p class="intro">Parallel group places components in parallel. You can place components next to each other, align, improve layout. Without group, components won''t be placed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>createParallelGroup()</code> — creating parallel group</li>
  <li>Parallel component placement</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Parallel group is necessary for parallel component placement.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create group: <code>GroupLayout.ParallelGroup vGroup = layout.createParallelGroup();</code></li>
  <li>Add components: <code>vGroup.addComponent(component1).addComponent(component2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createParallelGroup()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use <code>addComponent()</code> for adding, use for parallelism, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Mixing with sequential group incorrectly</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed in parallel. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (380, 'en', 'GroupLayout Master: Create Parallel Group',
        'Create parallel group via createParallelGroup(), add components via addComponent()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (381, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Adding Gap in GroupLayout</h2>
<p class="intro">Gap creates distance. You can add distance between components, improve layout. Without gap, components will be tight together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addGap()</code> — adding gap</li>
  <li>Creating distance between components</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gap is necessary for creating distance between components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add gap: <code>hGroup.addGap(10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addGap()</code> for adding</li>
  <li><strong>✅ Great:</strong> Use for creating distance, use for improving layout, improve placement</li>
  <li><strong>⚠️ Avoid:</strong> Too large gaps</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Gap will appear between components. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (381, 'en', 'GroupLayout Master: Add Gap', 'Add gap 10 via addGap() to group')
ON CONFLICT (task_id, language_code) DO NOTHING;
