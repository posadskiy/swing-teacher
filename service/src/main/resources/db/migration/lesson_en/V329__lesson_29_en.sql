-- Flyway migration V3: Lesson 29
-- This migration contains lesson, tasks, and documentation for lesson 29

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

-- Task 1: Creating JPopupMenu
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (238, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Context Menu</h2>
<p class="intro">Popup menus provide quick access to functions. Copy, paste, delete, properties — all of this is convenient in context menu. Without it, you need to search for functions in main menu.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JPopupMenu</code> — popup menu</li>
  <li>Creating context menu</li>
  <li>Showing menu at specific position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Context menus are necessary for quick access to functions depending on context.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create popup menu: <code>JPopupMenu popup = new JPopupMenu();</code></li>
  <li>Add menu items: <code>popup.add(new JMenuItem("Copy"));</code> and <code>popup.add(new JMenuItem("Paste"));</code></li>
  <li>Show menu: <code>popup.show(component, x, y);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> For context actions</li>
  <li><strong>✅ Great:</strong> Show on right-click, use cursor coordinates, add separators for grouping</li>
  <li><strong>⚠️ Avoid:</strong> Too many items — menu will be overloaded</li>
</ul>
<p><strong>Important:</strong> Use MouseListener to show on right-click.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A popup menu will appear. Menu will be at the specified position. You can select item from menu.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (238, 'en', 'Popup Menu Beginner: Create Context Menu',
        'Create JPopupMenu, add two menu items ("Copy", "Paste"), show menu via show()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 2: Menu Items
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (239, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Various Items to Menu</h2>
<p class="intro">Various items make menu functional. You can add regular items, checkboxes, radio buttons. Without variety, menu will be limited.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Adding various types of items</li>
  <li>JMenuItem, JCheckBoxMenuItem, JRadioButtonMenuItem</li>
  <li>Separators for grouping</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Variety of item types allows creating more functional and convenient menus.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add regular item: <code>popup.add(new JMenuItem("Copy"));</code></li>
  <li>Add separator: <code>popup.addSeparator();</code></li>
  <li>Add checkbox: <code>popup.add(new JCheckBoxMenuItem("Show panel"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Different types of items</li>
  <li><strong>✅ Great:</strong> Group related items with separators, use JCheckBoxMenuItem for options, use JRadioButtonMenuItem for selection</li>
  <li><strong>⚠️ Avoid:</strong> Too many items — menu will be long</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Various items will appear in menu. You can add regular items, checkboxes, separators.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (239, 'en', 'Popup Menu Master: Add Menu Items',
        'Create JPopupMenu, add JMenuItem, separator and JCheckBoxMenuItem')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 3: Show Location
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (240, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Showing Menu at Needed Position</h2>
<p class="intro">Positioning makes menu convenient. Menu appears where cursor is, or at needed place. Without proper positioning, menu may appear not where expected.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>show(Component, int x, int y)</code> — showing at position</li>
  <li>Using cursor coordinates</li>
  <li>Showing relative to component</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Proper positioning is necessary for convenience of using context menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get cursor coordinates: <code>int x = e.getX();</code> and <code>int y = e.getY();</code></li>
  <li>Show menu: <code>popup.show(component, x, y);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Cursor coordinates</li>
  <li><strong>✅ Great:</strong> Show on right-click, use getX() and getY() from MouseEvent, show relative to component</li>
  <li><strong>⚠️ Avoid:</strong> Showing at fixed position — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Coordinates relative to component. Menu automatically positions itself.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu will appear at cursor position. Menu will be where click was.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (240, 'en', 'Popup Menu Master: Show Menu at Needed Position',
        'Create JPopupMenu, add MouseListener, on right-click show menu at cursor position via show()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 4: Invoker
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (241, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Getting Menu Source</h2>
<p class="intro">Source determines context. You can find out which component invoked menu, and adapt menu items. Without source, you cannot determine context.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getInvoker()</code> — getting source</li>
  <li>Component that invoked menu</li>
  <li>Using source for context</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting source is necessary for adapting menu depending on context.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get source: <code>Component invoker = popup.getInvoker();</code></li>
  <li>Use source: <code>if (invoker instanceof JPanel) {<br>
&nbsp;&nbsp;// Adapt menu for panel<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getInvoker()</code> to get source</li>
  <li><strong>✅ Great:</strong> Adapt menu depending on source, use for context actions, check source type</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring source — menu will be same everywhere</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get component that invoked menu. You can adapt menu depending on source.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (241, 'en', 'Popup Menu Master: Find Menu Source',
        'Create JPopupMenu, show it, get source via getInvoker() and output type to console')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 5: Border
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (242, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Border to Menu</h2>
<p class="intro">Border creates visual separation. You can highlight menu, create frame, improve readability. Without border, menu may blend with background.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setBorder(Border)</code> — setting border</li>
  <li>Creating visual separation</li>
  <li>Improving appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Border improves visual perception and menu readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create border: <code>Border border = BorderFactory.createLineBorder(Color.GRAY);</code></li>
  <li>Set border: <code>popup.setBorder(border);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> BorderFactory to create</li>
  <li><strong>✅ Great:</strong> Use <code>createLineBorder()</code> for line, use <code>createRaisedBevelBorder()</code> for raised, use for visual separation</li>
  <li><strong>⚠️ Avoid:</strong> Too thick border — may be excessive</li>
</ul>
<p><strong>Important:</strong> Make border thin.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu will have a border. Menu will be highlighted with frame.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (242, 'en', 'Popup Menu Master: Add Border',
        'Create JPopupMenu, create border via BorderFactory.createLineBorder(), set via setBorder()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 6: Listeners
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (243, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Tracking Menu Events</h2>
<p class="intro">Listeners allow reacting to events. You can track when menu is shown or closed, perform actions. Without listeners, you cannot track events.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Listener <code>PopupMenuListener</code> — tracking menu events</li>
  <li>Events: show, cancel, close</li>
  <li>Reacting to menu events</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tracking events is necessary for reacting to user actions with menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>popup.addPopupMenuListener(new PopupMenuListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void popupMenuWillBecomeVisible(PopupMenuEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Menu will be shown");<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Menu will be hidden");<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void popupMenuCanceled(PopupMenuEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Menu canceled");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> PopupMenuListener to track</li>
  <li><strong>✅ Great:</strong> React to menu show, react to menu close, react to menu cancel</li>
  <li><strong>⚠️ Avoid:</strong> Listener without actions — useless</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When showing or closing menu, an action will be performed. If you used JLabel, messages will appear on screen.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (243, 'en', 'Popup Menu Master: Track Menu Events',
        'Create JPopupMenu, add PopupMenuListener, output message to console when menu is shown')
ON CONFLICT (task_id, language_code) DO NOTHING;
