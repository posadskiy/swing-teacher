-- Flyway migration V3: Lesson 35
-- This migration contains lesson, tasks, and documentation for lesson 35

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (291, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Opening File Selection Dialog</h2>
<p class="intro">JFileChooser — standard way to work with files. Open document, save project, select image — all of this requires file selection. Without it, user won''t be able to work with files.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JFileChooser</code> — file selection dialog</li>
  <li>Creating open/save file dialog</li>
  <li>Getting selected file</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>JFileChooser is necessary for standard file work in application.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create file selection dialog: <code>JFileChooser fileChooser = new JFileChooser();</code></li>
  <li>Show open dialog: <code>int result = fileChooser.showOpenDialog(frame);</code></li>
  <li>Handle result: <code>if (result == JFileChooser.APPROVE_OPTION) {<br>
&nbsp;&nbsp;File selectedFile = fileChooser.getSelectedFile();<br>
&nbsp;&nbsp;label.setText("Selected: " + selectedFile.getName());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check result before using file</li>
  <li><strong>✅ Great:</strong> Set initial directory, add file filter</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring result — may be null</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>File selection dialog will appear. This is standard file explorer window. You can select file and press "Open" or "Save". After selection, you''ll get File object.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (291, 'en', 'File Selection Beginner: Open File Selection Dialog',
        'Create JFileChooser, show open dialog and handle result')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (292, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Save Dialog</h2>
<p class="intro">Save dialog allows choosing location for file. Saving document, exporting data, creating backup — all of this requires choosing save location. Without it, file will be saved to unpredictable location.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showSaveDialog()</code> — save dialog</li>
  <li>Handling save result</li>
  <li>Getting selected file for saving</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Save dialog is necessary for choosing location and file name when saving.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show save dialog: <code>int result = fileChooser.showSaveDialog(frame);</code></li>
  <li>Handle result: <code>if (result == JFileChooser.APPROVE_OPTION) {<br>
&nbsp;&nbsp;File file = fileChooser.getSelectedFile();<br>
&nbsp;&nbsp;label.setText("Save to: " + file.getPath());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check result before saving</li>
  <li><strong>✅ Great:</strong> Set suggested file name, check file existence before overwriting</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring result — file won''t be saved</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Save file dialog will appear. You can choose location and file name. After selection, you''ll get File object for saving.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (292, 'en', 'File Selection Master: Create Save Dialog',
        'Show save dialog, handle result and get selected file')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (293, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Adding File Filter</h2>
<p class="intro">File filters simplify selection. You can show only images, only documents, only text files. Without filters, user will have to search for needed file type among all.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>FileNameExtensionFilter</code> — extension filter</li>
  <li>Method <code>setFileFilter()</code> — setting filter</li>
  <li>Creating file filters</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>File filters are necessary for simplifying selection of needed file types.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create filter: <code>FileNameExtensionFilter filter = new FileNameExtensionFilter(<br>
&nbsp;&nbsp;"Text files",<br>
&nbsp;&nbsp;"txt", "text"<br>
);</code></li>
  <li>Set filter: <code>fileChooser.setFileFilter(filter);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> FileNameExtensionFilter for extensions</li>
  <li><strong>✅ Great:</strong> Add multiple extensions to one filter, add multiple filters via <code>addChoosableFileFilter()</code>, use <code>setAcceptAllFileFilterUsed(false)</code> to hide "All files"</li>
  <li><strong>⚠️ Avoid:</strong> Too many filters — may be complex</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Only files with needed extensions will be shown in dialog. You can select file type from dropdown list.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (293, 'en', 'File Selection Master: Add File Filter',
        'Create FileNameExtensionFilter for "txt" and "text", set filter in fileChooser')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (294, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Enabling Multiple File Selection</h2>
<p class="intro">Multiple selection speeds up work. You can select several files at once, without opening dialog multiple times. Without this, you''ll have to select files one by one.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMultiSelectionEnabled()</code> — enabling multiple selection</li>
  <li>Getting multiple selected files</li>
  <li>Handling multiple selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Multiple selection is necessary for speeding up work with several files simultaneously.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable multiple selection: <code>fileChooser.setMultiSelectionEnabled(true);</code></li>
  <li>Handle result: <code>if (result == JFileChooser.APPROVE_OPTION) {<br>
&nbsp;&nbsp;File[] files = fileChooser.getSelectedFiles();<br>
&nbsp;&nbsp;for (File file : files) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected: " + file.getName());<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMultiSelectionEnabled(true)</code></li>
  <li><strong>✅ Great:</strong> Use <code>getSelectedFiles()</code> to get array, handle all selected files</li>
  <li><strong>⚠️ Avoid:</strong> Multiple selection where single is needed</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to select multiple files. With multiple selection, you can select several files simultaneously.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (294, 'en', 'File Selection Master: Enable Multiple Selection',
        'Enable multiple selection via setMultiSelectionEnabled(true), get files via getSelectedFiles()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (295, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding File Filter (Extended)</h2>
<p class="intro">Filter limits selection. You can show only needed file types, simplify selection. Without filter, all files will be visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>FileFilter</code> — file filter</li>
  <li>Method <code>addChoosableFileFilter()</code> — adding filter</li>
  <li>Limiting file selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Filters are necessary for limiting selection of needed file types and simplifying navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create filter: <code>FileFilter filter = new FileNameExtensionFilter("Text files", "txt");</code></li>
  <li>Add filter: <code>fileChooser.addChoosableFileFilter(filter);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> FileNameExtensionFilter for extensions</li>
  <li><strong>✅ Great:</strong> Use <code>addChoosableFileFilter()</code> for adding, use <code>setFileFilter()</code> to set default, create custom filters</li>
  <li><strong>⚠️ Avoid:</strong> Too many filters — may be overloaded</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Filter will appear in dialog. You can select file type. Only needed files will be visible.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (295, 'en', 'File Selection Master: Add Filter',
        'Create FileNameExtensionFilter for "txt", add via addChoosableFileFilter()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (296, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Setting Current Directory</h2>
<p class="intro">Current directory determines initial folder. You can open dialog in needed folder, improve navigation. Without setting, will be standard folder.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setCurrentDirectory()</code> — setting directory</li>
  <li>Class <code>File</code> — file/directory</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Setting current directory is necessary for improving navigation and user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create directory: <code>File dir = new File("/path/to/directory");</code></li>
  <li>Set directory: <code>fileChooser.setCurrentDirectory(dir);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setCurrentDirectory()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use File for directory, use for improving navigation, adapt to context</li>
  <li><strong>⚠️ Avoid:</strong> Setting non-existent directory</li>
</ul>
<p><strong>Important:</strong> Check directory existence.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog will open in specified directory. You can start navigation from needed folder.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (296, 'en', 'File Selection Master: Set Current Directory',
        'Create File for directory, set via setCurrentDirectory()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (297, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Setting Dialog Title</h2>
<p class="intro">Title makes dialog informative. You can specify dialog purpose, improve understanding. Without title, dialog will be nameless.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDialogTitle()</code> — setting title</li>
  <li>Creating informative dialog</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Title is necessary for dialog informativeness and improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set title: <code>fileChooser.setDialogTitle("Choose file");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDialogTitle()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use clear titles, use for informativeness, adapt to context</li>
  <li><strong>⚠️ Avoid:</strong> Too long titles</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog will have title. Title will be visible in window title.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (297, 'en', 'File Selection Master: Set Dialog Title',
        'Set title "Choose file" via setDialogTitle()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (298, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Adding Hyperlink Listener</h2>
<p class="intro">Hyperlink listener allows handling clicks. You can open link, perform action, improve functionality. Without listener, links won''t work.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>HyperlinkListener</code> — hyperlink listener</li>
  <li>Method <code>addHyperlinkListener()</code> — adding listener</li>
  <li>Handling link clicks</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Hyperlink listener is necessary for handling link clicks in JEditorPane.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>editorPane.addHyperlinkListener(e -> {<br>
&nbsp;&nbsp;if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Link: " + e.getURL());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addHyperlinkListener()</code> for adding</li>
  <li><strong>✅ Great:</strong> Check EventType.ACTIVATED, use <code>getURL()</code> to get URL, handle clicks</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring events</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking link, handler will trigger. You can handle link, open URL.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (298, 'en', 'Editor Master: Add Hyperlink Listener',
        'Add HyperlinkListener, check EventType.ACTIVATED, output URL via getURL()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (299, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Setting Content Type</h2>
<p class="intro">Content type determines format. You can set HTML, RTF, plain text, improve display. Without type, content will be plain text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setContentType()</code> — setting content type</li>
  <li>Types: text/html, text/plain, text/rtf</li>
  <li>Managing content format</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Content type is necessary for correct display of formatted content in JEditorPane.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set type: <code>editorPane.setContentType("text/html");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setContentType()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use "text/html" for HTML, use "text/plain" for text, use "text/rtf" for RTF</li>
  <li><strong>⚠️ Avoid:</strong> Using unsupported type</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Content will be displayed in specified format. You can use HTML, RTF.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (299, 'en', 'Editor Master: Set Content Type', 'Set content type "text/html" via setContentType()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (300, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Creating Read-Only Editor</h2>
<p class="intro">Read-only protects content. You can prohibit editing, improve security. Without protection, content can be changed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEditable()</code> — setting editability</li>
  <li>Protection from changes</li>
  <li>Improving security</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Read-only mode is necessary for protecting content from changes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Disable editing: <code>editorPane.setEditable(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEditable(false)</code> for disabling</li>
  <li><strong>✅ Great:</strong> Use for protection, improve security, use for viewing</li>
  <li><strong>⚠️ Avoid:</strong> Disabling for editable fields</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Editor will be read-only. Content cannot be changed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (300, 'en', 'Editor Master: Make Read-Only', 'Disable editing via setEditable(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
