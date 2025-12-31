-- Flyway migration V3: Lesson 33
-- This migration contains lesson, tasks, and documentation for lesson 33

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (278, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Advanced Editor</h2>
<p class="intro">JTextPane allows applying styles to text. Bold, italic, color, font size — all of this can be applied to different parts of text. Without it, you cannot create rich text editor.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JTextPane</code> — advanced editor</li>
  <li>Class <code>StyledDocument</code> — styled document</li>
  <li>Applying styles to text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>JTextPane is necessary for creating text editors with formatting support.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create editor: <code>JTextPane textPane = new JTextPane();</code></li>
  <li>Get document: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
  <li>Create style and apply: <code>Style style = textPane.addStyle("bold", null);</code>, <code>StyleConstants.setBold(style, true);</code>, <code>doc.insertString(0, "Bold text", style);</code></li>
  <li>Add to form: <code>add(textPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> StyleConstants to set style properties</li>
  <li><strong>✅ Great:</strong> Apply styles to selected text, combine multiple styles</li>
  <li><strong>⚠️ Avoid:</strong> Too many styles — difficult to manage</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>An editor with style support will appear. You can apply bold, italic, color to text.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (278, 'en', 'JTextPane Beginner: Create Advanced Editor',
        'Create JTextPane, create style "bold", set bold font, insert text with style and add to form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (279, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Selecting and Styling Text</h2>
<p class="intro">Applying styles to selected text makes editor functional. You can select text and make it bold, italic, change color. Without this, you''ll have to apply styles to all text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setCharacterAttributes()</code> — applying styles</li>
  <li>Getting selected text</li>
  <li>Applying styles to selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Applying styles to selected text is necessary for creating functional text editors.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get selection: <code>int start = textPane.getSelectionStart();</code> and <code>int end = textPane.getSelectionEnd();</code></li>
  <li>Create style: <code>Style style = textPane.addStyle("bold", null);</code> and <code>StyleConstants.setBold(style, true);</code></li>
  <li>Apply style: <code>StyledDocument doc = textPane.getStyledDocument();</code> and <code>doc.setCharacterAttributes(start, end - start, style, false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check for selection before applying</li>
  <li><strong>✅ Great:</strong> Use <code>setCharacterAttributes()</code> to apply styles, combine multiple styles</li>
  <li><strong>⚠️ Avoid:</strong> Applying styles without checking selection — may be error</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Selected text will be styled. You can select text and apply bold, italic, color to it.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (279, 'en', 'JTextPane Master: Select and Style Text',
        'Get start and end of selection, create style "bold", apply style to selected text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (280, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Configuring Font</h2>
<p class="intro">Configuring font makes text readable. You can set size, style, font family. Without configuration, standard font will be used.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setFont()</code> — setting font</li>
  <li>Configuring font through styles</li>
  <li>Creating formatted text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring font is necessary for improving readability and visual representation of text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set font: <code>textPane.setFont(new Font("Arial", Font.BOLD, 14));</code></li>
  <li>Or through style: <code>Style style = textPane.addStyle("bold", null);</code>, <code>StyleConstants.setFontFamily(style, "Arial");</code>, <code>StyleConstants.setFontSize(style, 14);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setFont()</code> for all text</li>
  <li><strong>✅ Great:</strong> Use styles for parts of text, combine different fonts, use StyleConstants for configuration</li>
  <li><strong>⚠️ Avoid:</strong> Too many different fonts — may be messy</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be displayed with specified font. You can set size, style, family.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (280, 'en', 'JTextPane Master: Configure Font', 'Set font via setFont() with Arial, BOLD, size 14')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (281, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Inserting String</h2>
<p class="intro">Inserting string allows adding text. You can insert text at needed position, with formatting. Without insertion, you''ll have to replace all text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>insertString()</code> — inserting string</li>
  <li>Inserting text at position</li>
  <li>Creating formatted text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Inserting string is necessary for programmatic addition of text at needed position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get document: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
  <li>Insert string: <code>doc.insertString(0, "Text", null);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>insertString()</code> to insert</li>
  <li><strong>✅ Great:</strong> Use <code>getStyledDocument()</code> to get, use styles for formatting, use position for precise insertion</li>
  <li><strong>⚠️ Avoid:</strong> Inserting beyond bounds — may be error</li>
</ul>
<p><strong>Important:</strong> Check position before insertion. Handle BadLocationException.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be inserted at specified position. You can insert text with formatting.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (281, 'en', 'JTextPane Master: Insert String',
        'Get document via getStyledDocument(), insert string at position 0 via insertString()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (282, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Applying Style</h2>
<p class="intro">Style creates formatting. You can apply bold, italic, color, size to text. Without style, text will be plain.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>Style</code> — text style</li>
  <li>Method <code>setCharacterAttributes()</code> — applying style</li>
  <li>Creating formatted text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Styles are necessary for creating formatted text with various visual effects.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get document: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
  <li>Create style: <code>Style style = doc.addStyle("bold", null);</code> and <code>StyleConstants.setBold(style, true);</code></li>
  <li>Apply style: <code>doc.setCharacterAttributes(0, 5, style, false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addStyle()</code> to create</li>
  <li><strong>✅ Great:</strong> Use StyleConstants for configuration, use <code>setCharacterAttributes()</code> to apply, combine different styles</li>
  <li><strong>⚠️ Avoid:</strong> Too many styles — may be complex</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will be formatted with style. You can apply bold, italic, color.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (282, 'en', 'JTextPane Master: Apply Style',
        'Get document, create style via addStyle(), set bold via StyleConstants.setBold(), apply via setCharacterAttributes()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (283, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Getting Text</h2>
<p class="intro">Getting text allows working with content. You can extract text, process it, save it. Without getting, you cannot work with content.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getText()</code> — getting text</li>
  <li>Extracting text content</li>
  <li>Working with content</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting text is necessary for working with editor content (processing, saving).</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get text: <code>String text = textPane.getText();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getText()</code> to get</li>
  <li><strong>✅ Great:</strong> Use for processing, use for saving, process obtained text</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring obtained text</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get text. You can extract and process content.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (283, 'en', 'JTextPane Master: Get Text', 'Get text via getText(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (284, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Determining Mouse Button</h2>
<p class="intro">Determining button improves functionality. You can handle left, right, middle buttons differently, improve interactivity. Without determination, all buttons are the same.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getButton()</code> — getting button</li>
  <li>Constants <code>MouseEvent.BUTTON1</code>, <code>BUTTON2</code>, <code>BUTTON3</code></li>
  <li>Handling different mouse buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Determining button is necessary for creating interactive interfaces with different reaction to different mouse buttons.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Determine button: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getButton() == MouseEvent.BUTTON1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Left button");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getButton()</code> to get</li>
  <li><strong>✅ Great:</strong> Use BUTTON1, BUTTON2, BUTTON3, handle different buttons, improve interactivity</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring buttons</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can determine which button is pressed. You can handle left, right, middle buttons differently.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (284, 'en', 'MouseListener Master: Determine Mouse Button',
        'Add MouseListener, check getButton() == BUTTON1, output "Left button"')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (285, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Getting Mouse Coordinates</h2>
<p class="intro">Mouse coordinates are important for positioning. You can get click position, handle by coordinates, improve functionality. Without coordinates, you cannot determine position.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getX()</code> — getting X coordinate</li>
  <li>Method <code>getY()</code> — getting Y coordinate</li>
  <li>Getting mouse position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Mouse coordinates are necessary for positioning elements and handling events by position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get coordinates: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int x = e.getX();<br>
&nbsp;&nbsp;&nbsp;&nbsp;int y = e.getY();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Coordinates: " + x + ", " + y);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getX()</code> for X coordinate</li>
  <li><strong>✅ Great:</strong> Use <code>getY()</code> for Y coordinate, use for positioning, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring coordinates</li>
</ul>
<p><strong>Important:</strong> Consider relative coordinates.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get click coordinates. You can handle by position.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (285, 'en', 'MouseListener Master: Get Mouse Coordinates',
        'Add MouseListener, override mouseClicked(), get X and Y via getX(), getY(), output')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (286, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Getting Click Count</h2>
<p class="intro">Click count is important for handling. You can handle single, double click, improve functionality. Without getting, you cannot distinguish clicks.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getClickCount()</code> — getting click count</li>
  <li>Handling single and double clicks</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting click count is necessary for distinguishing single and double clicks.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get count: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int count = e.getClickCount();<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (count == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Double click");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getClickCount()</code> to get</li>
  <li><strong>✅ Great:</strong> Use for handling double clicks, use to improve functionality, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring count</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get click count. You can handle double click.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (286, 'en', 'MouseListener Master: Get Click Count',
        'Add MouseListener, override mouseClicked(), get count via getClickCount(), check for 2')
ON CONFLICT (task_id, language_code) DO NOTHING;
