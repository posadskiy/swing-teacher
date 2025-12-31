-- Flyway migration V3: Lesson 6
-- This migration contains lesson, tasks, and documentation for lesson 6

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (51, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Password Field</h2>
<p class="intro">Password fields (<code>JPasswordField</code>) protect confidential information. Passwords should not be visible on screen — this is the basis of security. Text is hidden with asterisks so no one can peek.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JPasswordField</code> class — field for password input</li>
  <li>Creating a protected input field</li>
  <li>Automatic hiding of entered text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Password fields protect confidential information. Without password fields, anyone can peek at the entered password.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a password field: <code>JPasswordField passwordField = new JPasswordField();</code></li>
  <li>Add to the form: <code>add(passwordField);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with size: <code>new JPasswordField(20)</code></li>
  <li><strong>✅ Excellent:</strong> Use clear name: <code>passwordField</code></li>
  <li><strong>⚠️ Acceptable:</strong> <code>add(new JPasswordField());</code> — can''t configure later</li>
</ul>
<p><strong>Important:</strong> Password field automatically hides entered text with asterisks. By default, * symbol is used for masking. You can change the masking character with <code>setEchoChar()</code> method. Get password: <code>char[] password = passwordField.getPassword();</code>. Use only for passwords, not for regular text.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A password field will appear on the form. When entering text, asterisks will appear instead of letters. This protects the password from prying eyes.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (51, 'en', 'Beginner Password Field: create a protected field', 'Create a password field and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (52, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Echo Character</h2>
<p class="intro">Different echo characters can be used for different interface styles. Some applications use ● or • instead of *. This makes the interface unique.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setEchoChar(char c)</code> method — setting echo character</li>
  <li>Changing the character displayed instead of password</li>
  <li>Customizing password field appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Customizing the echo character allows creating a unique interface style and improving visual perception.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a password field: <code>JPasswordField passwordField = new JPasswordField();</code></li>
  <li>Set echo character: <code>passwordField.setEchoChar(''●'');</code></li>
  <li>Add to the form: <code>add(passwordField);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Visible characters: ●, •, *</li>
  <li><strong>✅ Excellent:</strong> Character should be clear and visible</li>
  <li><strong>⚠️ Avoid:</strong> Invisible characters — user won''t understand what they''re entering</li>
</ul>
<p><strong>Important:</strong> You can use any Unicode character. Standard characters: *, ●, •.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Instead of asterisks, the specified character will be used. If you set ●, it will be displayed when entering.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (52, 'en', 'Echo Character: change asterisk to another character',
        'Create a password field, set echo character ● and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (53, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Line Wrapping in Text Area</h2>
<p class="intro">Line wrapping makes text readable. Long lines won''t go beyond the area boundaries, text will automatically wrap. Without this, horizontal scrolling will appear.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setLineWrap()</code> method — enabling line wrapping</li>
  <li>The <code>setWrapStyleWord()</code> method — word wrapping</li>
  <li>Configuring text wrapping</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Line wrapping improves text readability and eliminates the need for horizontal scrolling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable wrapping: <code>textArea.setLineWrap(true);</code></li>
  <li>Enable word wrapping: <code>textArea.setWrapStyleWord(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setLineWrap(true)</code> for wrapping</li>
  <li><strong>✅ Excellent:</strong> <code>setWrapStyleWord(true)</code> for word wrapping, combine both methods</li>
  <li><strong>⚠️ Avoid:</strong> Character wrapping — words will break</li>
</ul>
<p><strong>Important:</strong> Word wrapping reads better. Character wrapping may break words. Use together for better result.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Long lines will automatically wrap. Text will wrap by words, not going beyond boundaries.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (53, 'en', 'Text Area Master: enable line wrapping',
        'Set setLineWrap(true) and setWrapStyleWord(true) for text area')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (54, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Tab Size</h2>
<p class="intro">Tab size makes text structured. Code, lists, structured data — all of this requires tabs. Without setting, tab will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setTabSize()</code> method — setting tab size</li>
  <li>Configuring indentation in text</li>
  <li>Creating structured text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper tab size improves text structure, especially for code and lists.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tab size: <code>textArea.setTabSize(4);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setTabSize()</code> for configuration</li>
  <li><strong>✅ Sizes:</strong> 4 for code (Java standard), 2 for compact code, 8 for old standards</li>
  <li><strong>⚠️ Avoid:</strong> Too large size — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Size is specified in spaces. 4 — standard for Java.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tab will be of the needed size. When pressing Tab, the needed number of spaces will be inserted.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (54, 'en', 'Text Area Master: configure tab size',
        'Set tab size 4 via setTabSize(4)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (55, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Line Wrapping (continued)</h2>
<p class="intro">Line wrapping makes text readable. Long lines will wrap automatically, text will be fully visible. Without wrapping, text will go beyond boundaries.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setLineWrap()</code> method — enabling wrapping</li>
  <li>The <code>setWrapStyleWord()</code> method — word wrapping</li>
  <li>Creating readable text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Line wrapping improves readability and allows seeing all text without horizontal scrolling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable wrapping: <code>textArea.setLineWrap(true);</code></li>
  <li>Enable word wrapping: <code>textArea.setWrapStyleWord(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setLineWrap(true)</code> for wrapping, <code>setWrapStyleWord(true)</code> for word wrapping</li>
  <li><strong>✅ Combine:</strong> Both methods together</li>
  <li><strong>⚠️ Avoid:</strong> Character wrapping — may be unreadable</li>
</ul>
<p><strong>Important:</strong> Use for long text. Word wrapping reads better.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will wrap automatically. Long lines will wrap to a new line.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (55, 'en', 'Text Area Master: enable line wrapping',
        'Enable wrapping via setLineWrap(true), enable word wrapping via setWrapStyleWord(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (56, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Appending Text</h2>
<p class="intro">Appending text allows accumulating content. You can append text to the end, create a log, accumulate information. Without appending, you''ll have to replace all text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>append()</code> method — appending text</li>
  <li>Appending text to the end</li>
  <li>Creating accumulative text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Appending text to the end is useful for creating logs, accumulating information, and building text gradually.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Append text: <code>textArea.append("New line\n");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>append()</code> for appending to the end</li>
  <li><strong>✅ Excellent:</strong> Use for logs, use \n for line break</li>
  <li><strong>⚠️ Avoid:</strong> Appending too frequently — may be slow</li>
</ul>
<p><strong>Important:</strong> Use for accumulating text. Don''t append too frequently for better performance.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be appended to the end. You can accumulate text gradually.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (56, 'en', 'Text Area Master: append text', 'Append text "New line\n" via append()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (57, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Inserting Text</h2>
<p class="intro">Inserting text allows editing content. You can insert text at a specified position without replacing all text. Without insertion, you''ll have to replace all text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>insert()</code> method — inserting text</li>
  <li>Inserting text at specified position</li>
  <li>Creating editable content</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Inserting text at a specific position allows precise content editing without replacing all text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Insert text: <code>textArea.insert("Inserted text", 0);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>insert()</code> for inserting at specified position</li>
  <li><strong>✅ Excellent:</strong> Use for editing, combine with <code>append()</code></li>
  <li><strong>⚠️ Avoid:</strong> Inserting at non-existent position</li>
</ul>
<p><strong>Important:</strong> Specify correct position. Use to improve user experience.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be inserted at the specified position. You can edit content precisely.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (57, 'en', 'Text Area Master: insert text',
        'Insert text "Inserted text" at position 0 via insert()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (58, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Replacing Text Range</h2>
<p class="intro">Replacing range speeds up editing. You can replace text in a specified range without deleting and inserting manually. Without replacement, you''ll have to delete and insert text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>replaceRange()</code> method — replacing range</li>
  <li>Replacing text in specified range</li>
  <li>Improving editing</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Replacing range speeds up editing and improves user experience when working with text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Replace range: <code>textArea.replaceRange("New text", 0, 5);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>replaceRange()</code> for replacement</li>
  <li><strong>✅ Excellent:</strong> Specify correct range, use for fast editing, combine with <code>select()</code></li>
  <li><strong>⚠️ Avoid:</strong> Replacing non-existent range</li>
</ul>
<p><strong>Important:</strong> Use to improve user experience.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text in the specified range will be replaced. You can quickly replace text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (58, 'en', 'Text Area Master: replace text',
        'Replace range 0-5 via replaceRange("New text", 0, 5)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (59, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Line Count</h2>
<p class="intro">Line count is important for analysis. You can find out how many lines are in the text, improve functionality. Without counting, you can''t know the number of lines.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getLineCount()</code> method — getting line count</li>
  <li>Counting lines in text</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Counting lines is useful for text analysis, validation, and improving application functionality.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get line count: <code>int lines = textArea.getLineCount();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getLineCount()</code> for getting line count</li>
  <li><strong>✅ Excellent:</strong> Use for analysis, validation, improving functionality</li>
  <li><strong>⚠️ Consider:</strong> Empty lines are also counted</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get the number of lines in the text area. Use for analysis and validation.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (59, 'en', 'Text Area Master: get line count', 'Get line count via getLineCount()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (60, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Getting Line Text</h2>
<p class="intro">Line text is important for analysis. You can get text of a specific line, process it, improve functionality. Without getting, you can''t process the line.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getLineStartOffset()</code> method — line start</li>
  <li>The <code>getLineEndOffset()</code> method — line end</li>
  <li>Getting line text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Getting text of a specific line allows processing text line by line and improving application functionality.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get line start: <code>int start = textArea.getLineStartOffset(0);</code></li>
  <li>Get line end: <code>int end = textArea.getLineEndOffset(0);</code></li>
  <li>Get text: <code>String line = textArea.getText(start, end - start);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getLineStartOffset()</code> for start, <code>getLineEndOffset()</code> for end, <code>getText()</code> for getting</li>
  <li><strong>✅ Excellent:</strong> Use to improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Using non-existent line</li>
</ul>
<p><strong>Important:</strong> Check boundaries before getting line text.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get text of a specific line. Use for processing text line by line.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (60, 'en', 'Text Area Master: get line text',
        'Get line 0 start via getLineStartOffset(), end via getLineEndOffset(), get text via getText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (61, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Line Wrapping (conclusion)</h2>
<p class="intro">Line wrapping improves readability. You can automatically wrap long lines, improve display. Without wrapping, lines will go beyond boundaries.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setLineWrap()</code> method — enabling wrapping</li>
  <li>Automatic wrapping of long lines</li>
  <li>Improving readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Line wrapping improves readability and text display, eliminating the need for horizontal scrolling.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable wrapping: <code>textArea.setLineWrap(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setLineWrap(true)</code> for enabling</li>
  <li><strong>✅ Excellent:</strong> Combine with <code>setWrapStyleWord()</code>, use to improve readability</li>
  <li><strong>⚠️ Consider:</strong> Don''t use for code — may break formatting</li>
</ul>
<p><strong>Important:</strong> Use for readability and improving display of regular text.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Long lines will automatically wrap. You can improve text readability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (61, 'en', 'Text Area Master: enable line wrapping', 'Enable wrapping via setLineWrap(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
