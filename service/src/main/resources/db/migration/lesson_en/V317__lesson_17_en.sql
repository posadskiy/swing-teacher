-- Flyway migration V3: Lesson 17
-- This migration contains lesson, tasks, and documentation for lesson 17

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (141, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Main Window</h2>
<p class="intro">JFrame is the foundation of application. All components are placed in window. Without window there is no interface. Window defines size, title and application behavior.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JFrame</code> class — main application window</li>
  <li>Creating window</li>
  <li>Configuring window (size, title, visibility)</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>JFrame is the foundation of any Swing application and container for all interface components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create window: <code>JFrame frame = new JFrame("My Application");</code></li>
  <li>Set size: <code>frame.setSize(800, 600);</code></li>
  <li>Make visible: <code>frame.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Set title in constructor</li>
  <li><strong>✅ Excellent:</strong> Set size before showing, set close operation: <code>setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);</code></li>
  <li><strong>⚠️ Important:</strong> Don''t forget <code>setVisible(true)</code> — window won''t appear!</li>
</ul>
<p><strong>Important:</strong> Title: <code>new JFrame("Title")</code> or <code>frame.setTitle("Title")</code>. Centering: <code>frame.setLocationRelativeTo(null);</code>. Closing: <code>frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Application window will appear. This is a rectangular window with title, frame and control buttons. You can add components to it.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (141, 'en', 'Beginner Window: create main application window',
        'Create window with title "My Application", size 800x600 and make it visible')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (142, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Progress Bar</h2>
<p class="intro">JProgressBar shows execution progress. File loading, data processing, task execution — all of this requires progress display. Without this, user won''t know how much is left.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JProgressBar</code> class — progress bar</li>
  <li>Creating progress bar with range</li>
  <li>Displaying progress</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Progress bar informs user about task execution progress and improves user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create progress bar: <code>JProgressBar progressBar = new JProgressBar(0, 100);</code></li>
  <li>Set value: <code>progressBar.setValue(50);</code></li>
  <li>Add to the form: <code>add(progressBar);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Specify min and max in constructor</li>
  <li><strong>✅ Excellent:</strong> Use <code>setStringPainted(true)</code> to show percentage, use <code>setIndeterminate(true)</code> for indeterminate mode, update value via <code>setValue()</code></li>
  <li><strong>⚠️ Avoid:</strong> Not updating value — progress won''t be visible</li>
</ul>
<p><strong>Important:</strong> <code>getValue()</code> — get value. <code>setStringPainted(boolean)</code> — show/hide text. <code>setIndeterminate(boolean)</code> — indeterminate mode.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar with filling will appear. Bar will be filled proportionally to value. You can show percentage.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (142, 'en', 'Beginner Progress Bar: create progress bar',
        'Create JProgressBar with range 0-100, set value 50, add to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (143, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Window Close Operation</h2>
<p class="intro">Close operation defines application fate. Without proper setting, window may close but application will continue running. Or vice versa — application will close when you only need to hide window.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setDefaultCloseOperation(int operation)</code> method — setting close operation</li>
  <li>Constants: <code>EXIT_ON_CLOSE</code>, <code>HIDE_ON_CLOSE</code>, <code>DISPOSE_ON_CLOSE</code></li>
  <li>Managing window close behavior</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Close operation defines application behavior when closing window and prevents unwanted effects.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create window: <code>JFrame frame = new JFrame("Application");</code></li>
  <li>Set close operation: <code>frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);</code></li>
  <li>Make visible: <code>frame.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>EXIT_ON_CLOSE</code> for main window — closes application</li>
  <li><strong>✅ Excellent:</strong> <code>HIDE_ON_CLOSE</code> for child windows — hides, doesn''t close, <code>DISPOSE_ON_CLOSE</code> — releases resources</li>
  <li><strong>⚠️ Important:</strong> Without setting, <code>HIDE_ON_CLOSE</code> is used — application won''t close!</li>
</ul>
<p><strong>Important:</strong> <code>DO_NOTHING_ON_CLOSE</code> — does nothing (needs custom handler). For main window usually <code>EXIT_ON_CLOSE</code> is used.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When closing window, specified action will occur. If you chose <code>EXIT_ON_CLOSE</code>, application will fully close. If <code>HIDE_ON_CLOSE</code> — window will hide, but application will continue running.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (143, 'en', 'Close Operation: configure behavior on close',
        'Create window, set close operation EXIT_ON_CLOSE and make it visible')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (144, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Showing Percentage in Progress Bar</h2>
<p class="intro">Showing percentage makes progress clear. User sees exact value, not just bar. Without this, it''s hard to understand how much is left.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setStringPainted()</code> method — showing text</li>
  <li>The <code>setString()</code> method — setting text</li>
  <li>Displaying percentage in progress bar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Showing percentage increases progress bar informativeness and improves user understanding of progress.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable text display: <code>progressBar.setStringPainted(true);</code></li>
  <li>Set text (optional): <code>progressBar.setString("50%");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setStringPainted(true)</code> to show</li>
  <li><strong>✅ Excellent:</strong> Use <code>setString()</code> for custom text, automatically calculate percentage, show additional information</li>
  <li><strong>⚠️ Avoid:</strong> Too long text — may not fit</li>
</ul>
<p><strong>Important:</strong> Without <code>setString()</code>, percentage is shown automatically. Short text is better.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text with percentage will appear in progress bar. You can show exact value or custom text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (144, 'en', 'Progress Bar Master: show percentage',
        'Enable text display via setStringPainted(true), set text "50%" via setString()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (145, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Indeterminate Progress Bar Mode</h2>
<p class="intro">Indeterminate mode shows that process is running. When exact execution time is unknown, you can show animation. Without this, user won''t know that process is working.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIndeterminate()</code> method — indeterminate mode</li>
  <li>Creating animated progress bar</li>
  <li>Displaying process without exact progress</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Indeterminate mode is necessary for processes with unknown execution time to show user that process is active.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable indeterminate mode: <code>progressBar.setIndeterminate(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIndeterminate(true)</code> for animation</li>
  <li><strong>✅ Excellent:</strong> Switch to determinate mode when progress is known, use for long operations</li>
  <li><strong>⚠️ Avoid:</strong> Using always — user won''t see progress</li>
</ul>
<p><strong>Important:</strong> true — animated bar. false — normal mode with percentage. Use when progress is unknown. Switch to determinate when progress is known.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will become animated. Bar will move, showing that process is running.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (145, 'en', 'Progress Bar Master: enable indeterminate mode',
        'Enable indeterminate mode via setIndeterminate(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (146, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Progress Bar String</h2>
<p class="intro">String shows progress information. You can show percentage, text, status. Without string, user won''t see exact progress.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setStringPainted()</code> method — showing string</li>
  <li>The <code>setString()</code> method — setting string</li>
  <li>Displaying text on progress bar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>String increases progress bar informativeness, showing exact progress value.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable string display: <code>progressBar.setStringPainted(true);</code></li>
  <li>Or set custom string: <code>progressBar.setString("Loading...");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setStringPainted(true)</code> to show</li>
  <li><strong>✅ Excellent:</strong> Use <code>setString()</code> for custom string, show percentage automatically, show status</li>
  <li><strong>⚠️ Avoid:</strong> Too long string — may be unreadable</li>
</ul>
<p><strong>Important:</strong> <code>getString()</code> — get string. Automatically shows percentage. Use for informativeness.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>String will appear on progress bar. You can show percentage or custom text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (146, 'en', 'Progress Bar Master: show string',
        'Enable string display via setStringPainted(true), set string "Loading..." via setString()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (147, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Progress Bar Border</h2>
<p class="intro">Border improves appearance. You can show frame around progress bar, improve visual design. Without border, progress bar will be frameless.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBorderPainted()</code> method — showing border</li>
  <li>Creating visually designed progress bar</li>
  <li>Improving appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Border improves progress bar visual design and makes it more noticeable.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable border display: <code>progressBar.setBorderPainted(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBorderPainted(true)</code> to show</li>
  <li><strong>✅ Excellent:</strong> Use for visual design, combine with other settings</li>
  <li><strong>⚠️ Avoid:</strong> Always showing border — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have border. Progress bar will be with frame.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (147, 'en', 'Progress Bar Master: show border', 'Enable border display via setBorderPainted(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (148, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Indeterminate Progress Bar</h2>
<p class="intro">Indeterminate progress bar shows process. You can show animation when progress is unknown, improve visual feedback. Without indeterminacy, you cannot show process.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIndeterminate()</code> method — setting indeterminacy</li>
  <li>Creating animated progress bar</li>
  <li>Improving visual feedback</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Indeterminate mode is necessary for processes with unknown execution time to show user that process is active.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Make indeterminate: <code>progressBar.setIndeterminate(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIndeterminate(true)</code> for indeterminacy</li>
  <li><strong>✅ Excellent:</strong> Use for unknown progress, switch to determinate when progress is known, improve visual feedback</li>
  <li><strong>⚠️ Avoid:</strong> Always indeterminate — may be uninformative</li>
</ul>
<p><strong>Important:</strong> true — indeterminate (animation). false — determinate (value). Switch when progress is known.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will become indeterminate. Animation will be shown.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (148, 'en', 'Progress Bar Master: make indeterminate',
        'Make progress bar indeterminate via setIndeterminate(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (149, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Custom Progress Bar String</h2>
<p class="intro">Custom string improves informativeness. You can show custom text instead of percentage, improve understanding. Without string, there will be only percentage.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setString()</code> method — setting string</li>
  <li>The <code>setStringPainted()</code> method — showing string</li>
  <li>Creating custom text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Custom string increases progress bar informativeness and allows showing more understandable text to user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable string display: <code>progressBar.setStringPainted(true);</code></li>
  <li>Set string: <code>progressBar.setString("Loading...");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setString()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use <code>setStringPainted(true)</code> to show, use dynamic strings, use for informativeness</li>
  <li><strong>⚠️ Avoid:</strong> Too long strings</li>
</ul>
<p><strong>Important:</strong> Make strings short for better readability.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have custom string. You can show "Loading...", "Processing..." etc.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (149, 'en', 'Progress Bar Master: set custom string',
        'Enable string display via setStringPainted(true), set string "Loading..." via setString()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (150, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Progress Bar String Format</h2>
<p class="intro">String format improves informativeness. You can show custom text, improve understanding. Without format, there will be only percentage.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setStringPainted()</code> method — showing string</li>
  <li>Custom string formatting</li>
  <li>Improving informativeness</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Custom formatting allows displaying string in needed format and improving informativeness.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable string display: <code>progressBar.setStringPainted(true);</code></li>
  <li>Set format: <code>progressBar.setString(String.format("%d%%", progressBar.getValue()));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setStringPainted(true)</code> to show</li>
  <li><strong>✅ Excellent:</strong> Use <code>String.format()</code> for formatting, use dynamic strings, improve informativeness</li>
  <li><strong>⚠️ Avoid:</strong> Too long strings</li>
</ul>
<p><strong>Important:</strong> Make strings short for better readability.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have custom format. You can show formatted text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (150, 'en', 'Progress Bar Master: set string format',
        'Enable string display via setStringPainted(true), set format via String.format("%d%%", getValue())')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (151, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Setting Progress Bar Value</h2>
<p class="intro">Value defines progress. You can set current progress, update it, improve visualization. Without setting, progress will be zero.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setValue()</code> method — setting value</li>
  <li>The <code>getValue()</code> method — getting value</li>
  <li>Managing progress</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing value allows programmatically controlling progress and updating it in real time.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set value: <code>progressBar.setValue(50);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setValue()</code> to set, <code>getValue()</code> to get</li>
  <li><strong>✅ Excellent:</strong> Use for updating progress, improve visualization</li>
  <li><strong>⚠️ Avoid:</strong> Setting value outside range</li>
</ul>
<p><strong>Important:</strong> Check boundaries before setting value.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will update with new value. You can visualize progress.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (151, 'en', 'Progress Bar Master: set value', 'Set value 50 via setValue()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (152, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Indeterminate Progress Bar Mode (Extended)</h2>
<p class="intro">Indeterminate mode shows animation. You can show animated progress when exact progress is unknown, improve visual effect. Without indeterminacy, progress will be static.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIndeterminate()</code> method — setting indeterminacy</li>
  <li>Animated progress bar</li>
  <li>Improving visual effect</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Indeterminate mode is necessary for processes with unknown execution time to show user that process is active.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable indeterminacy: <code>progressBar.setIndeterminate(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIndeterminate(true)</code> to enable</li>
  <li><strong>✅ Excellent:</strong> Use for animation, use when progress is unknown, improve visual effect</li>
  <li><strong>⚠️ Avoid:</strong> Using when progress is known</li>
</ul>
<p><strong>Important:</strong> true — indeterminate (animation). false — determinate. Use for animation and improving visual effect.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will be animated. You can show indeterminate progress.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (152, 'en', 'Progress Bar Master: make indeterminate', 'Enable indeterminacy via setIndeterminate(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
