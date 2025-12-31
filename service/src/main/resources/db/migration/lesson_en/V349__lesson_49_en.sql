-- Flyway migration V3: Lesson 49
-- This migration contains lesson, tasks, and documentation for lesson 49

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (437, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Handling Element Selection with ItemListener</h2>
<p class="intro">ItemListener allows responding to selection. You can handle selection in checkbox, radio button, combobox, update other components. Without handling, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>ItemListener</code> — selection listener</li>
  <li>Method <code>itemStateChanged(ItemEvent)</code> — handling change</li>
  <li>Using with JCheckBox, JRadioButton, JComboBox</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>ItemListener is necessary for handling element selection and updating other components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>checkBox.addItemListener(e -> {<br>
&nbsp;&nbsp;if (e.getStateChange() == ItemEvent.SELECTED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected!");<br>
&nbsp;&nbsp;} else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Deselected!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addItemListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Use <code>getStateChange()</code> for checking, use ItemEvent.SELECTED and DESELECTED, update other components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When selection changes, handler will fire. You can handle selection and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (437, 'en', 'ItemListener Beginner: Handle Element Selection',
        'Create checkbox, add ItemListener, check getStateChange() == ItemEvent.SELECTED, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (438, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Handling Changes with ChangeListener</h2>
<p class="intro">ChangeListener allows responding to changes. You can handle slider change, spinner change, progress bar change, update other components. Without handling, changes won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>ChangeListener</code> — change listener</li>
  <li>Method <code>stateChanged(ChangeEvent)</code> — handling change</li>
  <li>Using with JSlider, JSpinner, JProgressBar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>ChangeListener is necessary for handling value changes and updating other components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>slider.addChangeListener(e -> {<br>
&nbsp;&nbsp;int value = slider.getValue();<br>
&nbsp;&nbsp;label.setText("Value: " + value);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addChangeListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Use <code>getValue()</code> to get value, update other components, perform actions on change</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring changes</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When value changes, handler will fire. You can handle change and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (438, 'en', 'ChangeListener Beginner: Handle Changes',
        'Create slider, add ChangeListener, get value via getValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (439, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Selection in ComboBox with ItemListener</h2>
<p class="intro">Handling selection allows responding to element selection. You can update other components, load data, perform actions. Without handling, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling selection in JComboBox</li>
  <li>Getting selected element</li>
  <li>Responding to selection change</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling selection is necessary for responding to element selection in combobox.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>comboBox.addItemListener(e -> {<br>
&nbsp;&nbsp;if (e.getStateChange() == ItemEvent.SELECTED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;Object item = e.getItem();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected: " + item);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addItemListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Use <code>getItem()</code> to get element, update other components, load data on selection</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring selection</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When selecting element, handler will fire. You can handle selection and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (439, 'en', 'ItemListener Master: Handle Selection in ComboBox',
        'Create combobox with elements, add ItemListener, get element via getItem(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (440, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Handling Changes in Spinner with ChangeListener</h2>
<p class="intro">Handling changes allows responding to value change. You can update other components, perform validation, perform actions. Without handling, change won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling changes in JSpinner</li>
  <li>Getting spinner value</li>
  <li>Responding to value change</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling changes is necessary for responding to value change in spinner.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>spinner.addChangeListener(e -> {<br>
&nbsp;&nbsp;Object value = spinner.getValue();<br>
&nbsp;&nbsp;label.setText("Value: " + value);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addChangeListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Use <code>getValue()</code> to get value, update other components, perform validation</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring changes</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When value changes, handler will fire. You can handle change and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (440, 'en', 'ChangeListener Master: Handle Changes in Spinner',
        'Create spinner, add ChangeListener, get value via getValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;
