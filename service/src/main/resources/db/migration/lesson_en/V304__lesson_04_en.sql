-- Flyway migration V3: Lesson 4
-- This migration contains lesson, tasks, and documentation for lesson 4

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (35, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Text Field</h2>
<p class="intro">Text fields (<code>JTextField</code>) are a way to get information from the user. Name, password, email, search query — all of this is entered through text fields.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JTextField</code> class — single-line field for text input</li>
  <li>Creating a text field</li>
  <li>Basic use of input fields</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Text fields are a way to get information from the user. Without them, the application cannot interact with the user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text field: <code>JTextField field = new JTextField();</code></li>
  <li>Add to the form: <code>add(field);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create a variable, then add — you can configure</li>
  <li><strong>✅ Excellent:</strong> Create with initial text: <code>new JTextField("Text")</code></li>
  <li><strong>✅ Excellent:</strong> Create with size: <code>new JTextField(20)</code> — 20 characters wide</li>
  <li><strong>⚠️ Acceptable:</strong> <code>add(new JTextField());</code> — can''t configure later</li>
</ul>
<p><strong>Important:</strong> Text field can be edited. You can set initial text in the constructor. You can set width in characters. Field automatically adjusts height to font. Use clear variable names.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>An empty text field will appear on the form. This is a white rectangular area where you can enter text. The user can click and start typing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (35, 'en', 'Beginner Text Field: create an input field', 'Create a text field and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (36, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Text in Field</h2>
<p class="intro">Initial text helps the user understand what to enter. "Enter name" or example "example@email.com" — all of this makes the interface clearer.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setText(String text)</code> method — setting text</li>
  <li>Initial text in text field</li>
  <li>Getting text with <code>getText()</code> method</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Initial text helps the user understand what is expected. It''s like a placeholder in forms — shows what needs to be entered.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text field: <code>JTextField field = new JTextField();</code></li>
  <li>Set the text: <code>field.setText("Enter text");</code></li>
  <li>Add to the form: <code>add(field);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Set in constructor: <code>new JTextField("Text")</code></li>
  <li><strong>✅ Excellent:</strong> Set via <code>setText()</code> — can change later</li>
  <li><strong>⚠️ Avoid:</strong> Very long text — field will stretch</li>
  <li><strong>❌ Bad:</strong> Forget quotes — <code>setText(Text)</code> won''t work</li>
</ul>
<p><strong>Important:</strong> Text can be set when creating or later via <code>setText()</code>. Get text: <code>String text = field.getText();</code>. Clear field: <code>field.setText("");</code>. User can change text in field. Use informative initial texts.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The specified text will appear in the text field. The user can change, delete, or add to it.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (36, 'en', 'Text in Field: set initial value',
        'Create a text field, set text "Enter name" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (37, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Field Size</h2>
<p class="intro">Field size determines input convenience. Too narrow — inconvenient, too wide — takes up a lot of space. Proper size makes the interface neat and convenient.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSize(int width, int height)</code> method — setting size</li>
  <li>The <code>setColumns(int columns)</code> method — width in characters</li>
  <li>Managing text field sizes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper size makes the interface neat and convenient. Size should match expected content.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text field: <code>JTextField field = new JTextField();</code></li>
  <li>Set the size: <code>field.setSize(200, 30);</code></li>
  <li>Add to the form: <code>add(field);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Use <code>setColumns(20)</code> — width in characters</li>
  <li><strong>✅ Excellent:</strong> Combination: <code>setColumns()</code> for width, height automatically</li>
  <li><strong>⚠️ Avoid:</strong> <code>setSize()</code> may conflict with layout</li>
  <li><strong>❌ Bad:</strong> Too small size — inconvenient to enter</li>
</ul>
<p><strong>Important:</strong> <code>setColumns(20)</code> — width for 20 characters (recommended). Height is usually 20-30 pixels for single-line field. Width depends on content: name — 15-20 characters, email — 25-30. Remember: layout manager may change size.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text field will become the specified size. If you used <code>setColumns(20)</code>, the field will be approximately 20 characters wide.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (37, 'en', 'Field Size: make it the right width',
        'Create a text field, set width 20 characters and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (38, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Field Colors</h2>
<p class="intro">Colors help classify fields. White background for regular fields, light yellow for required, light gray for inactive. This makes the interface intuitive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>setBackground(Color)</code> and <code>setForeground(Color)</code></li>
  <li>Background and text colors in text field</li>
  <li>Creating contrasting combinations</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Colors help highlight important fields and create visual hierarchy. Proper colors make the interface intuitive and clear.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text field: <code>JTextField field = new JTextField();</code></li>
  <li>Set colors: <code>field.setBackground(Color.YELLOW);</code><br><code>field.setForeground(Color.BLACK);</code></li>
  <li>Add to the form: <code>add(field);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Contrasting colors — black text on light background</li>
  <li><strong>✅ Excellent:</strong> White background for regular fields, colored for important</li>
  <li><strong>⚠️ Avoid:</strong> Too bright colors — eyes will tire</li>
  <li><strong>❌ Bad:</strong> Dark text on dark background — won''t read</li>
</ul>
<p><strong>Important:</strong> Use preset colors. Background is usually light for readability. Text is usually dark. Can use to highlight required fields. Remember contrast for readability.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text field will display with the specified colors. Background and text will match the set values.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (38, 'en', 'Field Colors: color the input field',
        'Create a text field, set yellow background and black text, add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (39, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Field Editability</h2>
<p class="intro">Locked fields protect data. User ID, creation date, status — all of this should not be changed by the user. Locked fields show information but don''t allow editing it.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setEditable(boolean editable)</code> method — managing editability</li>
  <li>Locked and unlocked fields</li>
  <li>Visual difference of locked fields</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Locked fields protect data from being changed by the user. This is important for protected or calculated values.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a text field: <code>JTextField field = new JTextField("Text");</code></li>
  <li>Lock the field: <code>field.setEditable(false);</code></li>
  <li>Add to the form: <code>add(field);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEditable(false)</code> for protected data</li>
  <li><strong>✅ Excellent:</strong> Combination with gray background for visual difference</li>
  <li><strong>⚠️ Avoid:</strong> Lock all fields — user won''t enter anything</li>
  <li><strong>❌ Bad:</strong> Forget to unlock needed fields</li>
</ul>
<p><strong>Important:</strong> <code>setEditable(false)</code> — field cannot be edited. <code>setEditable(true)</code> — field can be edited (default). Locked field usually has gray background. Use to display calculated or protected values.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The field will become locked. User cannot change text in field. Background may become gray. Text will remain visible but unavailable for editing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (39, 'en', 'Editability: lock or unlock field',
        'Create a text field, lock it and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (40, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Field Tooltip</h2>
<p class="intro">Tooltips help the user understand what to enter. You can show an example, format, requirements. Without tooltips, the user may not understand what to enter.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setToolTipText()</code> method — setting tooltip</li>
  <li>Creating tooltips for input fields</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Tooltips improve user experience. They help understand data format, requirements, and input examples.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>textField.setToolTipText("Enter your name");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> for tooltips</li>
  <li><strong>✅ Excellent:</strong> Show input examples, data format</li>
  <li><strong>✅ Additionally:</strong> Use HTML for formatting tooltips</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Tooltip appears on mouse hover. Can use HTML for formatting. Short and clear tooltips are better. Show examples and format.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On mouse hover, a tooltip will appear. The tooltip will show what needs to be entered.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (40, 'en', 'Text Field Master: add tooltip',
        'Set tooltip "Enter your name" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (41, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Input Validation</h2>
<p class="intro">Input validation prevents errors. You can allow only digits, only letters, a specific format. Without validation, the user can enter anything.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Input validation via DocumentFilter</li>
  <li>Restricting input characters</li>
  <li>Checking data format</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Input validation prevents errors and improves data quality. You can restrict input to only allowed characters or formats.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get document: <code>AbstractDocument doc = (AbstractDocument) textField.getDocument();</code></li>
  <li>Set filter: <code>doc.setDocumentFilter(new DocumentFilter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (string.matches("\\\\d+")) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;super.insertString(fb, offset, string, attr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> DocumentFilter for validation</li>
  <li><strong>✅ Excellent:</strong> Check via regular expressions, show error messages</li>
  <li><strong>✅ Additionally:</strong> Validate on focus loss</li>
  <li><strong>⚠️ Avoid:</strong> Too strict validation — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> DocumentFilter — filter for validation. <code>insertString()</code> — check on insert, <code>replace()</code> — check on replace. Use regular expressions for checking. Show clear error messages.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Input will be validated. Invalid characters won''t be entered. You can allow only needed characters.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (41, 'en', 'Text Field Master: validate input',
        'Get document, create DocumentFilter to check digits via regular expression, set filter')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (42, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Cursor Position</h2>
<p class="intro">Cursor position determines where the cursor will be. You can set cursor to beginning, end, or specific position. Without setting, cursor will be at the end.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setCaretPosition()</code> method — setting cursor position</li>
  <li>The <code>getCaretPosition()</code> method — getting position</li>
  <li>Managing cursor position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing cursor position improves user experience. You can set cursor to the right place for editing convenience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set position: <code>textField.setCaretPosition(0);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setCaretPosition()</code> for setting</li>
  <li><strong>✅ Excellent:</strong> 0 for beginning, <code>getText().length()</code> for end</li>
  <li><strong>✅ Additionally:</strong> Use for text selection</li>
  <li><strong>⚠️ Avoid:</strong> Setting beyond text — may be error</li>
</ul>
<p><strong>Important:</strong> <code>getCaretPosition()</code> — get position. Use for user convenience.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Cursor will be at the specified position. On focus, cursor will appear in the right place.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (42, 'en', 'Text Field Master: set cursor position',
        'Set cursor position 0 via setCaretPosition(0)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (43, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Select All Text</h2>
<p class="intro">Selecting all text speeds up editing. You can quickly replace all text without deleting it manually. Without selection, you''ll have to delete text manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>selectAll()</code> method — selecting all text</li>
  <li>Improving user experience</li>
  <li>Fast editing</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Selecting all text speeds up editing and improves user experience. This is especially useful when replacing all field content.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Select all text: <code>textField.selectAll();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>selectAll()</code> for selection</li>
  <li><strong>✅ Excellent:</strong> Use on focus, for fast editing</li>
  <li><strong>✅ Additionally:</strong> Combine with <code>requestFocus()</code></li>
  <li><strong>⚠️ Avoid:</strong> Selecting without necessity</li>
</ul>
<p><strong>Important:</strong> <code>select(int, int)</code> — select range. Use to improve user experience.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>All text will be selected. You can quickly replace text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (43, 'en', 'Text Field Master: select all text', 'Select all text via selectAll()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (44, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Replace Selected Text</h2>
<p class="intro">Replacing selection speeds up editing. You can replace selected text with new, without deleting it manually. Without replacement, you''ll have to delete and enter text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>replaceSelection()</code> method — replacing selection</li>
  <li>Replacing selected text</li>
  <li>Improving editing</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Replacing selection speeds up editing and improves user experience. This is especially useful when replacing part of text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Select text: <code>textField.select(0, 5);</code></li>
  <li>Replace selection: <code>textField.replaceSelection("New text");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>replaceSelection()</code> for replacement</li>
  <li><strong>✅ Excellent:</strong> Use <code>select()</code> for selection, combine with <code>selectAll()</code></li>
  <li><strong>⚠️ Avoid:</strong> Replacing without selection</li>
</ul>
<p><strong>Important:</strong> Use for fast editing and improving user experience.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Selected text will be replaced. You can quickly replace text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (44, 'en', 'Text Field Master: replace selection',
        'Select text via select(0, 5), replace via replaceSelection("New text")')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (45, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Document Filter</h2>
<p class="intro">Document filter allows validating input. You can restrict input, check format, improve security. Without filter, you can enter anything.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>DocumentFilter</code> class — document filter</li>
  <li>The <code>setDocumentFilter()</code> method — setting filter</li>
  <li>Creating validated field</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Document filter improves security and data quality. You can restrict input to only allowed characters or formats.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get document: <code>AbstractDocument doc = (AbstractDocument) textField.getDocument();</code></li>
  <li>Create filter: <code>doc.setDocumentFilter(new DocumentFilter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (string.matches("[0-9]+")) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;super.insertString(fb, offset, string, attr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> DocumentFilter for validation</li>
  <li><strong>✅ Excellent:</strong> Override <code>insertString()</code> for insert, <code>replace()</code> for replace</li>
  <li><strong>✅ Additionally:</strong> Use regular expressions</li>
  <li><strong>⚠️ Avoid:</strong> Too strict filters — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> <code>remove()</code> — for deletion. Use for input validation.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Input will be validated. You can enter only allowed characters.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (45, 'en', 'Text Field Master: add document filter',
        'Get document, create DocumentFilter, override insertString() to check digits')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (46, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Cursor Position (continued)</h2>
<p class="intro">Cursor position is important for editing. You can set cursor to the right place, improve user experience. Without management, position will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setCaretPosition()</code> method — setting cursor position</li>
  <li>The <code>getCaretPosition()</code> method — getting position</li>
  <li>Managing cursor position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing cursor position improves user experience and editing convenience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set position: <code>textField.setCaretPosition(5);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setCaretPosition()</code> for setting, <code>getCaretPosition()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Use to improve UX and editing</li>
  <li><strong>⚠️ Avoid:</strong> Setting non-existent position</li>
</ul>
<p><strong>Important:</strong> Check boundaries before setting position. Use to improve editing.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Cursor will be set to the specified position. You can manage cursor position.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (46, 'en', 'Text Field Master: set cursor position',
        'Set cursor position 5 via setCaretPosition()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (47, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Select All Text (continued)</h2>
<p class="intro">Selecting all text speeds up editing. You can quickly select all text, replace it, improve performance. Without selection, you need to select manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>selectAll()</code> method — selecting all text</li>
  <li>Improving user experience</li>
  <li>Fast editing</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Selecting all text speeds up editing and improves field performance.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Select all text: <code>textField.selectAll();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>selectAll()</code> for selection</li>
  <li><strong>✅ Excellent:</strong> Use for fast editing, combine with <code>setText()</code></li>
  <li><strong>⚠️ Avoid:</strong> Selecting without necessity</li>
</ul>
<p><strong>Important:</strong> Use on focus to improve performance.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>All text will be selected. You can quickly replace text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (47, 'en', 'Text Field Master: select all text', 'Select all text via selectAll()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (48, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Horizontal Alignment</h2>
<p class="intro">Alignment determines text position. You can align text to left edge, center, right edge, improve readability. Without alignment, text will be on left edge.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setHorizontalAlignment()</code> method — setting alignment</li>
  <li>Constants <code>JTextField.LEFT</code>, <code>JTextField.CENTER</code>, <code>JTextField.RIGHT</code></li>
  <li>Managing text position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Alignment improves readability and visual organization of text in field.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set alignment: <code>textField.setHorizontalAlignment(JTextField.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setHorizontalAlignment()</code> for setting</li>
  <li><strong>✅ Constants:</strong> LEFT (left edge), CENTER (center), RIGHT (right edge)</li>
  <li><strong>⚠️ Avoid:</strong> Using inappropriate alignment</li>
</ul>
<p><strong>Important:</strong> Use to improve text readability in field.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be aligned to the specified edge. You can improve readability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (48, 'en', 'Text Field Master: set horizontal alignment',
        'Set alignment CENTER via setHorizontalAlignment()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
