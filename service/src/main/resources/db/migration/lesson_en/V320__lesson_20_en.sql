-- Flyway migration V3: Lesson 20
-- This migration contains lesson, tasks, and documentation for lesson 20

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (170, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Scrollable Panel</h2>
<p class="intro">JScrollPane allows you to view large content. Long texts, large lists, large images — all of this requires scrolling. Without scrolling, you cannot see all the content.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JScrollPane</code> — panel with scrolling</li>
  <li>Creating a scrollable area</li>
  <li>Adding a component to JScrollPane</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>A scrollable panel is necessary for displaying content that doesn''t fit on the screen.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a component (e.g., JTextArea): <code>JTextArea area = new JTextArea("Long text...");</code></li>
  <li>Create a scrollable panel: <code>JScrollPane scrollPane = new JScrollPane(area);</code></li>
  <li>Add to the form: <code>add(scrollPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Wrap component in JScrollPane</li>
  <li><strong>✅ Great:</strong> Configure scroll policy for horizontal and vertical</li>
  <li><strong>⚠️ Avoid:</strong> JScrollPane without component — empty scrolling</li>
</ul>
<p><strong>Important:</strong> Constructor: <code>new JScrollPane(component)</code>. Scroll policy: <code>setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);</code>. Vertical: <code>setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);</code>. Always show: <code>ALWAYS</code>, as needed: <code>AS_NEEDED</code>, never: <code>NEVER</code>. Usually used for JTextArea, JList, JTable, JTree.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A scrollable area will appear. If the content is larger than the area, scroll bars will appear. You can scroll the content with the mouse or keyboard.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (170, 'en', 'Scrollable Panel Beginner: Add Scrolling',
        'Create a text area, wrap it in JScrollPane and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (171, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Double Buffering Panel</h2>
<p class="intro">Double buffering improves smoothness. Rendering will occur in a buffer, then be copied to the screen, eliminating flicker. Without buffering, there may be flicker.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDoubleBuffered()</code> — enabling buffering</li>
  <li>Improving rendering smoothness</li>
  <li>Creating smooth animations</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Double buffering is necessary for smooth rendering and eliminating flicker during animations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable buffering: <code>panel.setDoubleBuffered(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDoubleBuffered(true)</code> to enable</li>
  <li><strong>✅ Great:</strong> Use for animations, use for custom rendering, improve smoothness</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without need</li>
</ul>
<p><strong>Important:</strong> <code>true</code> — enable (default for JPanel), <code>false</code> — disable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Rendering will be smooth without flicker. Animations will look better.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (171, 'en', 'Panel Master: Enable Double Buffering',
        'Enable double buffering via setDoubleBuffered(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (172, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Preferred Panel Size</h2>
<p class="intro">Preferred size affects layout. Layout manager uses it for placement, improve positioning. Without size, size will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreferredSize()</code> — setting preferred size</li>
  <li>Managing panel size</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Preferred size allows you to control layout and improve component positioning.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set size: <code>panel.setPreferredSize(new Dimension(200, 100));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreferredSize()</code> to set</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, use for layout, improve positioning</li>
  <li><strong>⚠️ Avoid:</strong> Setting too small or large size</li>
</ul>
<p><strong>Important:</strong> Make size reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The panel will have a preferred size. Layout manager will take it into account when placing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (172, 'en', 'Panel Master: Set Preferred Size',
        'Set preferred size 200x100 via setPreferredSize(new Dimension(200, 100))')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (173, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Minimum Panel Size</h2>
<p class="intro">Minimum size limits shrinking. You can set a minimum size, prevent too small panel, improve layout. Without limit, panel may be too small.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMinimumSize()</code> — setting minimum size</li>
  <li>Managing minimum panel size</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Minimum size allows you to prevent too small panel and improve layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set minimum size: <code>panel.setMinimumSize(new Dimension(100, 50));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMinimumSize()</code> to set</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, use for limiting, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Setting too large minimum size</li>
</ul>
<p><strong>Important:</strong> Make size reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The panel cannot be smaller than the minimum size. You can prevent too small panel.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (173, 'en', 'Panel Master: Set Minimum Size',
        'Set minimum size 100x50 via setMinimumSize(new Dimension(100, 50))')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (174, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Maximum Panel Size</h2>
<p class="intro">Maximum size limits expansion. You can set a maximum size, prevent too large panel, improve layout. Without limit, panel may be too large.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMaximumSize()</code> — setting maximum size</li>
  <li>Managing maximum panel size</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Maximum size allows you to prevent too large panel and improve layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set maximum size: <code>panel.setMaximumSize(new Dimension(500, 300));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMaximumSize()</code> to set</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, use for limiting, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Setting too small maximum size</li>
</ul>
<p><strong>Important:</strong> Make size reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The panel cannot be larger than the maximum size. You can prevent too large panel.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (174, 'en', 'Panel Master: Set Maximum Size',
        'Set maximum size 500x300 via setMaximumSize(new Dimension(500, 300))')
ON CONFLICT (task_id, language_code) DO NOTHING;
