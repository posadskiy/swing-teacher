-- Flyway migration V3: Lesson 18
-- This migration contains lesson, tasks, and documentation for lesson 18

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (153, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Dialog Window</h2>
<p class="intro">Dialogs show important information. Delete confirmation, data input, error messages — all of this are dialogs. They attract attention and require user response.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JDialog</code> class — dialog window</li>
  <li>Creating dialog</li>
  <li>Modal and non-modal dialogs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Dialogs are necessary for showing important information and requesting data from user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create dialog: <code>JDialog dialog = new JDialog(frame, "Dialog", true);</code></li>
  <li>Set size: <code>dialog.setSize(400, 300);</code></li>
  <li>Make visible: <code>dialog.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Specify parent window and modality</li>
  <li><strong>✅ Excellent:</strong> Modal dialog (true) — blocks parent window, non-modal (false) — can work with parent window</li>
</ul>
<p><strong>Important:</strong> Constructor: <code>new JDialog(parent, title, modal)</code>. Modal (true) — blocks parent window until closed. Non-modal (false) — can work with both windows. For important actions use modal dialog. You can set close operation: <code>setDefaultCloseOperation(DISPOSE_ON_CLOSE);</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog window will appear. This is a window on top of main window. If modal — cannot work with main window until dialog is closed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (153, 'en', 'Beginner Dialog: create popup window',
        'Create modal dialog with title "Dialog", size 400x300 and make it visible')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (154, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Scrollbar</h2>
<p class="intro">JScrollBar allows scrolling content. Large lists, long texts, large images — all of this requires scrolling. Without this, content won''t fit on screen.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JScrollBar</code> class — scrollbar</li>
  <li>Creating horizontal and vertical scrollbar</li>
  <li>Adding scrollbar to the form</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Scrollbar is necessary for scrolling content that doesn''t fit on screen.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create scrollbar: <code>JScrollBar scrollBar = new JScrollBar(JScrollBar.VERTICAL, 0, 10, 0, 100);</code></li>
  <li>Add to the form: <code>add(scrollBar);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> VERTICAL for vertical, HORIZONTAL for horizontal</li>
  <li><strong>✅ Excellent:</strong> Specify orientation, value, extent, min, max, use JScrollPane instead of JScrollBar for automatic scrolling</li>
  <li><strong>⚠️ Avoid:</strong> Using JScrollBar directly — usually JScrollPane is better</li>
</ul>
<p><strong>Important:</strong> Usually JScrollPane is used for automatic scrolling. JScrollBar for manual scroll control.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar with thumb will appear. You can drag thumb for scrolling.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (154, 'en', 'Beginner Scrollbar: create scrollbar',
        'Create vertical JScrollBar with value 0, extent 10, min 0, max 100, add to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (155, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Scrollbar Value Change</h2>
<p class="intro">Handling changes makes scrollbar interactive. You can update content, synchronize with other components, perform actions. Without this, scrollbar will be only for display.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>AdjustmentListener</code> interface — handling changes</li>
  <li>Handling scrollbar scrolling</li>
  <li>Reacting to value change</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling changes allows synchronizing interface and reacting to scrolling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>scrollBar.addAdjustmentListener(e -> {<br>
&nbsp;&nbsp;int value = e.getValue();<br>
&nbsp;&nbsp;label.setText("Value: " + value);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addAdjustmentListener()</code> for handling</li>
  <li><strong>✅ Excellent:</strong> Get value via <code>getValue()</code>, update other components on change, check <code>getValueIsAdjusting()</code> for final value</li>
  <li><strong>⚠️ Avoid:</strong> Processing every intermediate value — may be slow</li>
</ul>
<p><strong>Important:</strong> <code>getValueIsAdjusting()</code> — check if thumb is being dragged. <code>getMinimum()</code>, <code>getMaximum()</code> — get range. <code>setValue(int)</code> — set value programmatically.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When scrollbar changes, handler will fire. You can get new value and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (155, 'en', 'Scrollbar Master: handle value change',
        'Add AdjustmentListener, get value via getValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (156, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Scrollbar Scroll Step</h2>
<p class="intro">Scroll step defines speed. You can set how much to scroll when clicking arrows or dragging. Without setting, step will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setUnitIncrement()</code> method — unit step</li>
  <li>The <code>setBlockIncrement()</code> method — block step</li>
  <li>Configuring scroll speed</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting scroll step allows controlling speed and precision of content scrolling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set unit step: <code>scrollBar.setUnitIncrement(10);</code></li>
  <li>Set block step: <code>scrollBar.setBlockIncrement(50);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setUnitIncrement()</code> for unit, <code>setBlockIncrement()</code> for block</li>
  <li><strong>✅ Excellent:</strong> Use reasonable values, adapt to content</li>
  <li><strong>⚠️ Avoid:</strong> Too large step — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Unit — click on arrows. Block — click on track. Adapt to content.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrolling will be with specified step. When clicking arrows, scrolling will be by specified value.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (156, 'en', 'Scrollbar Master: configure scroll step',
        'Set unit step 10 via setUnitIncrement(), block step 50 via setBlockIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (157, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Changing Scrollbar Scroll Step</h2>
<p class="intro">Changing step adapts scrolling. You can change step depending on content, improve navigation. Without changing, step will be constant.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Dynamic step change</li>
  <li>Adaptation to content</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Dynamic step change allows adapting scrolling to various content types.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Change unit step: <code>scrollBar.setUnitIncrement(20);</code></li>
  <li>Change block step: <code>scrollBar.setBlockIncrement(100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setUnitIncrement()</code> to change</li>
  <li><strong>✅ Excellent:</strong> Adapt to content, change dynamically, use reasonable values</li>
  <li><strong>⚠️ Avoid:</strong> Too large step — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Improve navigation by adapting step to content.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scroll step will change. Scrolling will be with new step.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (157, 'en', 'Scrollbar Master: change scroll step',
        'Change unit step to 20 via setUnitIncrement(), block step to 100 via setBlockIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (158, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Scrollbar Orientation</h2>
<p class="intro">Orientation defines direction. You can create horizontal or vertical scrollbar, adapt to content. Without setting, orientation will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setOrientation()</code> method — setting orientation</li>
  <li>Orientation constants (HORIZONTAL, VERTICAL)</li>
  <li>Creating horizontal or vertical scrollbar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Choosing orientation allows adapting scrollbar for various content scrolling directions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set orientation: <code>scrollBar.setOrientation(JScrollBar.HORIZONTAL);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setOrientation()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use HORIZONTAL for horizontal, VERTICAL for vertical, adapt to content</li>
  <li><strong>⚠️ Avoid:</strong> Wrong orientation — may be inconvenient</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar orientation will be configured. You can create horizontal or vertical scrollbar.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (158, 'en', 'Scrollbar Master: configure orientation', 'Set orientation HORIZONTAL via setOrientation()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (159, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Scrollbar Block Increment</h2>
<p class="intro">Block increment speeds up scrolling. When clicking on track, scrolling will be by large distance, improve navigation. Without block increment, scrolling will be slow.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBlockIncrement()</code> method — setting block increment</li>
  <li>Scrolling by large distances</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Block increment allows speeding up scrolling and improving navigation through large content.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set block increment: <code>scrollBar.setBlockIncrement(100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBlockIncrement()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use large values for fast scrolling, combine with <code>setUnitIncrement()</code>, use to improve UX</li>
  <li><strong>⚠️ Avoid:</strong> Too large values</li>
</ul>
<p><strong>Important:</strong> Combine with unit increment. Make values reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking on track, scrolling will be by large distance. You can quickly move through content.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (159, 'en', 'Scrollbar Master: set block increment', 'Set block increment 100 via setBlockIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (160, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Scrollbar Unit Increment</h2>
<p class="intro">Unit increment defines scroll step. When clicking on arrows, scrolling will be by specified distance, improve navigation. Without increment, scrolling will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setUnitIncrement()</code> method — setting unit increment</li>
  <li>Scrolling by small distances</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Unit increment allows configuring scroll precision when using scrollbar arrows.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set increment: <code>scrollBar.setUnitIncrement(10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setUnitIncrement()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use reasonable values, combine with <code>setBlockIncrement()</code>, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Too large or small values</li>
</ul>
<p><strong>Important:</strong> Use for precise scrolling. Combine with block increment. Make values reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking on arrows, scrolling will be by specified distance. You can precisely move through content.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (160, 'en', 'Scrollbar Master: set unit increment',
        'Set unit increment 10 via setUnitIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (161, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Setting Scrollbar Value</h2>
<p class="intro">Value defines position. You can set initial position, change it, improve navigation. Without setting, position will be zero.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setValue()</code> method — setting value</li>
  <li>The <code>getValue()</code> method — getting value</li>
  <li>Managing scroll position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing value allows programmatically controlling scroll position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set value: <code>scrollBar.setValue(100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setValue()</code> to set, <code>getValue()</code> to get</li>
  <li><strong>✅ Excellent:</strong> Use for managing position, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Setting value outside range</li>
</ul>
<p><strong>Important:</strong> Check boundaries before setting value.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar position will be set. You can manage scroll position.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (161, 'en', 'Scrollbar Master: set value', 'Set value 100 via setValue()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (162, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Scrollbar Block Increment (Extended)</h2>
<p class="intro">Block increment defines block size. You can set how much to scroll when clicking on track, improve navigation. Without setting, size will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBlockIncrement()</code> method — setting block increment</li>
  <li>Managing scroll block size</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Block increment allows configuring fast scrolling when clicking on scrollbar area.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set block increment: <code>scrollBar.setBlockIncrement(50);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBlockIncrement()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use reasonable values, use to improve navigation, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Too small or large increment</li>
</ul>
<p><strong>Important:</strong> Make increment comfortable for user.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking on track, scrolling will be by block increment. You can improve navigation.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (162, 'en', 'Scrollbar Master: set block increment', 'Set block increment 50 via setBlockIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
