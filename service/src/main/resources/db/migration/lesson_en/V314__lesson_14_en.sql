-- Flyway migration V3: Lesson 14
-- This migration contains lesson, tasks, and documentation for lesson 14

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (108, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Progress Bar</h2>
<p class="intro">Progress bars (<code>JProgressBar</code>) show progress. File downloads, program installation, data processing — all of this requires showing progress. Without it, user doesn''t know how much is left.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JProgressBar</code> class — progress indicator</li>
  <li>Creating a progress bar</li>
  <li>Displaying progress</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Progress bar informs user about task progress and improves user experience.</p>
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
  <li><strong>✅ Good:</strong> Specify minimum and maximum value</li>
  <li><strong>✅ Excellent:</strong> Use <code>setValue()</code> to set progress, use <code>setStringPainted(true)</code> to show percentage</li>
  <li><strong>⚠️ Avoid:</strong> Not updating value — user won''t see progress</li>
</ul>
<p><strong>Important:</strong> <code>getValue()</code> — get current value. <code>setIndeterminate(true)</code> — indeterminate mode (animation).</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A progress bar will appear. This is a bar showing progress from 0 to 100. You can see how much is done.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (108, 'en', 'Beginner Progress Bar: create a progress indicator',
        'Create a progress bar with range 0-100, set value 50 and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (109, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Progress Bar Range</h2>
<p class="intro">Range defines progress boundaries. You can set any range: 0-100 for percentages, 0-1000 for count, 0-files for download. Without range, progress won''t make sense.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMinimum(int)</code> method — setting minimum</li>
  <li>The <code>setMaximum(int)</code> method — setting maximum</li>
  <li>Managing progress range</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Range defines progress boundaries and allows adapting progress bar for various tasks.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set minimum: <code>progressBar.setMinimum(0);</code></li>
  <li>Set maximum: <code>progressBar.setMaximum(100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMinimum()</code> and <code>setMaximum()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use JProgressBar(min, max) constructor, use reasonable values, use for different tasks</li>
  <li><strong>⚠️ Avoid:</strong> Setting minimum greater than maximum</li>
</ul>
<p><strong>Important:</strong> <code>getMinimum()</code> — get minimum. <code>getMaximum()</code> — get maximum.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have set range. Value will be limited by this range.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (109, 'en', 'Progress Bar Master: set minimum and maximum value',
        'Create a progress bar, set minimum 0 and maximum 100 via setMinimum() and setMaximum()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (110, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Progress Bar Current Value</h2>
<p class="intro">Current value shows progress. You can update value as task progresses, show real progress. Without updating, progress bar will be static.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setValue(int)</code> method — setting value</li>
  <li>The <code>getValue()</code> method — getting value</li>
  <li>Managing progress</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Updating value allows showing real task progress.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set value: <code>progressBar.setValue(75);</code></li>
  <li>Get value: <code>int value = progressBar.getValue();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setValue()</code> for setting, <code>getValue()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Update value as task progresses, use in loops to show progress</li>
  <li><strong>⚠️ Avoid:</strong> Setting value outside range</li>
</ul>
<p><strong>Important:</strong> Value must be in range [minimum, maximum]. Use to show progress.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will update with new value. Bar will fill to specified percentage. You can see real progress.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (110, 'en', 'Progress Bar Master: set current value',
        'Create a progress bar, set value 75 via setValue()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (111, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Progress Bar Orientation</h2>
<p class="intro">Orientation affects progress bar appearance. Horizontal — for wide areas, vertical — for narrow. You can choose suitable orientation for interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setOrientation(int)</code> method — setting orientation</li>
  <li>Constants <code>HORIZONTAL</code> and <code>VERTICAL</code></li>
  <li>Horizontal and vertical progress bar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Choosing orientation allows adapting progress bar for various interface layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set orientation: <code>progressBar.setOrientation(JProgressBar.HORIZONTAL);</code></li>
  <li>Or vertical: <code>progressBar.setOrientation(JProgressBar.VERTICAL);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> HORIZONTAL for horizontal, VERTICAL for vertical</li>
  <li><strong>✅ Excellent:</strong> Choose orientation depending on space, use to save space</li>
  <li><strong>⚠️ Avoid:</strong> Using vertical without necessity</li>
</ul>
<p><strong>Important:</strong> HORIZONTAL — horizontal (default). Choose depending on space.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have set orientation. Horizontal — left to right, vertical — bottom to top.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (111, 'en', 'Progress Bar Master: set orientation',
        'Create a progress bar, set vertical orientation via setOrientation(JProgressBar.VERTICAL)')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (112, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Progress Bar String</h2>
<p class="intro">String shows exact progress. You can show percentage, count, status. Without string, user sees only bar, not knowing exact value.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setStringPainted(boolean)</code> method — showing string</li>
  <li>The <code>setString(String)</code> method — setting string</li>
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
  <li>(Optional) Set custom string: <code>progressBar.setString("50%");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setStringPainted(true)</code> for showing</li>
  <li><strong>✅ Excellent:</strong> Use <code>setString()</code> for custom string, show percentage automatically, show task status</li>
  <li><strong>⚠️ Avoid:</strong> Hiding string without necessity</li>
</ul>
<p><strong>Important:</strong> <code>getString()</code> — get current string. By default, percentage is shown. Use for informativeness.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will appear on progress bar. This is percentage or custom string. You can see exact progress.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (112, 'en', 'Progress Bar Master: show string with percentage',
        'Create a progress bar, enable string display via setStringPainted(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (113, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Progress Bar Colors</h2>
<p class="intro">Colors improve visual appearance. You can set fill color, background color, make progress bar noticeable. Without setting, colors will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setForeground(Color)</code> method — fill color</li>
  <li>The <code>setBackground(Color)</code> method — background color</li>
  <li>Customizing appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting colors allows improving visual appearance and making progress bar more noticeable.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set fill color: <code>progressBar.setForeground(Color.GREEN);</code></li>
  <li>Set background color: <code>progressBar.setBackground(Color.LIGHT_GRAY);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setForeground()</code> for fill, <code>setBackground()</code> for background</li>
  <li><strong>✅ Excellent:</strong> Use Color constants, use <code>new Color()</code> for custom colors</li>
  <li><strong>⚠️ Avoid:</strong> Using too bright colors</li>
</ul>
<p><strong>Important:</strong> Color.GREEN, Color.BLUE, Color.RED — standard colors. <code>new Color(r, g, b)</code> — custom color.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have set colors. Fill will be one color, background — another. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (113, 'en', 'Progress Bar Master: set colors',
        'Create a progress bar, set fill color Color.GREEN via setForeground()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (114, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Progress Bar Font</h2>
<p class="intro">Font improves visual appearance of text. You can set needed font, size, style, improve readability. Without setting, font will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setFont(Font)</code> method — setting font</li>
  <li>Improving visual appearance of text</li>
  <li>Customizing string</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting font allows improving visual appearance and readability of text in progress bar.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create font: <code>Font font = new Font("Arial", Font.BOLD, 14);</code></li>
  <li>Set font: <code>progressBar.setFont(font);</code></li>
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
<p>Text on progress bar will be with set font. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (114, 'en', 'Progress Bar Master: set font',
        'Create a progress bar, create font new Font("Arial", Font.BOLD, 14), set via setFont()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (115, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Progress Bar Size</h2>
<p class="intro">Size affects layout. You can set needed size, improve placement. Without setting, size will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setPreferredSize(Dimension)</code> method — setting size</li>
  <li>Managing progress bar size</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting size allows improving interface layout and element placement.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set size: <code>progressBar.setPreferredSize(new Dimension(300, 25));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreferredSize()</code> for setting, Dimension for size</li>
  <li><strong>✅ Excellent:</strong> Use for layout, improve placement</li>
  <li><strong>⚠️ Avoid:</strong> Too small or large size</li>
</ul>
<p><strong>Important:</strong> Make size reasonable. Layout manager will consider it when placing.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will have set size. Layout manager will consider it when placing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (115, 'en', 'Progress Bar Master: set size',
        'Create a progress bar, set size 300x25 via setPreferredSize(new Dimension(300, 25))')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (116, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Progress Bar Tooltip</h2>
<p class="intro">Tooltip helps user. You can show additional information, explain purpose, improve understanding. Without tooltip, user may not understand what progress bar shows.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setToolTipText(String)</code> method — setting tooltip</li>
  <li>Showing information on hover</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Tooltip improves user experience by providing additional information on hover.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>progressBar.setToolTipText("Download progress: 50%");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use informative tooltips, update tooltip when progress changes, use to help user</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips</li>
</ul>
<p><strong>Important:</strong> <code>getToolTipText()</code> — get tooltip. Update when progress changes.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On mouse hover, tooltip will appear. This is a popup tooltip with information. You can improve user experience.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (116, 'en', 'Progress Bar Master: add tooltip',
        'Create a progress bar, set tooltip "Download progress" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (117, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Progress Bar Indeterminate Mode</h2>
<p class="intro">Indeterminate mode shows that work is in progress. When you don''t know exact progress (e.g., download from internet), animation shows that process is active. Without it, user doesn''t know if program is working.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIndeterminate(boolean)</code> method — indeterminate mode</li>
  <li>Animated progress bar</li>
  <li>Using for unknown progress</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Indeterminate mode is necessary for processes with unknown execution time, to show user that process is active.</p>
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
  <li><strong>✅ Use:</strong> For unknown progress</li>
  <li><strong>✅ Excellent:</strong> Switch to determinate mode when progress is known, use for processes with unknown time</li>
  <li><strong>⚠️ Avoid:</strong> Using for known progress — better to show percentage</li>
</ul>
<p><strong>Important:</strong> <code>setIndeterminate(false)</code> — return to normal mode. When progress becomes known, switch to normal mode. Animation shows that process is active.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Progress bar will start animating. Bar will move back and forth, showing that work is in progress. This is a visual signal of process activity.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (117, 'en', 'Progress Bar Master: enable indeterminate mode',
        'Create a progress bar, enable indeterminate mode via setIndeterminate(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (118, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Handling Progress Bar Changes</h2>
<p class="intro">Handling changes allows reacting to progress. You can update other components, perform actions when reaching certain value. Without handling, you cannot react to changes.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>ChangeListener</code> interface — change listener</li>
  <li>The <code>addChangeListener()</code> method — adding listener</li>
  <li>Reacting to progress change</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling changes allows synchronizing interface and reacting to task progress.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>progressBar.addChangeListener(e -> {<br>
&nbsp;&nbsp;int value = progressBar.getValue();<br>
&nbsp;&nbsp;label.setText("Progress: " + value + "%");<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addChangeListener()</code> for handling</li>
  <li><strong>✅ Excellent:</strong> Use <code>getValue()</code> to get value, update other components, perform actions when reaching value</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring changes</li>
</ul>
<p><strong>Important:</strong> Use for synchronizing interface components.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When value changes, handler will fire. You can handle change and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (118, 'en', 'Progress Bar Master: handle changes',
        'Create a progress bar, add ChangeListener, get value via getValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
