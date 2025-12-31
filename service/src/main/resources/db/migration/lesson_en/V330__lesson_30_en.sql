-- Flyway migration V3: Lesson 30
-- This migration contains lesson, tasks, and documentation for lesson 30

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (244, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Data Table</h2>
<p class="intro">Tables display structured data. User lists, products, orders — all of this is convenient to show in table. Tables make data readable and organized.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JTable</code> — table for displaying data</li>
  <li>Creating table with data</li>
  <li>Displaying data in tabular form</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tables are necessary for displaying structured data in convenient format.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create data: <code>String[] columns = {"Name", "Age", "City"};</code> and <code>Object[][] data = {{"John", 25, "New York"}, {"Mary", 30, "London"}};</code></li>
  <li>Create table: <code>JTable table = new JTable(data, columns);</code></li>
  <li>Wrap in JScrollPane: <code>JScrollPane scrollPane = new JScrollPane(table);</code></li>
  <li>Add to form: <code>add(scrollPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> JScrollPane for scrolling</li>
  <li><strong>✅ Great:</strong> Create with data array and columns, use TableModel for complex data</li>
  <li><strong>⚠️ Avoid:</strong> Without JScrollPane — large tables don''t scroll</li>
</ul>
<p><strong>Important:</strong> Always wrap in JScrollPane for scrolling. Cells can be edited (enabled by default).</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A table with data will appear. This is a table with rows and columns. Data is displayed in cells. You can scroll if there''s a lot of data.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (244, 'en', 'Table Beginner: Create Data Table',
        'Create table with columns "Name", "Age" and two rows of data, wrap in JScrollPane and add to form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (245, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Menu to Window</h2>
<p class="intro">Menu bar in window creates main menu of application. File, Edit, View — all standard commands are in menu. Without menu, commands will be scattered across buttons.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setJMenuBar()</code> — setting menu bar</li>
  <li>Adding menu to window</li>
  <li>Creating main application menu</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Menu bar is necessary for creating main application menu and organizing commands.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create menu bar: <code>JMenuBar menuBar = new JMenuBar();</code></li>
  <li>Add menu: <code>menuBar.add(fileMenu);</code></li>
  <li>Set in window: <code>frame.setJMenuBar(menuBar);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setJMenuBar()</code> to set</li>
  <li><strong>✅ Great:</strong> Add menus before setting, use standard menu names (File, Edit, View)</li>
  <li><strong>⚠️ Avoid:</strong> Too many menus — may be overloaded</li>
</ul>
<p><strong>Important:</strong> Menu bar appears at top of window. Group related commands.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu bar will appear at top of window. You can click on menu and see items.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (245, 'en', 'Menu Bar Master: Add Menu to Window',
        'Create JMenuBar, add menu via add(), set in window via setJMenuBar()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (246, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Adding Help Menu</h2>
<p class="intro">Help menu provides access to help. Help, about program, hotkeys — all of this is in help menu. Without it, user won''t be able to get help.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Creating help menu</li>
  <li>Adding help items</li>
  <li>Standard help menu placement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Help menu is necessary for providing access to help and program information.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create help menu: <code>JMenu helpMenu = new JMenu("Help");</code></li>
  <li>Add items: <code>helpMenu.add(new JMenuItem("Contents"));</code> and <code>helpMenu.add(new JMenuItem("About"));</code></li>
  <li>Add to menu bar: <code>menuBar.add(helpMenu);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Standard name "Help"</li>
  <li><strong>✅ Great:</strong> Place help menu on right, add standard items (Contents, About), use <code>setHelpMenu()</code> for automatic placement</li>
  <li><strong>⚠️ Avoid:</strong> Placing in non-standard location — may be unexpected</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Help menu will appear in menu bar. Menu will be on right. You can add help items.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (246, 'en', 'Menu Bar Master: Add Help Menu',
        'Create JMenu "Help", add two menu items, add to menuBar')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (247, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Placing Help Menu on Right</h2>
<p class="intro">Placing help menu on right is standard. Users expect to find help menu on right. Without standard placement, interface will be unexpected.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Standard help menu placement</li>
  <li>Method <code>setHelpMenu()</code> — setting help menu</li>
  <li>Creating standard interface</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Standard placement improves interface recognition and meets user expectations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create help menu: <code>JMenu helpMenu = new JMenu("Help");</code></li>
  <li>Set as help menu: <code>menuBar.setHelpMenu(helpMenu);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setHelpMenu()</code> to set</li>
  <li><strong>✅ Great:</strong> Place help menu on right, use standard name</li>
  <li><strong>⚠️ Avoid:</strong> Placing in non-standard location</li>
</ul>
<p><strong>Important:</strong> Follow interface standards.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Help menu will be on right. Menu will automatically be placed in standard location.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (247, 'en', 'Menu Bar Master: Place Help Menu on Right',
        'Create JMenu "Help", set via setHelpMenu()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (248, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Border to Menu Bar</h2>
<p class="intro">Border creates visual separation. You can highlight menu bar, create frame, improve readability. Without border, menu bar will blend with background.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setBorder()</code> — setting border</li>
  <li>Creating visual separation</li>
  <li>Improving appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Border improves visual perception and menu bar readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create border: <code>Border border = BorderFactory.createMatteBorder(0, 0, 1, 0, Color.GRAY);</code></li>
  <li>Set border: <code>menuBar.setBorder(border);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> BorderFactory to create</li>
  <li><strong>✅ Great:</strong> Use <code>createMatteBorder()</code> for matte, use <code>createLineBorder()</code> for line, use for visual separation</li>
  <li><strong>⚠️ Avoid:</strong> Too thick border — may be excessive</li>
</ul>
<p><strong>Important:</strong> Make border thin.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu bar will have a border. Menu bar will be highlighted with frame.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (248, 'en', 'Menu Bar Master: Add Border',
        'Create matte border via BorderFactory.createMatteBorder(), set via setBorder()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (249, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Adding Help Menu (Extended)</h2>
<p class="intro">Help menu improves accessibility. You can provide help, assist user. Without help menu, user may be lost.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Creating help menu</li>
  <li>Adding help items</li>
  <li>Improving accessibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Help menu is necessary for providing access to help and improving application accessibility.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create menu: <code>JMenu helpMenu = new JMenu("Help");</code></li>
  <li>Add items: <code>helpMenu.add(new JMenuItem("About"));</code> and <code>helpMenu.add(new JMenuItem("Help"));</code></li>
  <li>Add to menu bar: <code>menuBar.add(helpMenu);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Create help menu</li>
  <li><strong>✅ Great:</strong> Add useful items, use for accessibility, place on right</li>
  <li><strong>⚠️ Avoid:</strong> Help menu without useful content</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Help menu will appear in menu bar. You can get help and assistance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (249, 'en', 'Menu Bar Master: Add Help Menu',
        'Create JMenu "Help", add two menu items, add to menu bar')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (250, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Getting Popup Menu</h2>
<p class="intro">Popup menu allows customization. You can access menu, configure it, improve functionality. Without access, you cannot customize.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getPopupMenu()</code> — getting popup menu</li>
  <li>Access to popup menu</li>
  <li>Menu customization</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Access to popup menu is necessary for customization and menu configuration.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get menu: <code>JPopupMenu popup = menu.getPopupMenu();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getPopupMenu()</code> to get</li>
  <li><strong>✅ Great:</strong> Use for customization, use for configuration, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Changing without need</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can access popup menu. You can customize menu.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (250, 'en', 'Menu Master: Get Popup Menu', 'Get popup menu via getPopupMenu()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (251, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Adding Separator to Menu</h2>
<p class="intro">Separator improves organization. You can group menu items, improve readability. Without separator, all items will be together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addSeparator()</code> — adding separator</li>
  <li>Grouping menu items</li>
  <li>Improving organization</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Separators help visually group menu items and improve readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add separator: <code>menu.addSeparator();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addSeparator()</code> to add</li>
  <li><strong>✅ Great:</strong> Use for grouping, use to improve organization, improve readability</li>
  <li><strong>⚠️ Avoid:</strong> Too many separators</li>
</ul>
<p><strong>Important:</strong> Make logical groups. Don''t abuse.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A separator will appear between menu items. You can group items.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (251, 'en', 'Menu Master: Add Separator', 'Add separator via addSeparator()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (252, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Setting Menu Delay</h2>
<p class="intro">Delay affects opening time. You can set delay before opening menu, improve performance. Without setting, delay will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDelay()</code> — setting delay</li>
  <li>Managing menu opening time</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring delay allows optimizing performance and improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set delay: <code>menu.setDelay(200);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDelay()</code> to set</li>
  <li><strong>✅ Great:</strong> Use reasonable values (100-500 ms), use to improve performance, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Too large or small delay</li>
</ul>
<p><strong>Important:</strong> Make delay comfortable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu will open with set delay. You can improve performance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (252, 'en', 'Menu Master: Set Delay', 'Set delay 200 ms via setDelay()')
ON CONFLICT (task_id, language_code) DO NOTHING;
