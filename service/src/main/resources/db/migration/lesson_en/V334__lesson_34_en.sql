-- Flyway migration V3: Lesson 34
-- This migration contains lesson, tasks, and documentation for lesson 34

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

-- Task 1: Message Dialog
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (287, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Showing Message to User</h2>
<p class="intro">Dialog windows inform user. Error, warning, information — all of this requires dialog. Without dialogs, user won''t know about important events.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JOptionPane</code> — dialog windows</li>
  <li>Method <code>showMessageDialog()</code> — show message</li>
  <li>Message types: INFORMATION, WARNING, ERROR, QUESTION, PLAIN</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Dialog windows are necessary for informing user about important events and application states.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show information message: <code>JOptionPane.showMessageDialog(null, "Hello, world!", "Title", JOptionPane.INFORMATION_MESSAGE);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>INFORMATION_MESSAGE</code> for information</li>
  <li><strong>✅ Great:</strong> Use <code>WARNING_MESSAGE</code> for warnings, use <code>ERROR_MESSAGE</code> for errors, use <code>QUESTION_MESSAGE</code> for questions, specify parent component instead of <code>null</code></li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dialog window with message will appear. Window will be modal — you need to close it before continuing work.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (287, 'en', 'Dialog Beginner: Show Message',
        'Show information dialog window with text "Hello, world!" and title "Greeting"')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 2: Confirmation Dialog
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (288, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Requesting Confirmation</h2>
<p class="intro">Confirmation dialogs protect from errors. Delete file, exit program, save changes — all of this requires confirmation. Without confirmation, user may accidentally perform irreversible action.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showConfirmDialog()</code> — confirmation dialog</li>
  <li>Option types: YES_NO_OPTION, YES_NO_CANCEL_OPTION, OK_CANCEL_OPTION</li>
  <li>Results: YES_OPTION, NO_OPTION, CANCEL_OPTION, CLOSED_OPTION</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Confirmation dialogs are necessary for preventing accidental irreversible actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show confirmation dialog: <code>int result = JOptionPane.showConfirmDialog(null, "Are you sure?", "Confirmation", JOptionPane.YES_NO_OPTION);</code></li>
  <li>Check result: <code>if (result == JOptionPane.YES_OPTION) {<br>
&nbsp;&nbsp;label.setText("User chose Yes");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>YES_NO_OPTION</code> for simple choice</li>
  <li><strong>✅ Great:</strong> Use <code>YES_NO_CANCEL_OPTION</code> for three options, use <code>OK_CANCEL_OPTION</code> for action confirmation, check result before executing action</li>
</ul>
<p><strong>Important:</strong> Always check result before executing action. Use clear question texts.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dialog with "Yes" and "No" buttons will appear. You can choose option, and result will be returned.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (288, 'en', 'Dialog Master: Ask Confirmation',
        'Show confirmation dialog with question "Are you sure?" and check if user chose "Yes"')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 3: Input Dialog
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (289, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Getting Input from User</h2>
<p class="intro">Input dialogs get data from user. Name, password, settings — all of this requires input. Without input dialog, you need to create separate windows.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showInputDialog()</code> — input dialog</li>
  <li>Getting text from user</li>
  <li>Handling cancellation (returns <code>null</code>)</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Input dialogs are necessary for getting data from user without creating separate windows.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show input dialog: <code>String name = JOptionPane.showInputDialog(null, "Enter your name:", "Input", JOptionPane.QUESTION_MESSAGE);</code></li>
  <li>Check result: <code>if (name != null && !name.isEmpty()) {<br>
&nbsp;&nbsp;label.setText("Hello, " + name + "!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check for <code>null</code> (user pressed Cancel)</li>
  <li><strong>✅ Great:</strong> Check for empty string (user entered nothing), use initial value, use dropdown list instead of text field</li>
</ul>
<p><strong>Important:</strong> Always check for <code>null</code> and empty string.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dialog with text field will appear. You can enter text and press OK. Entered text will be returned.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (289, 'en', 'Dialog Master: Get Input from User',
        'Show input dialog with question "Enter your name:" and output result to console')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 4: Option Dialog
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (290, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Creating Dialog with Custom Buttons</h2>
<p class="intro">Custom options give more control. You can create your own answer options, use icons, configure appearance. Without custom options, limited to standard buttons.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showOptionDialog()</code> — dialog with custom options</li>
  <li>Array of options for buttons</li>
  <li>Index of selected option</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom options are necessary for creating dialogs with non-standard answer options.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create array of options: <code>String[] options = {"Save", "Cancel", "Don''t save"};</code></li>
  <li>Show dialog: <code>int choice = JOptionPane.showOptionDialog(null, "What to do?", "Choice", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[0]);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear option names</li>
  <li><strong>✅ Great:</strong> Specify default option (last parameter), use icons for options, check index of selected option</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A dialog with custom buttons will appear. You can choose one of options. Index of selected option will be returned.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (290, 'en', 'Dialog Master: Create Custom Buttons',
        'Create dialog with three options: "Save", "Cancel", "Don''t save" and output index of selected option')
ON CONFLICT (task_id, language_code) DO NOTHING;
