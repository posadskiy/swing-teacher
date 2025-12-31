-- Flyway migration V3: Lesson 24
-- This migration contains lesson, tasks, and documentation for lesson 24

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (196, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Menu Bar</h2>
<p class="intro">Menu bar is application navigation. File, Edit, View, Help — these are standard menus. Without menu, user won''t be able to find all application functions.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JMenuBar</code> — menu bar</li>
  <li>Creating menu bar</li>
  <li>Adding menus to bar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Menu bar is necessary for organizing navigation and accessing application functions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create menu bar: <code>JMenuBar menuBar = new JMenuBar();</code></li>
  <li>Create menu: <code>JMenu fileMenu = new JMenu("File");</code></li>
  <li>Add menu to bar: <code>menuBar.add(fileMenu);</code></li>
  <li>Set menu bar in window: <code>frame.setJMenuBar(menuBar);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Create menu bar, then add menus</li>
  <li><strong>✅ Great:</strong> Standard menus: File, Edit, View, Help</li>
  <li><strong>⚠️ Avoid:</strong> Too many menus — overloads interface</li>
</ul>
<p><strong>Important:</strong> You can add multiple menus. Menus are arranged horizontally in the bar.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A menu bar will appear at the top of the window. This is a horizontal panel with menu names. When clicking on a menu, a dropdown list of items will open.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (196, 'en', 'Menu Bar Beginner: Create Application Menu',
        'Create a menu bar, add "File" menu and set it in the window')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (197, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Scroll Policy</h2>
<p class="intro">Scroll policy determines when to show scrollbars. You can always show, hide when not needed, or never show. Without configuration, scrollbars will appear when needed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setHorizontalScrollBarPolicy()</code> — horizontal policy</li>
  <li>Method <code>setVerticalScrollBarPolicy()</code> — vertical policy</li>
  <li>Configuring scrollbar display</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Scroll policy allows you to control scrollbar visibility and optimize space usage.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set horizontal policy: <code>scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.ALWAYS);</code></li>
  <li>Set vertical policy: <code>scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.AS_NEEDED);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> AS_NEEDED for automatic display</li>
  <li><strong>✅ Great:</strong> Use ALWAYS for constant display, use NEVER for hiding, combine different policies</li>
  <li><strong>⚠️ Avoid:</strong> ALWAYS when not needed — takes space</li>
</ul>
<p><strong>Important:</strong> AS_NEEDED — show when needed, ALWAYS — always show, NEVER — never show.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Scrollbars will be displayed according to policy. They can be always visible, appear when needed, or be hidden.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (197, 'en', 'Scrollable Panel Master: Configure Scroll Policy',
        'Set horizontal policy ALWAYS, vertical AS_NEEDED')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (198, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Working with Viewport</h2>
<p class="intro">Viewport manages visible area. You can scroll to needed position, set initial position. Without viewport, you cannot manage visible area.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getViewport()</code> — getting viewport</li>
  <li>Method <code>setViewPosition()</code> — setting position</li>
  <li>Managing visible area</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Viewport allows you to programmatically manage visible area and scroll position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get viewport: <code>JViewport viewport = scrollPane.getViewport();</code></li>
  <li>Set position: <code>viewport.setViewPosition(new Point(0, 100));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getViewport()</code> to get, <code>setViewPosition()</code> for position</li>
  <li><strong>✅ Great:</strong> Use for scrolling, use for initial position</li>
  <li><strong>⚠️ Avoid:</strong> Setting outside bounds — may be unexpected</li>
</ul>
<p><strong>Important:</strong> <code>getViewPosition()</code> — get position.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Visible area will be scrolled. You can set initial position.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (198, 'en', 'Scrollable Panel Master: Work with Viewport',
        'Get viewport via getViewport(), set position (0, 100) via setViewPosition()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (199, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Horizontal Scrolling</h2>
<p class="intro">Scroll policy determines visibility. You can always show, show when needed, or never show. Without configuration, there will be standard policy.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setHorizontalScrollBarPolicy()</code> — horizontal scroll policy</li>
  <li>Policy constants (ALWAYS, AS_NEEDED, NEVER)</li>
  <li>Managing scroll visibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring horizontal scrolling allows you to control scrollbar display depending on content.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set policy: <code>scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> AS_NEEDED for when needed</li>
  <li><strong>✅ Great:</strong> Use ALWAYS for always, use NEVER for never, adapt to content</li>
  <li><strong>⚠️ Avoid:</strong> ALWAYS for all — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Horizontal scrolling will be according to policy. You can manage scroll visibility.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (199, 'en', 'Scrollable Panel Master: Configure Horizontal Scrolling',
        'Set policy AS_NEEDED via setHorizontalScrollBarPolicy()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (200, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Viewport Border</h2>
<p class="intro">Viewport border creates visual separation. You can highlight viewing area, improve readability. Without border, area will be without frame.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setViewportBorder()</code> — setting border</li>
  <li>Creating visual separation</li>
  <li>Improving appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Viewport border helps visually separate viewing area and improve readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create border: <code>Border border = BorderFactory.createLineBorder(Color.GRAY);</code></li>
  <li>Set border: <code>scrollPane.setViewportBorder(border);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> BorderFactory to create</li>
  <li><strong>✅ Great:</strong> Use <code>createLineBorder()</code> for line, use <code>createMatteBorder()</code> for matte, use for visual separation</li>
  <li><strong>⚠️ Avoid:</strong> Too thick border — may be excessive</li>
</ul>
<p><strong>Important:</strong> Make border thin.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Viewport will have a border. Viewing area will be highlighted with a frame.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (200, 'en', 'Scrollable Panel Master: Add Viewport Border',
        'Create border via BorderFactory.createLineBorder(), set via setViewportBorder()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (201, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Column Header</h2>
<p class="intro">Column header improves informativeness. You can show headers for tables, improve understanding. Without header, table will be without labels.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setColumnHeaderView()</code> — setting column header</li>
  <li>Header for tables</li>
  <li>Improving informativeness</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Column header is necessary for improving table informativeness and structured data display.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create header: <code>JLabel header = new JLabel("Header");</code></li>
  <li>Set header: <code>scrollPane.setColumnHeaderView(header);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setColumnHeaderView()</code> to set</li>
  <li><strong>✅ Great:</strong> Use for tables, combine with <code>setRowHeaderView()</code>, improve informativeness</li>
  <li><strong>⚠️ Avoid:</strong> Header without content</li>
</ul>
<p><strong>Important:</strong> Make headers clear.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A column header will appear above scrollable content. You can use for tables.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (201, 'en', 'Scrollable Panel Master: Add Column Header',
        'Create JLabel "Header", set via setColumnHeaderView()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (202, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Row Header</h2>
<p class="intro">Row header improves informativeness. You can show headers for tables, improve understanding. Without header, table will be without labels.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setRowHeaderView()</code> — setting row header</li>
  <li>Header for tables</li>
  <li>Improving informativeness</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Row header is necessary for improving table informativeness and structured data display.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create header: <code>JLabel header = new JLabel("Header");</code></li>
  <li>Set header: <code>scrollPane.setRowHeaderView(header);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRowHeaderView()</code> to set</li>
  <li><strong>✅ Great:</strong> Use for tables, combine with <code>setColumnHeaderView()</code>, improve informativeness</li>
  <li><strong>⚠️ Avoid:</strong> Header without content</li>
</ul>
<p><strong>Important:</strong> Make headers clear.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A row header will appear to the left of scrollable content. You can use for tables.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (202, 'en', 'Scrollable Panel Master: Add Row Header',
        'Create JLabel "Header", set via setRowHeaderView()')
ON CONFLICT (task_id, language_code) DO NOTHING;
