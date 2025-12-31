-- Flyway migration V3: Lesson 41
-- This migration contains lesson, tasks, and documentation for lesson 41

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (345, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Lining Up Components in Row with BoxLayout</h2>
<p class="intro">BoxLayout is perfect for simple linear layouts. Toolbars, button lists, vertical menus — all of this requires BoxLayout. It''s simpler than GridBagLayout, but more flexible than FlowLayout.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>BoxLayout</code> — linear layout</li>
  <li>Constants <code>X_AXIS</code> and <code>Y_AXIS</code> — direction</li>
  <li>Creating vertical/horizontal layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>BoxLayout is necessary for creating simple linear layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set manager: <code>setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));</code></li>
  <li>Add components: <code>add(button1);<br>
add(button2);<br>
add(button3);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Y_AXIS for vertical layout</li>
  <li><strong>✅ Great:</strong> Use X_AXIS for horizontal layout, add Box.createGlue() for stretching</li>
  <li><strong>⚠️ Avoid:</strong> Too many components — may not fit</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will line up in row. Vertically or horizontally — as you configure.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (345, 'en', 'BoxLayout Beginner: Line Up Components in Row', 'Set BoxLayout with Y_AXIS and add three buttons')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (346, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Stretching Element in BoxLayout</h2>
<p class="intro">Stretching elements make layout flexible. You can press components to edges, create gaps between them. Without this, components will be placed tightly together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createGlue()</code> — creating stretching element</li>
  <li>Method <code>Box.createRigidArea()</code> — creating fixed gap</li>
  <li>Creating gaps in BoxLayout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Stretching elements are necessary for creating flexible layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add component: <code>add(button1);</code></li>
  <li>Add stretching element: <code>add(Box.createGlue());</code></li>
  <li>Add another component: <code>add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createGlue()</code> for stretching gap</li>
  <li><strong>✅ Great:</strong> Use <code>createRigidArea(Dimension)</code> for fixed gap, use <code>createHorizontalStrut(int)</code> for horizontal gap, use <code>createVerticalStrut(int)</code> for vertical gap</li>
  <li><strong>⚠️ Avoid:</strong> Too many gaps — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Stretching gap will appear between components. When window size changes, gap will stretch. Components will be pressed to edges.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (346, 'en', 'BoxLayout Master: Add Stretching Element',
        'Add button, add createGlue(), add another button')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (348, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Adding Gaps in GridLayout</h2>
<p class="intro">Gaps make grid neat. Components won''t be pressed against each other, there will be visual separation. Without gaps, grid will look overloaded.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setHgap()</code> — horizontal gap</li>
  <li>Method <code>setVgap()</code> — vertical gap</li>
  <li>Configuring gaps in grid</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gaps are necessary for creating neat grid with visual separation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create manager: <code>GridLayout layout = new GridLayout(2, 3);</code></li>
  <li>Set gaps: <code>layout.setHgap(10);<br>
layout.setVgap(10);</code></li>
  <li>Set manager: <code>setLayout(layout);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setHgap()</code> for horizontal gaps, <code>setVgap()</code> for vertical gaps</li>
  <li><strong>✅ Great:</strong> Use same gaps for uniformity, specify gaps in constructor</li>
  <li><strong>⚠️ Avoid:</strong> Too large gaps — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Gaps will appear between components. Components won''t be pressed against each other. Grid will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (348, 'en', 'GridLayout Master: Add Gaps',
        'Create GridLayout (2,3), set horizontal and vertical gaps to 10')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (347, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Aligning Components in BoxLayout</h2>
<p class="intro">Aligning components makes interface neat. Components will be aligned same, interface will look professional. Without alignment, components will be placed chaotically.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>setAlignmentX()</code> and <code>setAlignmentY()</code> — alignment</li>
  <li>Alignment constants</li>
  <li>Configuring component alignment</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Aligning components is necessary for creating neat interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Align by X: <code>button.setAlignmentX(Component.CENTER_ALIGNMENT);</code></li>
  <li>Align by Y: <code>button.setAlignmentY(Component.CENTER_ALIGNMENT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> CENTER_ALIGNMENT for centering</li>
  <li><strong>✅ Great:</strong> Use LEFT_ALIGNMENT for left alignment, use RIGHT_ALIGNMENT for right alignment, use same alignment for all components</li>
  <li><strong>⚠️ Avoid:</strong> Different alignment for components — may be messy</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be aligned. All components will have same alignment. Interface will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (347, 'en', 'BoxLayout Master: Align Components',
        'Set setAlignmentX(CENTER_ALIGNMENT) and setAlignmentY(CENTER_ALIGNMENT) for button')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (349, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Configuring Dynamic Rows and Columns in GridLayout</h2>
<p class="intro">Dynamic sizes make grid adaptive. You can specify number of rows or columns, and other will be calculated automatically. Without this, you need to specify both sizes.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Using 0 for automatic calculation</li>
  <li>Dynamic grid size determination</li>
  <li>Creating adaptive layouts</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Dynamic sizes are necessary for creating adaptive layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create with automatic columns: <code>GridLayout layout = new GridLayout(3, 0);</code></li>
  <li>Or with automatic rows: <code>GridLayout layout = new GridLayout(0, 4);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> 0 for automatic calculation</li>
  <li><strong>✅ Great:</strong> Specify rows, columns will be calculated, specify columns, rows will be calculated, use for adaptive layouts</li>
  <li><strong>⚠️ Avoid:</strong> Both sizes 0 — may be unpredictable</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Grid will be adaptive. Number of rows or columns will be calculated automatically by number of components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (349, 'en', 'GridLayout Master: Configure Dynamic Rows and Columns',
        'Create GridLayout with 3 rows and 0 columns (automatic calculation)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (352, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Adding Glue in BoxLayout</h2>
<p class="intro">Glue stretches space. You can add stretchable space between components, improve layout. Without glue, components will be tight together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createHorizontalGlue()</code> — horizontal glue</li>
  <li>Method <code>Box.createVerticalGlue()</code> — vertical glue</li>
  <li>Stretching space</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Glue is necessary for creating stretchable space between components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create glue: <code>Component glue = Box.createHorizontalGlue();</code></li>
  <li>Add glue: <code>container.add(glue);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createHorizontalGlue()</code> for horizontal</li>
  <li><strong>✅ Great:</strong> Use <code>createVerticalGlue()</code> for vertical, use for stretching, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Too much glue</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Stretchable space will appear between components. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (352, 'en', 'BoxLayout Master: Add Glue',
        'Create horizontal glue via Box.createHorizontalGlue(), add to container')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (350, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Enabling Multiple Selection in JFileChooser</h2>
<p class="intro">Multiple selection speeds up work. You can select several files at once, improve performance. Without multiple selection, you need to select one by one.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMultiSelectionEnabled()</code> — enabling multiple selection</li>
  <li>Selecting multiple files</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Multiple selection is necessary for speeding up work with several files.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable multiple selection: <code>fileChooser.setMultiSelectionEnabled(true);</code></li>
  <li>Get selected files: <code>File[] files = fileChooser.getSelectedFiles();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMultiSelectionEnabled(true)</code> for enabling</li>
  <li><strong>✅ Great:</strong> Use <code>getSelectedFiles()</code> for getting, use for improving functionality, improve performance</li>
  <li><strong>⚠️ Avoid:</strong> Enabling without necessity</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to select multiple files. You can select several files simultaneously.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (350, 'en', 'File Selection Master: Enable Multiple Selection',
        'Enable multiple selection via setMultiSelectionEnabled(true), get files via getSelectedFiles()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (353, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Adding Strut in BoxLayout</h2>
<p class="intro">Strut creates fixed distance. You can add fixed space between components, improve layout. Without strut, components will be tight together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createHorizontalStrut()</code> — horizontal strut</li>
  <li>Method <code>Box.createVerticalStrut()</code> — vertical strut</li>
  <li>Fixed distance between components</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Strut is necessary for creating fixed distance between components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create strut: <code>Component strut = Box.createHorizontalStrut(20);</code></li>
  <li>Add strut: <code>container.add(strut);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createHorizontalStrut()</code> for horizontal</li>
  <li><strong>✅ Great:</strong> Use <code>createVerticalStrut()</code> for vertical, use for fixed distance, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Too large struts</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Fixed distance will appear between components. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (353, 'en', 'BoxLayout Master: Add Strut',
        'Create horizontal strut 20 via Box.createHorizontalStrut(20), add to container')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (351, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Adding File Filter in JFileChooser</h2>
<p class="intro">File filter improves selection. You can show only needed file types, improve user experience. Without filter, all files will be shown.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>FileNameExtensionFilter</code> — extension filter</li>
  <li>Method <code>addChoosableFileFilter()</code> — adding filter</li>
  <li>Filtering files by type</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>File filter is necessary for improving selection of needed file types.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create filter: <code>FileNameExtensionFilter filter = new FileNameExtensionFilter("Images", "jpg", "png", "gif");</code></li>
  <li>Add filter: <code>fileChooser.addChoosableFileFilter(filter);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> FileNameExtensionFilter for filter</li>
  <li><strong>✅ Great:</strong> Use <code>addChoosableFileFilter()</code> for adding, use for filtering, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Too strict filters</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Filter will be in file selection dialog. You can select file type for display.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (351, 'en', 'File Selection Master: Add File Filter',
        'Create FileNameExtensionFilter for "jpg", "png", add via addChoosableFileFilter()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (355, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Adding Rigid Area in BoxLayout</h2>
<p class="intro">Rigid area creates fixed space. You can add fixed area between components, improve layout. Without area, components will be tight together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>Box.createRigidArea()</code> — creating rigid area</li>
  <li>Fixed area between components</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Rigid area is necessary for creating fixed space between components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create area: <code>Component area = Box.createRigidArea(new Dimension(20, 20));</code></li>
  <li>Add area: <code>container.add(area);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createRigidArea()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, use for fixed space, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Too large areas</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Fixed area will appear between components. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (355, 'en', 'BoxLayout Master: Add Rigid Area',
        'Create rigid area 20x20 via Box.createRigidArea(new Dimension(20, 20)), add to container')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (354, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Setting Current Directory in JFileChooser</h2>
<p class="intro">Current directory determines initial position. You can set initial directory, improve navigation. Without setting, directory will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setCurrentDirectory()</code> — setting current directory</li>
  <li>Managing initial directory</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Setting current directory is necessary for improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create file: <code>File dir = new File("/path/to/directory");</code></li>
  <li>Set directory: <code>fileChooser.setCurrentDirectory(dir);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setCurrentDirectory()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use File for directory, use for improving navigation, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Using non-existent directory</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Dialog will open in specified directory. You can improve navigation.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (354, 'en', 'File Selection Master: Set Current Directory',
        'Create File for directory, set via setCurrentDirectory()')
ON CONFLICT (task_id, language_code) DO NOTHING;
