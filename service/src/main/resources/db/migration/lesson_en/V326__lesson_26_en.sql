-- Flyway migration V3: Lesson 26
-- This migration contains lesson, tasks, and documentation for lesson 26

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (212, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Menu Item</h2>
<p class="intro">Menu items perform actions. Open file, save, exit — these are menu items. Without them, menu is useless. Menu items are application commands.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JMenuItem</code> — menu item</li>
  <li>Creating menu item</li>
  <li>Adding action handler</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Menu items are necessary for executing application commands and providing access to functions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create menu item: <code>JMenuItem openItem = new JMenuItem("Open");</code></li>
  <li>Add handler: <code>JLabel label = new JLabel();<br>
openItem.addActionListener(e -> label.setText("Open file"));<br>
add(label);</code></li>
  <li>Add to menu: <code>fileMenu.add(openItem);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear item names</li>
  <li><strong>✅ Great:</strong> Add icon: <code>new JMenuItem("Open", icon);</code>, hotkey: <code>openItem.setAccelerator(KeyStroke.getKeyStroke("ctrl O"));</code></li>
  <li><strong>⚠️ Avoid:</strong> Item without handler — nothing will happen</li>
</ul>
<p><strong>Important:</strong> Mnemonic: <code>setMnemonic(KeyEvent.VK_O);</code> — underlined letter.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>An "Open" item will appear in the menu. When clicking, an action will be performed (e.g., a message will be displayed). If there''s a hotkey, you can use it instead of clicking.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (212, 'en', 'Menu Item Beginner: Create Action in Menu',
        'Create menu item "Open", add handler and add to menu')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (213, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Divider Position in Split Panel</h2>
<p class="intro">Divider position determines initial panel ratio. You can set equal split or give more space to one panel. Without configuration, divider will be in center.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDividerLocation()</code> — setting position</li>
  <li>Configuring initial divider position</li>
  <li>Managing panel split</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring divider position allows you to control initial proportions of split panel parts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set position in pixels: <code>splitPane.setDividerLocation(200);</code></li>
  <li>Or set in percent: <code>splitPane.setDividerLocation(0.5);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDividerLocation(int)</code> for pixels, <code>setDividerLocation(double)</code> for percent</li>
  <li><strong>✅ Great:</strong> Set after adding components, use <code>resetToPreferredSizes()</code> to reset</li>
  <li><strong>⚠️ Avoid:</strong> Setting before adding components — may not work</li>
</ul>
<p><strong>Important:</strong> <code>getDividerLocation()</code> — get current position. Set after <code>pack()</code> or <code>setVisible(true)</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The divider will be at the specified position. Panels will be split in the needed ratio. You can drag the divider.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (213, 'en', 'Split Panel Master: Configure Divider Position',
        'Set divider position 200 pixels via setDividerLocation(200)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (214, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: One Touch in Split Panel</h2>
<p class="intro">One touch speeds up work. You can quickly expand or collapse panel with one click. Without this, you''ll have to drag divider.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setOneTouchExpandable()</code> — enabling one touch</li>
  <li>Creating quick expand buttons</li>
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
  <li><strong>✅ Use:</strong> <code>setOneTouchExpandable(true)</code> for buttons</li>
  <li><strong>✅ Great:</strong> Use for quick access, combine with other settings</li>
  <li><strong>⚠️ Avoid:</strong> Always enabled — may not be needed</li>
</ul>
<p><strong>Important:</strong> Buttons appear on divider. One click for expand/collapse.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Buttons will appear on the divider. You can click for quick expand or collapse of panel.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (214, 'en', 'Split Panel Master: Enable One Touch',
        'Enable one touch via setOneTouchExpandable(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (215, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Divider Position (Advanced)</h2>
<p class="intro">Divider position determines panel sizes. You can set initial position, change panel ratio. Without configuration, divider will be in middle.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDividerLocation()</code> — setting position</li>
  <li>Setting position in pixels or percent</li>
  <li>Controlling divider placement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing divider position allows you to control initial sizes of split panel parts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set position in pixels: <code>splitPane.setDividerLocation(200);</code></li>
  <li>Or in percent: <code>splitPane.setDividerLocation(0.3);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDividerLocation(int)</code> for pixels, <code>setDividerLocation(double)</code> for percent</li>
  <li><strong>✅ Great:</strong> Use for initial position, use for changing ratio</li>
  <li><strong>⚠️ Avoid:</strong> Setting outside bounds — may be unexpected</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The divider will be at the specified position. Panels will be the needed size. You can change the ratio.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (215, 'en', 'Split Panel Master: Set Divider Position',
        'Set divider position 200 pixels via setDividerLocation(200)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (216, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Continuous Layout in Split Panel</h2>
<p class="intro">Continuous layout makes change smooth. Panels will change size in real time when dragging. Without this, change will be only after release.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setContinuousLayout()</code> — continuous layout</li>
  <li>Smooth size changes</li>
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
  <li><strong>✅ Great:</strong> Use for smooth change, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Disabling for slow components</li>
</ul>
<p><strong>Important:</strong> <code>false</code> — disable (change after release).</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Panel sizes will change smoothly. When dragging, size will change in real time.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (216, 'en', 'Split Panel Master: Enable Continuous Layout',
        'Enable continuous layout via setContinuousLayout(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (217, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Resize Weight in Split Panel</h2>
<p class="intro">Resize weight determines proportions. You can specify how panels will change when resizing window. Without weight, proportions will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setResizeWeight()</code> — setting weight</li>
  <li>Managing panel proportions</li>
  <li>Creating balanced layouts</li>
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
  <li><strong>✅ Great:</strong> Use 0.0-1.0 for weight. 0.0 — only left/top panel, 1.0 — only right/bottom panel, 0.5 — equal proportions. Adapt to content</li>
  <li><strong>⚠️ Avoid:</strong> Too unequal proportions — may be inconvenient</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Panel proportions will be configured. When resizing, panels will change according to weight.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (217, 'en', 'Split Panel Master: Configure Resize Weight',
        'Set weight 0.5 via setResizeWeight(0.5)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (218, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Enable/Disable Tab</h2>
<p class="intro">Enable/disable tabs improves management. You can make tab unavailable depending on state, improve logic. Without this, all tabs are always available.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEnabledAt()</code> — enable/disable tab</li>
  <li>Managing tab availability</li>
  <li>Creating conditional tabs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing availability allows you to show tab states and improve interface logic.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Disable tab: <code>tabbedPane.setEnabledAt(0, false);</code></li>
  <li>Enable back: <code>tabbedPane.setEnabledAt(0, true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEnabledAt()</code> to manage</li>
  <li><strong>✅ Great:</strong> Use for conditional tabs, use to improve logic, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without explanation</li>
</ul>
<p><strong>Important:</strong> Explain reason for disabling.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tab will be enabled or disabled. You can manage tab availability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (218, 'en', 'Tab Master: Enable/Disable Tab',
        'Disable tab 0 via setEnabledAt(0, false), then enable back via setEnabledAt(0, true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (219, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Tab Mnemonic</h2>
<p class="intro">Mnemonic improves accessibility. You can assign hotkey to tab, improve navigation. Without mnemonic, you need to use mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setMnemonicAt()</code> — setting mnemonic</li>
  <li>Hotkeys for tabs</li>
  <li>Improving accessibility</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Mnemonics improve accessibility and speed up tab navigation from keyboard.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set mnemonic: <code>tabbedPane.setMnemonicAt(0, KeyEvent.VK_T);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMnemonicAt()</code> to set</li>
  <li><strong>✅ Great:</strong> Use <code>KeyEvent.VK_*</code> for keys, use to improve accessibility, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating mnemonics</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>In tab text, mnemonic letter will be underlined. When pressing Alt+key, tab will activate.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (219, 'en', 'Tab Master: Set Mnemonic', 'Set mnemonic VK_T for tab 0 via setMnemonicAt()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (220, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Tab Placement</h2>
<p class="intro">Tab placement affects design. You can place tabs at top, bottom, left, right, improve layout. Without setting, placement will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setTabPlacement()</code> — setting placement</li>
  <li>Constants <code>JTabbedPane.TOP</code>, <code>JTabbedPane.BOTTOM</code>, <code>JTabbedPane.LEFT</code>, <code>JTabbedPane.RIGHT</code></li>
  <li>Managing tab placement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Choosing placement allows you to adapt interface to different types of applications and improve layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set placement: <code>tabbedPane.setTabPlacement(JTabbedPane.BOTTOM);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setTabPlacement()</code> to set</li>
  <li><strong>✅ Great:</strong> Use TOP for top, BOTTOM for bottom, LEFT, RIGHT for sides</li>
  <li><strong>⚠️ Avoid:</strong> Using inappropriate placement</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tabs will be at the specified placement. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (220, 'en', 'Tab Master: Set Tab Placement',
        'Set placement BOTTOM via setTabPlacement()')
ON CONFLICT (task_id, language_code) DO NOTHING;
