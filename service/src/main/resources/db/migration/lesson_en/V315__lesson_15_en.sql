-- Flyway migration V3: Lesson 15
-- This migration contains lesson, tasks, and documentation for lesson 15

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (119, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Scrollbar</h2>
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
<p><strong>Important:</strong> value — current value. extent — visible area. min, max — minimum and maximum value.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A scrollbar will appear. This is a scrollbar that can be moved. Usually used inside JScrollPane for automatic scrolling.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (119, 'en', 'Beginner Scrollbar: create a scrollbar',
        'Create a vertical scrollbar with range 0-100 and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (120, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Scrollbar Orientation</h2>
<p class="intro">Orientation affects scrollbar appearance. Horizontal — for scrolling by width, vertical — by height. You can choose suitable orientation for content.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setOrientation(int)</code> method — setting orientation</li>
  <li>Constants <code>HORIZONTAL</code> and <code>VERTICAL</code></li>
  <li>Horizontal and vertical scrollbar</li>
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
  <li>Or vertical: <code>scrollBar.setOrientation(JScrollBar.VERTICAL);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> HORIZONTAL for horizontal, VERTICAL for vertical</li>
  <li><strong>✅ Excellent:</strong> Choose orientation depending on content, use for scrolling in needed direction</li>
  <li><strong>⚠️ Avoid:</strong> Using wrong orientation</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar will have set orientation. Horizontal — left to right, vertical — top to bottom.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (120, 'en', 'Scrollbar Master: set orientation',
        'Create a scrollbar, set horizontal orientation via setOrientation(JScrollBar.HORIZONTAL)')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (121, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Scrollbar Range</h2>
<p class="intro">Range defines scrolling boundaries. You can set any range depending on content size. Without range, scrolling won''t make sense.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMinimum(int)</code> method — setting minimum</li>
  <li>The <code>setMaximum(int)</code> method — setting maximum</li>
  <li>Managing scrolling range</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Range defines scrolling boundaries and allows adapting scrollbar for various content sizes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set minimum: <code>scrollBar.setMinimum(0);</code></li>
  <li>Set maximum: <code>scrollBar.setMaximum(1000);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMinimum()</code> and <code>setMaximum()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use JScrollBar(orientation, value, extent, min, max) constructor, use reasonable values, use for different content sizes</li>
  <li><strong>⚠️ Avoid:</strong> Setting minimum greater than maximum</li>
</ul>
<p><strong>Important:</strong> <code>getMinimum()</code> — get minimum. <code>getMaximum()</code> — get maximum.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar will have set range. Value will be limited by this range.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (121, 'en', 'Scrollbar Master: set minimum and maximum value',
        'Create a scrollbar, set minimum 0 and maximum 1000 via setMinimum() and setMaximum()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (122, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Scrollbar Current Value</h2>
<p class="intro">Current value defines scroll position. You can programmatically set position, scroll to needed place. Without managing position, scrolling will be only manual.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setValue(int)</code> method — setting value</li>
  <li>The <code>getValue()</code> method — getting value</li>
  <li>Managing scroll position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing current value allows programmatically controlling scroll position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set value: <code>scrollBar.setValue(500);</code></li>
  <li>Get value: <code>int value = scrollBar.getValue();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setValue()</code> for setting, <code>getValue()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Programmatically scroll to needed place, use for automatic scrolling</li>
  <li><strong>⚠️ Avoid:</strong> Setting value outside range</li>
</ul>
<p><strong>Important:</strong> Value must be in range [minimum, maximum]. Use for automatic scrolling.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar will set to specified position. Thumb will move to specified value. If connected to content, content will scroll.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (122, 'en', 'Scrollbar Master: set current value',
        'Create a scrollbar, set value 500 via setValue()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (123, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Scrollbar Unit Increment</h2>
<p class="intro">Unit increment defines scroll precision. You can set how many units to scroll when clicking arrows. Without setting, increment will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setUnitIncrement(int)</code> method — setting unit increment</li>
  <li>Scrolling by one unit</li>
  <li>Managing scroll precision</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Unit increment allows configuring scroll precision when using scrollbar arrows.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set unit increment: <code>scrollBar.setUnitIncrement(10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setUnitIncrement()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use reasonable values, use for precise scrolling, configure depending on content</li>
  <li><strong>⚠️ Avoid:</strong> Too large or small increment</li>
</ul>
<p><strong>Important:</strong> <code>getUnitIncrement()</code> — get unit increment.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking arrows, scrollbar will scroll by set increment. You can configure scroll precision.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (123, 'en', 'Scrollbar Master: set unit increment',
        'Create a scrollbar, set unit increment 10 via setUnitIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (124, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Scrollbar Block Increment</h2>
<p class="intro">Block increment defines fast scrolling. You can set how many units to scroll when clicking scrollbar area. Without setting, increment will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBlockIncrement(int)</code> method — setting block increment</li>
  <li>Scrolling by block</li>
  <li>Managing fast scrolling</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Block increment allows configuring fast scrolling when clicking scrollbar area.</p>
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
  <li><strong>✅ Use:</strong> <code>setBlockIncrement()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use reasonable values, use for fast scrolling, configure depending on content</li>
  <li><strong>⚠️ Avoid:</strong> Too large or small increment</li>
</ul>
<p><strong>Important:</strong> <code>getBlockIncrement()</code> — get block increment.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking scrollbar area, it will scroll by set block. You can configure fast scrolling.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (124, 'en', 'Scrollbar Master: set block increment',
        'Create a scrollbar, set block increment 50 via setBlockIncrement()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (125, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Scrollbar Colors</h2>
<p class="intro">Colors improve visual appearance. You can set thumb color, background color, make scrollbar noticeable. Without setting, colors will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setForeground(Color)</code> method — thumb color</li>
  <li>The <code>setBackground(Color)</code> method — background color</li>
  <li>Customizing appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting colors allows improving visual appearance and making scrollbar more noticeable.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set thumb color: <code>scrollBar.setForeground(Color.BLUE);</code></li>
  <li>Set background color: <code>scrollBar.setBackground(Color.LIGHT_GRAY);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setForeground()</code> for thumb, <code>setBackground()</code> for background</li>
  <li><strong>✅ Excellent:</strong> Use Color constants, use <code>new Color()</code> for custom colors</li>
  <li><strong>⚠️ Avoid:</strong> Too bright colors</li>
</ul>
<p><strong>Important:</strong> Color.BLUE, Color.GREEN, Color.RED — standard colors. <code>new Color(r, g, b)</code> — custom color.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbar will have set colors. Thumb will be one color, background — another. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (125, 'en', 'Scrollbar Master: set colors',
        'Create a scrollbar, set thumb color Color.BLUE via setForeground()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (126, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Scrollbar Size</h2>
<p class="intro">Size affects layout. You can set needed size, improve placement. Without setting, size will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setPreferredSize(Dimension)</code> method — setting size</li>
  <li>Managing scrollbar size</li>
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
  <li>Set size: <code>scrollBar.setPreferredSize(new Dimension(20, 200));</code></li>
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
<p>Scrollbar will have set size. Layout manager will consider it when placing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (126, 'en', 'Scrollbar Master: set size',
        'Create a scrollbar, set size 20x200 via setPreferredSize(new Dimension(20, 200))')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (127, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Scrollbar Tooltip</h2>
<p class="intro">Tooltip helps user. You can show additional information, explain purpose, improve understanding. Without tooltip, user may not understand what scrollbar is for.</p>
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
  <li>Set tooltip: <code>scrollBar.setToolTipText("Scroll content");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> Use informative tooltips, update tooltip when position changes, use to help user</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips</li>
</ul>
<p><strong>Important:</strong> <code>getToolTipText()</code> — get tooltip. Update when position changes.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On mouse hover, tooltip will appear. This is a popup tooltip with information. You can improve user experience.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (127, 'en', 'Scrollbar Master: add tooltip',
        'Create a scrollbar, set tooltip "Scroll content" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (128, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Handling Scrollbar Changes</h2>
<p class="intro">Handling changes allows reacting to scrolling. You can update other components, perform actions when position changes. Without handling, you cannot react to changes.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>AdjustmentListener</code> interface — change listener</li>
  <li>The <code>addAdjustmentListener()</code> method — adding listener</li>
  <li>Reacting to position change</li>
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
&nbsp;&nbsp;int value = scrollBar.getValue();<br>
&nbsp;&nbsp;label.setText("Position: " + value);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addAdjustmentListener()</code> for handling</li>
  <li><strong>✅ Excellent:</strong> Use <code>getValue()</code> to get value, update other components, perform actions when position changes</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring changes</li>
</ul>
<p><strong>Important:</strong> Use for synchronizing interface components.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When position changes, handler will fire. You can handle change and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (128, 'en', 'Scrollbar Master: handle changes',
        'Create a scrollbar, add AdjustmentListener, get value via getValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
