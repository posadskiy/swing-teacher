-- Flyway migration V3: Lesson 8
-- This migration contains lesson, tasks, and documentation for lesson 8

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (72, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Radio Button</h2>
<p class="intro">Radio buttons (<code>JRadioButton</code>) allow selecting one option from several. "Male/Female", "Yes/No", "Easy/Medium/Hard" — all of this is implemented through radio buttons. You can select only one option from a group.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JRadioButton</code> class — radio button for single selection</li>
  <li>Creating a radio button</li>
  <li>Grouping radio buttons with <code>ButtonGroup</code></li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Radio buttons allow making a single selection from several options. Without them, the user cannot make a single selection.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a radio button: <code>JRadioButton radio = new JRadioButton("Option 1");</code></li>
  <li>Add to the form: <code>add(radio);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with text: <code>new JRadioButton("Text")</code></li>
  <li><strong>✅ Excellent:</strong> Group related radio buttons via <code>ButtonGroup</code></li>
  <li><strong>⚠️ Important:</strong> Without group, multiple can be selected — use <code>ButtonGroup</code></li>
</ul>
<p><strong>Important:</strong> Radio buttons should be in a group for single selection. Create group: <code>ButtonGroup group = new ButtonGroup();</code>. Add to group: <code>group.add(radio);</code>. In a group, only one button can be selected. Use clear texts for each option.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A radio button will appear on the form. This is a round button with a dot inside (if selected) or empty (if not selected). The user can click to select an option.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (72, 'en', 'Beginner Radio Button: create a selection switch',
        'Create a radio button with text "Option 1" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (73, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Radio Button Group</h2>
<p class="intro">Group (<code>ButtonGroup</code>) ensures single selection. Without a group, multiple radio buttons can be selected simultaneously — this is incorrect. Group guarantees that only one option is selected.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>ButtonGroup</code> class — group for radio buttons</li>
  <li>Adding radio buttons to a group</li>
  <li>Single selection in a group</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Group ensures single selection from several options. This is critical for proper radio button operation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a group: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Create radio buttons: <code>JRadioButton radio1 = new JRadioButton("Option 1");</code><br><code>JRadioButton radio2 = new JRadioButton("Option 2");</code></li>
  <li>Add to group: <code>group.add(radio1);</code><br><code>group.add(radio2);</code></li>
  <li>Add to the form: <code>add(radio1);</code><br><code>add(radio2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create group, then add buttons</li>
  <li><strong>✅ Excellent:</strong> All related radio buttons in one group</li>
  <li><strong>⚠️ Important:</strong> Don''t add button to multiple groups — behavior is unpredictable</li>
  <li><strong>❌ Bad:</strong> Forget to create group — multiple can be selected</li>
</ul>
<p><strong>Important:</strong> Create group before creating radio buttons. Add all related radio buttons to one group. In a group, only one button can be selected. When selecting a new button, the previous one is automatically deselected. You can programmatically select: <code>radio1.setSelected(true);</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Radio buttons will work as a group. When selecting one button, the other will automatically be deselected. Only one option from the group can be selected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (73, 'en', 'Button Group: combine radio buttons in a group',
        'Create a group, two radio buttons, add them to the group and to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
