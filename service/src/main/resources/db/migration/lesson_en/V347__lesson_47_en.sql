-- Flyway migration V3: Lesson 47
-- This migration contains lesson, tasks, and documentation for lesson 47

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (421, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Responding to Key Presses with KeyListener</h2>
<p class="intro">KeyListener allows responding to keyboard. Hotkeys, text input, navigation — all of this requires keyboard handling. Without it, interface won''t be interactive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>KeyListener</code> — keyboard handling</li>
  <li>Methods <code>keyPressed()</code>, <code>keyReleased()</code>, <code>keyTyped()</code></li>
  <li>Handling key presses</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>KeyListener is necessary for creating interactive interface with keyboard handling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create listener: <code>KeyListener listener = new KeyListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getKeyCode() == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enter pressed!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyReleased(KeyEvent e) {}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyTyped(KeyEvent e) {}<br>
};</code></li>
  <li>Add listener to component: <code>component.addKeyListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getKeyCode()</code> for physical keys</li>
  <li><strong>✅ Great:</strong> Use <code>getKeyChar()</code> for characters, check modifiers: <code>isShiftDown()</code>, <code>isControlDown()</code></li>
  <li><strong>⚠️ Avoid:</strong> Handling all keys — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When pressing keys, handler will fire. You can handle any keys and combinations.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (421, 'en', 'KeyListener Beginner: Respond to Key Presses',
        'Create KeyListener, handle Enter press and add listener to component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (422, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Handling Key Combinations with KeyListener</h2>
<p class="intro">Handling key combinations makes interface fast. Hotkeys, quick actions, combinations — all of this requires modifier handling. Without this, you can''t create convenient hotkeys.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>isControlDown()</code>, <code>isShiftDown()</code>, <code>isAltDown()</code></li>
  <li>Handling key combinations</li>
  <li>Creating hotkeys</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling key combinations is necessary for creating convenient hotkeys.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Check modifiers: <code>if (e.isControlDown() && e.getKeyCode() == KeyEvent.VK_C) {<br>
&nbsp;&nbsp;label.setText("Ctrl+C pressed!");<br>
}</code></li>
  <li>Or check Shift: <code>if (e.isShiftDown() && e.getKeyCode() == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;label.setText("Shift+Enter pressed!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check modifiers before checking key</li>
  <li><strong>✅ Great:</strong> Use <code>isControlDown()</code> for Ctrl, use <code>isShiftDown()</code> for Shift, use <code>isAltDown()</code> for Alt</li>
  <li><strong>⚠️ Avoid:</strong> Handling all combinations — may be complex</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Key combinations will be handled. You can create hotkeys Ctrl+C, Shift+Enter and others.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (422, 'en', 'KeyListener Master: Handle Key Combinations',
        'In keyPressed check isControlDown() and VK_C, output message when pressing Ctrl+C')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (424, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Adding Glue in BoxLayout</h2>
<p class="intro">Glue creates stretchable space. You can separate components, push them to edges, create flexible layouts. Without glue, components will be pressed together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createHorizontalGlue()</code> — horizontal glue</li>
  <li>Method <code>Box.createVerticalGlue()</code> — vertical glue</li>
  <li>Creating stretchable space</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Glue is necessary for creating flexible layouts with component separation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create glue: <code>Component glue = Box.createHorizontalGlue();</code></li>
  <li>Add components and glue: <code>add(button1);<br>
add(glue);<br>
add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createHorizontalGlue()</code> for horizontal</li>
  <li><strong>✅ Great:</strong> Use <code>createVerticalGlue()</code> for vertical, separate components with glue, push components to edges</li>
  <li><strong>⚠️ Avoid:</strong> Too much glue — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Stretchable space will appear between components. Glue will take available space. Components will be separated.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (424, 'en', 'BoxLayout Master: Add Glue',
        'Create horizontal glue via createHorizontalGlue(), add components and glue')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (423, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Key Release with KeyListener</h2>
<p class="intro">Handling key release allows tracking state. Games, animations, hotkeys — all of this requires release handling. Without this, you can''t determine when action should stop.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>keyReleased()</code> — handling release</li>
  <li>Tracking key state</li>
  <li>Handling key release</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling key release is necessary for tracking state and managing actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Override keyReleased: <code>@Override<br>
public void keyReleased(KeyEvent e) {<br>
&nbsp;&nbsp;if (e.getKeyCode() == KeyEvent.VK_SPACE) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Space released!");<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>keyReleased()</code> for handling release</li>
  <li><strong>✅ Great:</strong> Stop actions on release, use for state management</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring keyReleased — action won''t stop</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When releasing key, handler will fire. You can stop action, change state.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (423, 'en', 'KeyListener Master: Handle Key Release',
        'Override keyReleased(), handle VK_SPACE release, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (425, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Rigid Area in BoxLayout</h2>
<p class="intro">Rigid area creates fixed space. You can separate components with fixed gap. Without rigid area, gap will change.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createRigidArea()</code> — rigid area</li>
  <li>Creating fixed space</li>
  <li>Separating components</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Rigid area is necessary for creating fixed gaps between components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create area: <code>Component area = Box.createRigidArea(new Dimension(10, 10));</code></li>
  <li>Add components and area: <code>add(button1);<br>
add(area);<br>
add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createRigidArea()</code> for rigid area</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, separate components with area, use for fixed gaps</li>
  <li><strong>⚠️ Avoid:</strong> Too large area — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Fixed space will appear between components. Gap will be constant.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (425, 'en', 'BoxLayout Master: Add Rigid Area',
        'Create rigid area via createRigidArea() with size 10x10, add between components')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (426, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Adding Strut in BoxLayout</h2>
<p class="intro">Strut creates fixed space. You can separate components with fixed gap. Without strut, gap will change.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createHorizontalStrut()</code> — horizontal strut</li>
  <li>Method <code>Box.createVerticalStrut()</code> — vertical strut</li>
  <li>Creating fixed space</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Strut is necessary for creating fixed gaps between components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create strut: <code>Component strut = Box.createHorizontalStrut(20);</code></li>
  <li>Add components and strut: <code>add(button1);<br>
add(strut);<br>
add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createHorizontalStrut()</code> for horizontal</li>
  <li><strong>✅ Great:</strong> Use <code>createVerticalStrut()</code> for vertical, separate components with strut, use for fixed gaps</li>
  <li><strong>⚠️ Avoid:</strong> Too large strut — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Fixed space will appear between components. Gap will be constant.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (426, 'en', 'BoxLayout Master: Add Strut',
        'Create horizontal strut via createHorizontalStrut(20), add between components')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (427, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Setting Maximum Size in BoxLayout</h2>
<p class="intro">Maximum size limits component. You can specify maximum size, prevent excessive stretching. Without limit, component may stretch too much.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMaximumSize()</code> — setting maximum size</li>
  <li>Limiting component size</li>
  <li>Creating controlled layouts</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Maximum size is necessary for preventing excessive component stretching.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set maximum size: <code>component.setMaximumSize(new Dimension(200, 100));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMaximumSize()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, use for limiting, adapt to content</li>
  <li><strong>⚠️ Avoid:</strong> Too small size — may be inconvenient</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will be limited by maximum size. Component won''t stretch more than specified.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (427, 'en', 'BoxLayout Master: Set Maximum Size',
        'Set maximum size 200x100 via setMaximumSize()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (428, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Setting Gaps in BorderLayout</h2>
<p class="intro">Gaps improve visual appearance. You can add distance between components, improve readability. Without gaps, components will be tight.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Constructor <code>BorderLayout(int, int)</code> — gaps</li>
  <li>Horizontal and vertical gaps</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gaps are necessary for improving visual appearance and readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create layout with gaps: <code>BorderLayout layout = new BorderLayout(10, 10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>BorderLayout(int, int)</code> for gaps</li>
  <li><strong>✅ Great:</strong> Use reasonable values, improve visual appearance, improve readability</li>
  <li><strong>⚠️ Avoid:</strong> Too large gaps</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Gaps will be between components. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (428, 'en', 'BorderLayout Master: Set Gaps',
        'Create BorderLayout with gaps 10, 10 via constructor BorderLayout(10, 10)')
ON CONFLICT (task_id, language_code) DO NOTHING;
