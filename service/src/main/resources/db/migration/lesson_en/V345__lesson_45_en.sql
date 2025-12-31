-- Flyway migration V3: Lesson 45
-- This migration contains lesson, tasks, and documentation for lesson 45

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (397, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating HTML Editor with JEditorPane</h2>
<p class="intro">JEditorPane allows displaying formatted text. HTML, RTF, plain text — all of this can be shown in one component. Without it, you''ll have to use regular JTextArea without formatting.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JEditorPane</code> — formatted text editor</li>
  <li>Method <code>setContentType()</code> — setting content type</li>
  <li>Displaying HTML and RTF</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>JEditorPane is necessary for displaying formatted text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create editor: <code>JEditorPane editor = new JEditorPane();</code></li>
  <li>Set content type: <code>editor.setContentType("text/html");</code></li>
  <li>Set text: <code>editor.setText("&lt;html&gt;&lt;h1&gt;Hello!&lt;/h1&gt;&lt;/html&gt;");</code></li>
  <li>Add to form: <code>add(editor);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Set content type before setting text</li>
  <li><strong>✅ Great:</strong> Use "text/html" for HTML, use "text/rtf" for RTF, use "text/plain" for plain text</li>
  <li><strong>⚠️ Avoid:</strong> Not setting type — may not work</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Editor with formatted text will appear. HTML will be displayed with formatting. You can edit text directly in editor.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (397, 'en', 'JEditorPane Beginner: Create HTML Editor',
        'Create JEditorPane, set type "text/html", set HTML text and add to form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (398, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Loading HTML from URL in JEditorPane</h2>
<p class="intro">Loading HTML from URL allows displaying web content. Help, documentation, news — all of this can be loaded from internet. Without this, you''ll have to store all content locally.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPage()</code> — loading page from URL</li>
  <li>Class <code>URL</code> — resource address</li>
  <li>Handling load errors</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Loading HTML from URL is necessary for displaying web content.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set content type: <code>editor.setContentType("text/html");</code></li>
  <li>Load page: <code>try {<br>
&nbsp;&nbsp;editor.setPage(new URL("https://example.com"));<br>
} catch (IOException e) {<br>
&nbsp;&nbsp;label.setText("Load error: " + e.getMessage());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Handle IOException when loading</li>
  <li><strong>✅ Great:</strong> Show loading indicator, use <code>setPage()</code> for loading</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring errors — user won''t know about problem</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>HTML will be loaded from URL and displayed. Web page will appear in editor. You can view content from internet.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (398, 'en', 'JEditorPane Master: Load HTML from URL',
        'Set type "text/html", load page from URL via setPage(), handle IOException')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (399, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Hyperlinks in JEditorPane</h2>
<p class="intro">Handling hyperlinks makes editor interactive. You can navigate links, open new pages, perform actions. Without this, links will be inactive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>HyperlinkListener</code> — link handling</li>
  <li>Handling clicks on hyperlinks</li>
  <li>Navigating links</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling hyperlinks is necessary for creating interactive editor.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>editor.addHyperlinkListener(e -> {<br>
&nbsp;&nbsp;if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;try {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;editor.setPage(e.getURL());<br>
&nbsp;&nbsp;&nbsp;&nbsp;} catch (IOException ex) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ex.printStackTrace();<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check ACTIVATED event type</li>
  <li><strong>✅ Great:</strong> Use <code>getURL()</code> to get link, load new page via <code>setPage()</code>, handle IOException when loading</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring errors — user won''t know about problem</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Hyperlinks will become clickable. When clicking link, new page will load. You can navigate links.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (399, 'en', 'JEditorPane Master: Handle Hyperlinks',
        'Add HyperlinkListener, check ACTIVATED, get URL via getURL(), load page via setPage()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (400, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Setting Content Type in JEditorPane</h2>
<p class="intro">Content type determines format. You can display HTML, plain text, RTF. Without type, content will be interpreted incorrectly.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setContentType()</code> — setting type</li>
  <li>Content types (text/html, text/plain)</li>
  <li>Creating formatted content</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Content type is necessary for correct content interpretation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set type: <code>editor.setContentType("text/html");</code></li>
  <li>Set text: <code>editor.setText("&lt;html&gt;&lt;b&gt;Text&lt;/b&gt;&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setContentType()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use "text/html" for HTML, use "text/plain" for text, use "text/rtf" for RTF</li>
  <li><strong>⚠️ Avoid:</strong> Wrong type — may be error</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Content will be formatted according to type. HTML will be displayed as HTML.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (400, 'en', 'JEditorPane Master: Set Content Type',
        'Set type "text/html" via setContentType(), set HTML text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (401, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Handling Hyperlinks in JEditorPane</h2>
<p class="intro">Handling hyperlinks makes content interactive. You can handle link click, open URL, perform action. Without handling, links won''t work.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>HyperlinkListener</code> — link handler</li>
  <li>Handling clicks on links</li>
  <li>Creating interactive content</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling hyperlinks is necessary for creating interactive content.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>editor.addHyperlinkListener(e -> {<br>
&nbsp;&nbsp;if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Link: " + e.getURL());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addHyperlinkListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Check EventType.ACTIVATED for click, use <code>getURL()</code> to get URL, open URL or perform action</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring links</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking link, handler will fire. You can handle click and open URL.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (401, 'en', 'JEditorPane Master: Handle Hyperlinks',
        'Add HyperlinkListener, check EventType.ACTIVATED, get URL via getURL()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (403, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Removing Listener in ActionListener</h2>
<p class="intro">Removing listener allows managing events. You can temporarily disable handling, improve logic. Without removal, listener will always work.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>removeActionListener()</code> — removing listener</li>
  <li>Dynamic listener management</li>
  <li>Improving event management</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Removing listener is necessary for dynamic event management.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Save listener: <code>JLabel label = new JLabel();<br>
ActionListener listener = e -> label.setText("Action");<br>
add(label);</code></li>
  <li>Add listener: <code>button.addActionListener(listener);</code></li>
  <li>Remove listener: <code>button.removeActionListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>removeActionListener()</code> for removal</li>
  <li><strong>✅ Great:</strong> Save reference to listener, use for dynamic management, improve logic</li>
  <li><strong>⚠️ Avoid:</strong> Removing without saving reference</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Listener will be removed. Event handling will stop.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (403, 'en', 'ActionListener Master: Remove Listener',
        'Create ActionListener, add via addActionListener(), remove via removeActionListener()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (402, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Setting Text in JEditorPane</h2>
<p class="intro">Text creates content. You can set HTML or plain text, create informative content. Without text, component will be empty.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setText()</code> — setting text</li>
  <li>Creating text content</li>
  <li>Improving display</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Setting text is necessary for creating content in component.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set text: <code>editor.setText("&lt;html&gt;&lt;h1&gt;Title&lt;/h1&gt;&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setText()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use HTML for formatting, use plain text, adapt to content type</li>
  <li><strong>⚠️ Avoid:</strong> HTML without correct format</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text will appear in component. Text will be formatted according to content type.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (402, 'en', 'JEditorPane Master: Set Text', 'Set HTML text via setText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (404, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Adding Multiple Listeners in ActionListener</h2>
<p class="intro">Multiple listeners allow handling event in multiple ways. You can add several handlers, improve functionality. Without multiple listeners, only one handler.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Multiple listeners</li>
  <li>Adding several handlers</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Multiple listeners are necessary for handling event in multiple ways.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add first listener: <code>JLabel label = new JLabel();<br>
button.addActionListener(e -> label.setText("First"));<br>
add(label);</code></li>
  <li>Add second listener: <code>button.addActionListener(e -> label.setText("Second"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addActionListener()</code> multiple times</li>
  <li><strong>✅ Great:</strong> Use for multiple handling, improve functionality, separate logic</li>
  <li><strong>⚠️ Avoid:</strong> Too many listeners</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When action occurs, all listeners will fire. You can handle event in multiple ways.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (404, 'en', 'ActionListener Master: Add Multiple Listeners',
        'Add two ActionListener via addActionListener(), each outputs its text')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (405, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Getting Action Command in ActionListener</h2>
<p class="intro">Action command allows identifying source. You can determine which component triggered event, without checking source. Without command, you''ll have to check source.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getActionCommand()</code> — getting command</li>
  <li>Identifying event source</li>
  <li>Improving event handling</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Action command is necessary for identifying event source.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get command: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;label.setText("Command: " + cmd);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getActionCommand()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for identification, use clear commands, improve handling</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring command</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get action command. You can identify source.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (405, 'en', 'ActionListener Master: Get Action Command',
        'Add ActionListener, get command via getActionCommand() in actionPerformed()')
ON CONFLICT (task_id, language_code) DO NOTHING;
