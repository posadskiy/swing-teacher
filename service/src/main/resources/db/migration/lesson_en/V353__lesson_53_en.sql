-- Flyway migration V3: Lesson 53
-- This migration contains lesson, tasks, and documentation for lesson 53

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (458, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Timer with Timer</h2>
<p class="intro">Timer allows performing actions periodically. Animations, interface updates, state checks — all of this requires timers. Without them, you can''t create dynamic interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>Timer</code> — timer</li>
  <li>Methods <code>start()</code>, <code>stop()</code>, <code>restart()</code></li>
  <li>Creating periodic actions</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Timer is necessary for creating dynamic interface with periodic actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create ActionListener: <code>ActionListener task = new ActionListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void actionPerformed(ActionEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Tick!");<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Create timer: <code>Timer timer = new Timer(1000, task);</code></li>
  <li>Start timer: <code>timer.start();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Specify delay in milliseconds</li>
  <li><strong>✅ Great:</strong> Use <code>setRepeats(false)</code> for one-time execution, use <code>setInitialDelay()</code> for initial delay</li>
  <li><strong>⚠️ Avoid:</strong> Too frequent checking — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Timer will fire every second. Action will be performed periodically. You can create animations, interface updates.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (458, 'en', 'Timer Beginner: Create Timer',
        'Create ActionListener, create Timer with delay 1000 ms, start timer')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (459, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Stopping and Restarting Timer</h2>
<p class="intro">Timer control allows controlling action execution. You can pause animation, stop updates, restart from beginning. Without this, timer will run constantly.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>stop()</code> — stopping timer</li>
  <li>Method <code>restart()</code> — restarting timer</li>
  <li>Managing timer state</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Timer control is necessary for controlling periodic action execution.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Stop timer: <code>timer.stop();</code></li>
  <li>Restart timer: <code>timer.restart();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>stop()</code> for stopping</li>
  <li><strong>✅ Great:</strong> Use <code>restart()</code> for restarting from beginning, check <code>isRunning()</code> before stopping</li>
  <li><strong>⚠️ Avoid:</strong> Stopping already stopped timer — safe, but redundant</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Timer can be stopped and restarted. Action will pause and resume.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (459, 'en', 'Timer Master: Stop and Restart Timer',
        'Stop timer via stop(), then restart via restart()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (462, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Determining Key Code in KeyListener</h2>
<p class="intro">Key code allows processing specific keys. Enter for confirmation, Escape for cancel, arrows for navigation — all of this requires determining code. Without this, you can''t process specific key.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getKeyCode()</code> — key code</li>
  <li>Key code constants (VK_ENTER, VK_SPACE)</li>
  <li>Processing specific keys</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Key code is necessary for processing specific keys.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle press: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getKeyCode() == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enter pressed!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getKeyCode()</code> for checking</li>
  <li><strong>✅ Great:</strong> Use VK_* constants for keys, process function keys, process arrows for navigation</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring code — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can process specific keys. When Enter is pressed, one action will execute, when Escape — another.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (462, 'en', 'KeyListener Master: Determine Key Code',
        'Add KeyListener, check getKeyCode() == VK_ENTER, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (460, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Creating One-Time Timer</h2>
<p class="intro">One-time timer allows performing action with delay. Showing message after 3 seconds, automatic window closing, delayed execution — all of this requires one-time timer. Without this, timer will repeat infinitely.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setRepeats()</code> — setting repetition</li>
  <li>Creating one-time timer</li>
  <li>Using timer for delays</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>One-time timer is necessary for performing actions with delay.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create timer: <code>Timer timer = new Timer(3000, e -> {<br>
&nbsp;&nbsp;label.setText("3 seconds passed!");<br>
});</code></li>
  <li>Disable repetition: <code>timer.setRepeats(false);</code></li>
  <li>Start timer: <code>timer.start();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRepeats(false)</code> for one-time execution</li>
  <li><strong>✅ Great:</strong> Use for delays before actions, stop timer in handler for reliability</li>
  <li><strong>⚠️ Avoid:</strong> Forgetting setRepeats(false) — will repeat</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Timer will execute once and stop. Action will occur after specified time.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (460, 'en', 'Timer Master: Create One-Time Timer',
        'Create Timer with delay 3000 ms, set setRepeats(false), start timer')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (463, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Determining Key Character in KeyListener</h2>
<p class="intro">Key character allows processing text. You can get entered character, process text. Without character, you can''t process text input.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getKeyChar()</code> — getting character</li>
  <li>Distinguishing characters and codes</li>
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
  <li>Handle press: <code>component.addKeyListener(new KeyAdapter() {<br>
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
  <li><strong>✅ Use:</strong> <code>getKeyChar()</code> for getting character</li>
  <li><strong>✅ Great:</strong> Use <code>keyTyped()</code> for text input, process letters and numbers, filter characters</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring character — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get entered character. When typing, you can determine character.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (463, 'en', 'KeyListener Master: Determine Key Character',
        'Add KeyListener, get character via getKeyChar() in keyTyped(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (461, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Setting Initial Delay in Timer</h2>
<p class="intro">Initial delay allows delaying timer start. Showing message after 5 seconds, automatic update after loading, delayed actions — all of this requires initial delay. Without this, timer will start immediately.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setInitialDelay()</code> — setting initial delay</li>
  <li>Difference between initial delay and interval</li>
  <li>Creating timers with delayed start</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Initial delay is necessary for delayed timer start.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create timer: <code>Timer timer = new Timer(1000, e -> {<br>
&nbsp;&nbsp;label.setText("Tick!");<br>
});</code></li>
  <li>Set initial delay: <code>timer.setInitialDelay(5000);</code></li>
  <li>Start timer: <code>timer.start();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setInitialDelay()</code> for delaying start</li>
  <li><strong>✅ Great:</strong> Set different delay and interval, use for delayed actions</li>
  <li><strong>⚠️ Avoid:</strong> Too large delay — user will wait</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Timer will start after specified time. First execution will occur after initial delay, then by interval.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (461, 'en', 'Timer Master: Set Initial Delay',
        'Create Timer with interval 1000 ms, set setInitialDelay(5000), start timer')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (464, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Determining Modifiers in KeyListener</h2>
<p class="intro">Modifiers allow processing combinations. You can determine if Ctrl, Alt, Shift are pressed, process combinations. Without modifiers, you can''t process combinations.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getModifiersEx()</code> — getting modifiers</li>
  <li>Checking Ctrl, Alt, Shift</li>
  <li>Processing key combinations</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Modifiers are necessary for processing key combinations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle press: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if ((e.getModifiersEx() & InputEvent.CTRL_DOWN_MASK) != 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Ctrl pressed!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getModifiersEx()</code> for getting</li>
  <li><strong>✅ Great:</strong> Check CTRL_DOWN_MASK for Ctrl, check ALT_DOWN_MASK for Alt, check SHIFT_DOWN_MASK for Shift</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring modifiers</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can determine modifiers. When pressing, you can know if Ctrl, Alt, Shift are pressed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (464, 'en', 'KeyListener Master: Determine Modifiers',
        'Add KeyListener, check getModifiersEx() & CTRL_DOWN_MASK, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (465, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Determining Key Location in KeyListener</h2>
<p class="intro">Key location allows distinguishing positions. You can determine if left or right key is pressed, process accordingly. Without checking, you can''t distinguish positions.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getKeyLocation()</code> — getting location</li>
  <li>Distinguishing left and right key</li>
  <li>Processing different locations</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Key location is necessary for distinguishing key positions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle press: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getKeyLocation() == KeyEvent.KEY_LOCATION_LEFT) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Left key!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getKeyLocation()</code> for checking</li>
  <li><strong>✅ Great:</strong> Check KEY_LOCATION_LEFT for left, check KEY_LOCATION_RIGHT for right, check KEY_LOCATION_STANDARD for standard</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring location</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can determine key location. When pressing, you can know if left or right key.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (465, 'en', 'KeyListener Master: Determine Key Location',
        'Add KeyListener, check getKeyLocation() == KEY_LOCATION_LEFT, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
