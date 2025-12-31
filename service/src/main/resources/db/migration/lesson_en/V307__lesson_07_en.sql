-- Flyway migration V3: Lesson 7
-- This migration contains lesson, tasks, and documentation for lesson 7

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (62, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Checkbox</h2>
<p class="intro">Checkboxes (<code>JCheckBox</code>) allow the user to select options. "Save password", "Notifications", "Auto-start" — all of this is implemented through checkboxes. You can enable or disable an option with one click.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JCheckBox</code> class — checkbox for selecting options</li>
  <li>Creating a checkbox</li>
  <li>Basic use of checkboxes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Checkboxes allow the user to select options. Without them, the user cannot configure the application.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a checkbox: <code>JCheckBox checkBox = new JCheckBox("Enable option");</code></li>
  <li>Add to the form: <code>add(checkBox);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with text: <code>new JCheckBox("Text")</code></li>
  <li><strong>✅ Excellent:</strong> Clear text explaining the option</li>
  <li><strong>⚠️ Avoid:</strong> Empty checkbox without text — unclear what it does</li>
</ul>
<p><strong>Important:</strong> Checkbox can be checked (enabled) or unchecked (disabled). Check state: <code>checkBox.isSelected()</code>. Set state: <code>checkBox.setSelected(true)</code>. Use clear texts. You can use an icon together with text.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A checkbox with text will appear on the form. This is a square with a checkmark (if checked) or empty (if unchecked). The user can click to enable or disable the option.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (62, 'en', 'Beginner Checkbox: create a switch', 'Create a checkbox with text "Enable" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (63, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Checkbox State</h2>
<p class="intro">Programmatic state management allows setting default values. If an option should be enabled on startup, you can check the checkbox programmatically. This improves user experience.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSelected(boolean selected)</code> method — setting state</li>
  <li>The <code>isSelected()</code> method — checking state</li>
  <li>Managing checkbox state</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>State management allows setting default values and improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a checkbox: <code>JCheckBox checkBox = new JCheckBox("Enable");</code></li>
  <li>Check the checkbox: <code>checkBox.setSelected(true);</code></li>
  <li>Add to the form: <code>add(checkBox);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setSelected(true)</code> for default enabling</li>
  <li><strong>✅ Excellent:</strong> Check state before action: <code>if (checkBox.isSelected())</code></li>
  <li><strong>⚠️ Avoid:</strong> Checking all checkboxes — user won''t understand what can be changed</li>
</ul>
<p><strong>Important:</strong> <code>setSelected(false)</code> — uncheck. <code>isSelected()</code> — will return <code>true</code> if checked. Use for setting default values. You can toggle state: <code>checkBox.setSelected(!checkBox.isSelected())</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The checkbox will be checked. A checkmark will appear in the square. The user can uncheck it with a click.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (63, 'en', 'Checkbox State: check or uncheck', 'Create a checkbox, check it and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (64, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Password Display Character</h2>
<p class="intro">Custom display character makes the interface unique. You can use dots, squares, any character. Without setting, there will be a standard asterisk.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setEchoChar()</code> method — setting display character</li>
  <li>Configuring visual password display</li>
  <li>Creating custom character</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Customizing the display character allows creating a unique interface style and improving visual perception.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set character: <code>passwordField.setEchoChar(''●'');</code></li>
  <li>Add to the form: <code>add(passwordField);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Visible characters: ●, •, *</li>
  <li><strong>✅ Excellent:</strong> Character should be clear</li>
</ul>
<p><strong>Important:</strong> Character should be visible. You can use any Unicode character.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Instead of the standard character, the specified one will be used. This is customization of the display character.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (64, 'en', 'Password Field Master: change display character', 'Set display character ● via setEchoChar()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (65, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Password Strength Check</h2>
<p class="intro">Strength check improves security. You can evaluate how strong a password is and warn the user. Without checking, the user may use a weak password.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Checking password length</li>
  <li>Checking for different character types</li>
  <li>Evaluating password strength</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Password strength check improves application security and helps the user create a stronger password.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get password: <code>char[] password = passwordField.getPassword();</code></li>
  <li>Check length: <code>JLabel label = new JLabel();<br>
if (password.length &lt; 8) {<br>
&nbsp;&nbsp;label.setText("Weak password!");<br>
}<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Password length check</li>
  <li><strong>✅ Excellent:</strong> Check for digits, letters, special characters, show visual indication</li>
  <li><strong>⚠️ Avoid:</strong> Too strict requirements — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Check length (minimum 8 characters). Check character diversity. Show clear messages. Use regular expressions.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can check password strength. When entering, you can evaluate password strength and warn the user.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (65, 'en', 'Password Field Master: check password strength',
        'Get password via getPassword(), check length less than 8, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (66, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Preventing Password Copying</h2>
<p class="intro">Preventing copying improves security. Password cannot be copied, which protects against leakage. Without prevention, password can be copied.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Disabling copying via DocumentFilter</li>
  <li>Protecting password from copying</li>
  <li>Improving security</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Preventing copying protects password from leakage and improves overall application security.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get document: <code>AbstractDocument doc = (AbstractDocument) passwordField.getDocument();</code></li>
  <li>Set filter: <code>doc.setDocumentFilter(new DocumentFilter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void remove(FilterBypass fb, int offset, int length) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;// Prevent deletion<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> DocumentFilter for prevention</li>
  <li><strong>✅ Excellent:</strong> Prevent copying, cutting, improve security</li>
  <li><strong>⚠️ Avoid:</strong> Too strict restrictions — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Use for security and improving password protection.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Copying will be prevented. Password cannot be copied.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (66, 'en', 'Password Field Master: prevent copying',
        'Get document, create DocumentFilter, override remove() to prevent deletion')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (67, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Changing Display Character</h2>
<p class="intro">Display character determines how password is shown. You can change character from * to another, create custom display. Without change, there will be a standard character.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setEchoChar()</code> method — setting character</li>
  <li>Changing display character</li>
  <li>Creating custom display</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Customizing the display character allows creating a unique interface style.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Change character: <code>passwordField.setEchoChar(''●'');</code></li>
  <li>Add to the form: <code>add(passwordField);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Visible characters</li>
  <li><strong>✅ Excellent:</strong> Customize display</li>
</ul>
<p><strong>Important:</strong> Use visible characters to improve visual appearance.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Display character will be changed. This is character customization.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (67, 'en', 'Password Field Master: change display character', 'Change display character to ● via setEchoChar()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (68, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Showing Password</h2>
<p class="intro">Showing password improves user experience. You can temporarily show password for verification, improve convenience. Without showing, you cannot verify password.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getEchoChar()</code> method — getting character</li>
  <li>Temporary password display</li>
  <li>Creating show/hide function</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Temporary password display allows the user to verify the entered password, improving usability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get character: <code>char echoChar = passwordField.getEchoChar();</code></li>
  <li>Temporarily show password: <code>passwordField.setEchoChar((char) 0);</code></li>
  <li>Hide back: <code>passwordField.setEchoChar(echoChar);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getEchoChar()</code> for getting, <code>setEchoChar(0)</code> for showing</li>
  <li><strong>✅ Excellent:</strong> Restore character, use for toggling</li>
  <li><strong>⚠️ Avoid:</strong> Showing constantly — not secure</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Password will be temporarily shown. You can verify password, then hide it back.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (68, 'en', 'Password Field Master: show password',
        'Get character via getEchoChar(), set 0 via setEchoChar() to show, then restore character')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (69, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Password Strength Check</h2>
<p class="intro">Password strength check improves security. You can check length, complexity, improve protection. Without checking, password may be weak.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getPassword()</code> method — getting password</li>
  <li>Checking password strength</li>
  <li>Improving security</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Password strength check helps the user create a stronger password and improves overall application security.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get password: <code>char[] password = passwordField.getPassword();</code></li>
  <li>Check strength: <code>boolean isStrong = password.length >= 8 && new String(password).matches(".*[A-Z].*") && new String(password).matches(".*[0-9].*");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getPassword()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Check length, complexity, improve security</li>
  <li><strong>⚠️ Avoid:</strong> Storing password in String — use char[]</li>
</ul>
<p><strong>Important:</strong> Check length (minimum 8). Check for uppercase, digits. Don''t store in String for security.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can check password strength. You can validate password and improve security.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (69, 'en', 'Password Field Master: check password strength',
        'Get password via getPassword(), check length >= 8 and presence of uppercase letters')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (70, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Copying Password</h2>
<p class="intro">Copying password improves functionality. You can copy password to clipboard, improve user experience. Without copying, you need to enter manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getPassword()</code> method — getting password</li>
  <li>Copying password to clipboard</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Copying password to clipboard improves user experience and allows using password in other places.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get password: <code>char[] password = passwordField.getPassword();</code></li>
  <li>Copy to clipboard: <code>StringSelection selection = new StringSelection(new String(password));<br>
Toolkit.getDefaultToolkit().getSystemClipboard().setContents(selection, null);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getPassword()</code> for getting, Clipboard for copying</li>
  <li><strong>✅ Excellent:</strong> Use to improve UX and functionality</li>
  <li><strong>⚠️ Consider:</strong> Request permission before copying</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Password will be copied to clipboard. You can use it in other places.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (70, 'en', 'Password Field Master: copy password',
        'Get password via getPassword(), create StringSelection, set to Clipboard via setContents()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (71, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Setting Display Character</h2>
<p class="intro">Display character determines masking. You can set a custom character instead of standard, improve visual appearance. Without setting, character will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setEchoChar()</code> method — setting display character</li>
  <li>Customizing masking character</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Customizing the display character allows creating a unique interface style and improving visual perception.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set character: <code>passwordField.setEchoChar(''*'');</code></li>
  <li>Add to the form: <code>add(passwordField);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Standard characters: *, ●</li>
  <li><strong>✅ Excellent:</strong> Customize display</li>
</ul>
<p><strong>Important:</strong> Use visible characters to improve visual appearance.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Display character will be set. This is character customization.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (71, 'en', 'Password Field Master: set display character', 'Set character * via setEchoChar()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
