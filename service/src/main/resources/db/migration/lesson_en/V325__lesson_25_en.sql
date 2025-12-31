-- Flyway migration V3: Lesson 25
-- This migration contains lesson, tasks, and documentation for lesson 25

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (203, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Dropdown Menu</h2>
<p class="intro">Menus organize application functions. File → Open, Save, Exit. Edit → Copy, Paste. Menu makes functions accessible and organized.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JMenu</code> — dropdown menu</li>
  <li>Creating menu</li>
  <li>Adding menu items</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Menus are necessary for organizing application functions and providing access to commands.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create menu: <code>JMenu fileMenu = new JMenu("File");</code></li>
  <li>Create menu items: <code>JMenuItem openItem = new JMenuItem("Open");</code> and <code>JMenuItem saveItem = new JMenuItem("Save");</code></li>
  <li>Add items to menu: <code>fileMenu.add(openItem);</code> and <code>fileMenu.add(saveItem);</code></li>
  <li>Add menu to menu bar: <code>menuBar.add(fileMenu);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear menu and item names</li>
  <li><strong>✅ Great:</strong> Add separators: <code>fileMenu.addSeparator();</code>, add submenu for grouping</li>
  <li><strong>⚠️ Avoid:</strong> Too many items — menu will become long</li>
</ul>
<p><strong>Important:</strong> Separator: <code>menu.addSeparator();</code> — visual separation. Submenu: create JMenu and add to another menu. Mnemonic: <code>menu.setMnemonic(KeyEvent.VK_F);</code> — hotkey.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A "File" menu will appear in the menu bar. When clicking, a dropdown list with items will open. You can select an item to perform an action.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (203, 'en', 'Menu Beginner: Create Dropdown Menu',
        'Create "File" menu, add "Open" item and add menu to menu bar')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (204, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Frameless Window</h2>
<p class="intro">JWindow allows creating a frameless window. Popup tooltips, notifications, custom dialogs — all of this requires a frameless window. Without it, you''ll have to use JFrame with frame.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JWindow</code> — frameless window</li>
  <li>Creating popup windows</li>
  <li>Adding content to window</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Frameless windows are necessary for popup tooltips, notifications, and custom dialogs.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create window: <code>JWindow window = new JWindow(frame);</code></li>
  <li>Add content: <code>window.add(new JLabel("Popup window"));</code></li>
  <li>Show window: <code>window.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Specify parent window</li>
  <li><strong>✅ Great:</strong> Use <code>pack()</code> for size, use <code>setLocation()</code> for position, use for popup windows</li>
  <li><strong>⚠️ Avoid:</strong> Too large windows — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> No frame and title bar.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A frameless window will appear. The window will be without title bar and buttons. You can add any content.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (204, 'en', 'Window Beginner: Create Frameless Window',
        'Create JWindow with parent frame, add JLabel, show window')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (205, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Window Always on Top</h2>
<p class="intro">Window on top makes it always visible. Popup tooltips, notifications, important messages — all of this requires window on top. Without this, window may be hidden by other windows.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAlwaysOnTop()</code> — setting on top</li>
  <li>Creating popup windows</li>
  <li>Configuring window behavior</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>"Always on top" mode is necessary for important notifications and popup tooltips.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set on top: <code>window.setAlwaysOnTop(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAlwaysOnTop(true)</code> for on top</li>
  <li><strong>✅ Great:</strong> Use for important notifications, use for popup tooltips</li>
  <li><strong>⚠️ Avoid:</strong> Always on top for all windows — may interfere with work</li>
</ul>
<p><strong>Important:</strong> Don''t abuse — may interfere.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The window will always be on top of other windows. Even if you open other windows, this window will remain visible.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (205, 'en', 'Window Master: Make Always on Top', 'Set always on top via setAlwaysOnTop(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (206, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Setting Window Background</h2>
<p class="intro">Background makes window visually appealing. You can highlight window, create themes, improve readability. Without background, window will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setBackground()</code> — setting background</li>
  <li>Creating colored windows</li>
  <li>Configuring appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring background allows you to improve visual design and readability of window.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set background: <code>window.setBackground(Color.LIGHT_GRAY);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBackground()</code> for background</li>
  <li><strong>✅ Great:</strong> Use standard colors, use custom colors</li>
  <li><strong>⚠️ Avoid:</strong> Too bright colors — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Use muted colors. Consider contrast.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The window will become colored. Window background will be the specified color.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (206, 'en', 'Window Master: Set Background', 'Set background LIGHT_GRAY via setBackground()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (207, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Window Always on Top (Advanced)</h2>
<p class="intro">Always on top makes window visible. Window will always be on top of other windows, won''t be hidden. Without this, window may be hidden.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setAlwaysOnTop()</code> — always on top</li>
  <li>Creating floating windows</li>
  <li>Improving visibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>"Always on top" mode is necessary for floating windows and notifications.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set always on top: <code>window.setAlwaysOnTop(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAlwaysOnTop(true)</code> for always on top</li>
  <li><strong>✅ Great:</strong> Use for floating windows, use for notifications</li>
  <li><strong>⚠️ Avoid:</strong> Always on top for all windows — may be intrusive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The window will always be on top of other windows. The window won''t be hidden.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (207, 'en', 'Window Master: Always on Top', 'Set always on top via setAlwaysOnTop(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (208, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Setting Window Background (Advanced)</h2>
<p class="intro">Background determines window color. You can set the desired color, improve visual design. Without configuration, background will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setBackground()</code> — setting background</li>
  <li>Creating colored window</li>
  <li>Improving visual design</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring background allows you to improve visual design and create themed windows.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set background: <code>window.setBackground(Color.LIGHT_GRAY);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBackground()</code> to set</li>
  <li><strong>✅ Great:</strong> Use Color for color, use for visual design, combine with other settings</li>
  <li><strong>⚠️ Avoid:</strong> Too bright color — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Use reasonable colors.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window background will change. Window will have the specified color.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (208, 'en', 'Window Master: Set Background', 'Set background LIGHT_GRAY via setBackground()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (209, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: One Touch in Split Panel</h2>
<p class="intro">One touch speeds up switching. You can quickly expand or collapse panel with one click, improve navigation. Without one touch, you need to drag divider.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setOneTouchExpandable()</code> — enabling one touch</li>
  <li>Buttons for quick expand/collapse</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>One touch improves usability and speeds up work with split panel.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable one touch: <code>splitPane.setOneTouchExpandable(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setOneTouchExpandable(true)</code> to enable</li>
  <li><strong>✅ Great:</strong> Use for quick switching, improve navigation, use to improve UX</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without need</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Buttons for quick expand/collapse will appear on the divider. You can quickly switch between panels.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (209, 'en', 'Divider Master: Enable One Touch', 'Enable one touch via setOneTouchExpandable(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (210, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Continuous Layout in Split Panel</h2>
<p class="intro">Continuous layout improves smoothness. When dragging divider, components will update continuously, improve visual effect. Without continuous layout, update will be only at the end.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setContinuousLayout()</code> — enabling continuous layout</li>
  <li>Smooth resizing</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Continuous layout ensures smooth interface update when dragging divider.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable continuous layout: <code>splitPane.setContinuousLayout(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setContinuousLayout(true)</code> to enable</li>
  <li><strong>✅ Great:</strong> Use for smoothness, improve visual effect, use to improve UX</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without need</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When dragging divider, components will update smoothly. You can see changes in real time.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (210, 'en', 'Divider Master: Enable Continuous Layout',
        'Enable continuous layout via setContinuousLayout(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (211, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Resize Weight in Split Panel</h2>
<p class="intro">Resize weight determines proportions. You can set how space is distributed when resizing, improve layout. Without weight, proportions will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setResizeWeight()</code> — setting resize weight</li>
  <li>Managing proportions when resizing</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Resize weight allows you to control how parts of split panel respond to window resizing.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set weight: <code>splitPane.setResizeWeight(0.5);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setResizeWeight()</code> to set</li>
  <li><strong>✅ Great:</strong> Use 0.0-1.0 for weight. 0.0 — only left/top, 1.0 — only right/bottom, 0.5 — evenly</li>
  <li><strong>⚠️ Avoid:</strong> Using values outside range</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When resizing, space will be distributed by weight. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (211, 'en', 'Divider Master: Set Resize Weight', 'Set weight 0.5 via setResizeWeight()')
ON CONFLICT (task_id, language_code) DO NOTHING;
