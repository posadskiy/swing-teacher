-- Flyway migration V3: Lesson 16
-- This migration contains lesson, tasks, and documentation for lesson 16

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (129, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Panel</h2>
<p class="intro">Panels (<code>JPanel</code>) organize interface. Without panels, all components would be in one place. Panels allow grouping components, creating structure and applying different layout managers.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JPanel</code> class — container for components</li>
  <li>Creating a panel</li>
  <li>Adding components to panel</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Panels are necessary for organizing interface and grouping related components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create panel: <code>JPanel panel = new JPanel();</code></li>
  <li>Add components to panel: <code>panel.add(new JButton("Button"));</code></li>
  <li>Add panel to form: <code>add(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create panel, then add components</li>
  <li><strong>✅ Excellent:</strong> Use panels for grouping related components</li>
  <li><strong>⚠️ Avoid:</strong> Too many nested panels — hard to manage</li>
</ul>
<p><strong>Important:</strong> Panel is a container where you can add other components. You can nest panels inside each other for complex structure. Each panel can have its own layout manager. You can set background color: <code>panel.setBackground(Color.WHITE);</code>. You can set border: <code>panel.setBorder(BorderFactory.createTitledBorder("Title"));</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A panel will appear on the form. This is a container where you can add components. Components will be arranged according to panel''s layout manager.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (129, 'en', 'Beginner Panel: create a container for components',
        'Create a panel, add a button to it and add panel to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (130, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Spinner with Model</h2>
<p class="intro">JSpinner allows changing value step by step. Count, age, size — all of this requires spinner. Without it, you''ll have to enter number manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JSpinner</code> class — spinner</li>
  <li>The <code>SpinnerNumberModel</code> class — number model</li>
  <li>Creating spinner with range</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Spinner simplifies numeric value selection and prevents input errors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>SpinnerNumberModel model = new SpinnerNumberModel(10, 0, 100, 1);</code></li>
  <li>Create spinner: <code>JSpinner spinner = new JSpinner(model);</code></li>
  <li>Add to the form: <code>add(spinner);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SpinnerNumberModel for numbers</li>
  <li><strong>✅ Excellent:</strong> Specify min, max, step in model, use SpinnerDateModel for dates, use SpinnerListModel for list</li>
  <li><strong>⚠️ Avoid:</strong> Too large step — hard to select exact value</li>
</ul>
<p><strong>Important:</strong> <code>getValue()</code> — get value. <code>setValue(Object)</code> — set value.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A spinner with up/down buttons will appear. You can increase and decrease value.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (130, 'en', 'Beginner Spinner: create spinner with model',
        'Create SpinnerNumberModel with value 10, min 0, max 100, step 1, create JSpinner from model, add to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (131, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Layout Manager</h2>
<p class="intro">Layout managers automatically arrange components. Without them, components would overlap. With manager, they are nicely arranged according to rules. This is the foundation of professional interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setLayout(LayoutManager layout)</code> method — setting layout manager</li>
  <li>Various layout managers: <code>FlowLayout</code>, <code>BorderLayout</code>, <code>GridLayout</code></li>
  <li>Managing component placement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Layout managers ensure proper component placement and interface adaptability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create panel: <code>JPanel panel = new JPanel();</code></li>
  <li>Set layout manager: <code>panel.setLayout(new FlowLayout());</code></li>
  <li>Add components: <code>panel.add(new JButton("Button 1"));</code><br><code>panel.add(new JButton("Button 2"));</code></li>
  <li>Add panel to form: <code>add(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>FlowLayout</code> for simple placement</li>
  <li><strong>✅ Excellent:</strong> <code>BorderLayout</code> for structured interface, <code>GridLayout</code> for table placement</li>
  <li><strong>⚠️ Avoid:</strong> Without layout — components will overlap</li>
</ul>
<p><strong>Important:</strong> <code>FlowLayout</code> — components in row, wrap when space runs out. <code>BorderLayout</code> — components at edges (NORTH, SOUTH, EAST, WEST, CENTER). <code>GridLayout</code> — components in grid (rows × columns). By default <code>JPanel</code> uses <code>FlowLayout</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be arranged according to layout manager. If you used <code>FlowLayout</code>, they will line up in row. If <code>BorderLayout</code> — at edges.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (131, 'en', 'Layout Manager: manage placement',
        'Create a panel, set FlowLayout, add two buttons and add panel to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (132, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Spinner for Dates</h2>
<p class="intro">Spinner for dates allows selecting date step by step. Birthday, deadline, event date — all of this requires date selection. Without spinner, you''ll have to enter date manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>SpinnerDateModel</code> class — date model</li>
  <li>Creating spinner for date selection</li>
  <li>Configuring date format</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Spinner for dates simplifies date selection and prevents input errors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create date model: <code>SpinnerDateModel model = new SpinnerDateModel();</code></li>
  <li>Create spinner: <code>JSpinner spinner = new JSpinner(model);</code></li>
  <li>Configure format: <code>JSpinner.DateEditor editor = new JSpinner.DateEditor(spinner, "dd/MM/yyyy");<br>
spinner.setEditor(editor);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SpinnerDateModel for dates</li>
  <li><strong>✅ Excellent:</strong> Configure format via DateEditor, specify min and max dates, use Calendar for working with dates</li>
  <li><strong>⚠️ Avoid:</strong> Not specifying format — may be unclear</li>
</ul>
<p><strong>Important:</strong> <code>getValue()</code> — get Date. Use SimpleDateFormat for formatting.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A spinner for date selection will appear. You can increase and decrease date. Date will be displayed in specified format.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (132, 'en', 'Spinner Master: create spinner for dates',
        'Create SpinnerDateModel, create JSpinner, create DateEditor with format "dd/MM/yyyy", set editor')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (133, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Spinner with List</h2>
<p class="intro">Spinner with list limits selection. You can only select from predefined values. Without list, you can enter any value.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>SpinnerListModel</code> class — list model</li>
  <li>Creating spinner with list of values</li>
  <li>Navigating through list</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Spinner with list limits selection to valid values and prevents input errors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list: <code>String[] values = {"January", "February", "March"};</code></li>
  <li>Create model: <code>SpinnerListModel model = new SpinnerListModel(values);</code></li>
  <li>Create spinner: <code>JSpinner spinner = new JSpinner(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SpinnerListModel for list</li>
  <li><strong>✅ Excellent:</strong> Use array or list, use for limited selection, use for months, days of week</li>
  <li><strong>⚠️ Avoid:</strong> Too long list — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> SpinnerListModel(Object[]) — create from array. SpinnerListModel(List) — create from list. Make list clear.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A spinner with list of values will appear. You can only select from list. You can navigate through list.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (133, 'en', 'Spinner Master: create spinner with list',
        'Create string array, create SpinnerListModel, create JSpinner with model')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (134, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Spinner for Numbers</h2>
<p class="intro">Spinner for numbers limits selection. You can only select from range of numbers, set step. Without model, you can enter any value.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>SpinnerNumberModel</code> class — number model</li>
  <li>Creating spinner for numeric values</li>
  <li>Configuring range and step</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Spinner for numbers limits selection to valid values and prevents input errors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>SpinnerNumberModel model = new SpinnerNumberModel(0, 0, 100, 1);</code></li>
  <li>Create spinner: <code>JSpinner spinner = new JSpinner(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SpinnerNumberModel for numbers</li>
  <li><strong>✅ Excellent:</strong> Specify initial value, specify min and max, specify step</li>
  <li><strong>⚠️ Avoid:</strong> Not specifying range — may be unsafe</li>
</ul>
<p><strong>Important:</strong> value — initial value. min — minimum value. max — maximum value. step — change step.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A spinner for numbers will appear. You can only select from range. You can change value with specified step.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (134, 'en', 'Spinner Master: create spinner for numbers',
        'Create SpinnerNumberModel with initial 0, min 0, max 100, step 1, create JSpinner with model')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (135, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Handling Spinner Changes</h2>
<p class="intro">Handling changes makes spinner interactive. You can react to value change, update other components. Without handling, changes won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling changes via ChangeListener</li>
  <li>Getting new value</li>
  <li>Reacting to changes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling changes allows synchronizing interface and reacting to user actions.</p>
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
  <li><strong>✅ Excellent:</strong> Get new value via <code>getValue()</code>, update other components, validate value</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring changes</li>
</ul>
<p><strong>Important:</strong> Use for synchronizing interface components.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When value changes, handler will fire. You can get new value and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (135, 'en', 'Spinner Master: handle changes',
        'Add ChangeListener, get value via getValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (136, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Spinner for Dates (Extended)</h2>
<p class="intro">Spinner for dates limits selection. You can only select date, set change step. Without model, you can enter any value.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>SpinnerDateModel</code> class — date model</li>
  <li>Creating spinner for dates</li>
  <li>Configuring step and format</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Spinner for dates simplifies date selection and prevents input errors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>SpinnerDateModel model = new SpinnerDateModel();</code></li>
  <li>Create spinner: <code>JSpinner spinner = new JSpinner(model);</code></li>
  <li>Configure editor: <code>JSpinner.DateEditor editor = new JSpinner.DateEditor(spinner, "dd.MM.yyyy");<br>
spinner.setEditor(editor);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SpinnerDateModel for dates</li>
  <li><strong>✅ Excellent:</strong> Use DateEditor for format, specify date format, configure change step</li>
  <li><strong>⚠️ Avoid:</strong> Not specifying format — may be unreadable</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A spinner for dates will appear. You can select date with specified format. You can change date with specified step.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (136, 'en', 'Spinner Master: create spinner for dates',
        'Create SpinnerDateModel, create JSpinner with model, create DateEditor with format "dd.MM.yyyy", set via setEditor()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (137, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Custom Spinner Formatter</h2>
<p class="intro">Custom formatter allows customizing display. You can show values in needed format, improve readability. Without formatter, display will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JSpinner.DefaultEditor</code> class — default editor</li>
  <li>The <code>setEditor()</code> method — setting editor</li>
  <li>Creating custom formatting</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Custom formatter improves readability and allows displaying values in needed format.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create formatter: <code>JSpinner.NumberEditor editor = new JSpinner.NumberEditor(spinner, "#,##0.00");</code></li>
  <li>Set editor: <code>spinner.setEditor(editor);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> NumberEditor for numbers</li>
  <li><strong>✅ Excellent:</strong> Use DateEditor for dates, use custom format, use to improve readability</li>
  <li><strong>⚠️ Avoid:</strong> Too complex format</li>
</ul>
<p><strong>Important:</strong> Use for formatting and improving readability.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Value will be displayed in custom format. You can show numbers with separators, dates in needed format.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (137, 'en', 'Spinner Master: create custom formatter',
        'Create NumberEditor with format "#,##0.00", set via setEditor()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (138, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Spinner Step</h2>
<p class="intro">Step defines increment. You can set change step, improve control. Without step, increment will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>SpinnerNumberModel</code> class — number model</li>
  <li>stepSize parameter — step size</li>
  <li>Managing change step</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting step allows controlling value increment and improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model with step: <code>SpinnerNumberModel model = new SpinnerNumberModel(0, 0, 100, 5);</code></li>
  <li>Set model: <code>spinner.setModel(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> SpinnerNumberModel for numbers</li>
  <li><strong>✅ Excellent:</strong> Specify step in constructor, use for control, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Too large or small step</li>
</ul>
<p><strong>Important:</strong> step — step size. Make step reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When changing, value will change by step. You can control increment.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (138, 'en', 'Spinner Master: set step', 'Create SpinnerNumberModel(0, 0, 100, 5), set via setModel()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (139, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Setting Spinner Value</h2>
<p class="intro">Value defines current state. You can set initial value, change it, improve control. Without setting, value will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setValue()</code> method — setting value</li>
  <li>The <code>getValue()</code> method — getting value</li>
  <li>Managing spinner value</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing value allows programmatically controlling spinner state.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set value: <code>spinner.setValue(50);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setValue()</code> for setting, <code>getValue()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Use for control, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Setting value outside range</li>
</ul>
<p><strong>Important:</strong> Check boundaries before setting value.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Spinner value will be set. You can control value.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (139, 'en', 'Spinner Master: set value', 'Set value 50 via setValue()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (140, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Getting Spinner Editor</h2>
<p class="intro">Editor allows managing text field. You can access text field, change it, improve functionality. Without access, you cannot manage field.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getEditor()</code> method — getting editor</li>
  <li>Accessing spinner text field</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Access to editor allows customizing text field and improving spinner functionality.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get editor: <code>JSpinner.DefaultEditor editor = (JSpinner.DefaultEditor) spinner.getEditor();</code></li>
  <li>Get text field: <code>JTextField field = editor.getTextField();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getEditor()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Cast to DefaultEditor, use <code>getTextField()</code> for field, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Changing without necessity</li>
</ul>
<p><strong>Important:</strong> DefaultEditor — default editor. Use for control and improving functionality.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can access text field. You can manage field.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (140, 'en', 'Spinner Master: get editor',
        'Get editor via getEditor(), cast to DefaultEditor, get text field via getTextField()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
