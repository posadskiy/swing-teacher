-- Flyway migration V3: Lesson 5
-- This migration contains lesson, tasks, and documentation for lesson 5

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (49, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Text Area</h2>
<p class="intro">Text areas (<code>JTextArea</code>) are needed for long texts. Comments, descriptions, notes, messages — all of this requires multi-line input. Unlike <code>JTextField</code>, here you can write in multiple lines.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JTextArea</code> class — multi-line field for text input</li>
  <li>Creating a text area</li>
  <li>Difference between single-line and multi-line fields</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Text areas are needed for long texts. Without text areas, the user cannot enter long text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text area: <code>JTextArea area = new JTextArea();</code></li>
  <li>Add to the form: <code>add(area);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with sizes: <code>new JTextArea(5, 20)</code> — 5 rows, 20 characters</li>
  <li><strong>✅ Excellent:</strong> Create with initial text: <code>new JTextArea("Text")</code></li>
  <li><strong>⚠️ Acceptable:</strong> <code>add(new JTextArea());</code> — can''t configure later</li>
</ul>
<p><strong>Important:</strong> Text area can contain many lines of text. You can set sizes in constructor: <code>new JTextArea(rows, columns)</code>. Usually used together with <code>JScrollPane</code> for scrolling. Text wraps automatically (if wrap is enabled). Use for comments, descriptions, long texts.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A multi-line text field will appear on the form. This is a large rectangular area where you can enter text in multiple lines. The user can click and start typing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (49, 'en', 'Beginner Text Area: create a multi-line field',
        'Create a text area and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (50, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Line Wrapping</h2>
<p class="intro">Line wrapping makes text readable. Without wrapping, a long line will go beyond the area boundary and will need to be scrolled horizontally. With wrapping, text automatically wraps and is easier to read.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setLineWrap(boolean wrap)</code> method — enabling line wrapping</li>
  <li>The <code>setWrapStyleWord(boolean wrap)</code> method — word wrapping</li>
  <li>Automatic wrapping of long lines</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Line wrapping makes text readable without horizontal scrolling. This improves user experience when working with long texts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text area: <code>JTextArea area = new JTextArea();</code></li>
  <li>Enable line wrapping: <code>area.setLineWrap(true);</code><br><code>area.setWrapStyleWord(true);</code></li>
  <li>Add to the form: <code>add(area);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> <code>setLineWrap(true)</code> + <code>setWrapStyleWord(true)</code> — word wrapping</li>
  <li><strong>✅ Excellent:</strong> Word wrapping — words don''t break</li>
  <li><strong>⚠️ Avoid:</strong> Only <code>setLineWrap(true)</code> — words may break</li>
  <li><strong>❌ Bad:</strong> Without wrapping — long lines are inconvenient</li>
</ul>
<p><strong>Important:</strong> Usually both methods are used together. Wrapping makes text readable without horizontal scrolling. Recommended for all text areas.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Long lines will automatically wrap. If text doesn''t fit in the area width, it will wrap to a new line. Words won''t break (if <code>setWrapStyleWord(true)</code> is enabled).</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (50, 'en', 'Line Wrapping: enable automatic wrapping',
        'Create a text area, enable word wrapping and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
