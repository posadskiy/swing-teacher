-- Flyway migration V3: Lesson 27
-- This migration contains lesson, tasks, and documentation for lesson 27

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (221, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Checkbox in Menu</h2>
<p class="intro">Checkboxes in menu allow toggling options. "Show toolbar", "Enable autostart", "Dark theme" — all of this is convenient to do through checkboxes in menu. Option state is visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JCheckBoxMenuItem</code> — checkbox in menu</li>
  <li>Creating checkbox in menu</li>
  <li>Managing checkbox state</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Checkboxes in menu are necessary for toggling options with visible state.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create checkbox in menu: <code>JCheckBoxMenuItem showToolbar = new JCheckBoxMenuItem("Show toolbar");</code></li>
  <li>Set state (optional): <code>showToolbar.setSelected(true);</code></li>
  <li>Add to menu: <code>viewMenu.add(showToolbar);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear names reflecting action</li>
  <li><strong>✅ Great:</strong> Set initial state, add handler to react to change</li>
  <li><strong>⚠️ Avoid:</strong> Checkbox without handler — state doesn''t affect application</li>
</ul>
<p><strong>Important:</strong> Check: <code>isSelected()</code> — returns true if checked. Handler: <code>addItemListener(listener);</code> — to react to change.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A checkbox will appear in the menu. This is a menu item with a square. If checked — checkmark is visible. When clicking, state toggles.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (221, 'en', 'Menu Checkbox Beginner: Create Toggle in Menu',
        'Create checkbox in menu "Show panel", check it and add to menu')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (222, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Selecting Active Tab</h2>
<p class="intro">Programmatic tab switching allows managing navigation. You can switch to needed tab after action, show needed information. Without this, user must switch manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setSelectedIndex()</code> — selection by index</li>
  <li>Method <code>setSelectedComponent()</code> — selection by component</li>
  <li>Programmatic tab switching</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Programmatic switching is necessary for managing navigation and automatically showing needed information.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Select by index: <code>tabbedPane.setSelectedIndex(1);</code></li>
  <li>Or select by component: <code>tabbedPane.setSelectedComponent(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setSelectedIndex()</code> to select by index, <code>setSelectedComponent()</code> to select by component</li>
  <li><strong>✅ Great:</strong> Check index validity before selection, use <code>ChangeListener</code> to track switches</li>
  <li><strong>⚠️ Avoid:</strong> Selecting non-existent index — may be error</li>
</ul>
<p><strong>Important:</strong> <code>getSelectedIndex()</code> — get selected tab index. <code>getSelectedComponent()</code> — get selected component.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Active tab will switch programmatically. You can switch to needed tab without user click.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (222, 'en', 'Tabs Master: Select Active Tab', 'Select tab with index 1 via setSelectedIndex(1)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (223, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Tab Placement</h2>
<p class="intro">Tab placement affects interface. You can place tabs at top (standard), bottom, left, right. Without configuration, tabs will be at top.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setTabPlacement()</code> — setting placement</li>
  <li>Tab placement constants</li>
  <li>Configuring tab appearance</li>
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
  <li><strong>✅ Use:</strong> TOP for top (standard), BOTTOM for bottom, LEFT for left, RIGHT for right</li>
  <li><strong>⚠️ Avoid:</strong> Frequently changing placement — may be unexpected</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tabs will be at the specified placement. They can be at top, bottom, left or right.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (223, 'en', 'Tabs Master: Configure Tab Placement',
        'Set placement BOTTOM via setTabPlacement()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (224, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Tab Tooltip</h2>
<p class="intro">Tooltip provides additional information. You can show tab description, additional information. Without tooltip, user won''t see additional information.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipTextAt()</code> — setting tooltip</li>
  <li>Creating informative tabs</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltips improve user experience by providing additional information about tabs.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add tab: <code>tabbedPane.addTab("Tab", component);</code></li>
  <li>Set tooltip: <code>tabbedPane.setToolTipTextAt(0, "Tab description");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipTextAt()</code> to set</li>
  <li><strong>✅ Great:</strong> Use clear tooltips, use for description, use for additional information</li>
  <li><strong>⚠️ Avoid:</strong> Too long tooltips — may be inconvenient</li>
</ul>
<p><strong>Important:</strong> Make tooltips short.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When hovering, a tooltip will appear. You can show tab description.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (224, 'en', 'Tabs Master: Add Tooltip',
        'Add tab, set tooltip "Description" via setToolTipTextAt(0, "Description")')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (225, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Enable/Disable Tab</h2>
<p class="intro">Enable/disable tab manages availability. You can temporarily disable tab, make it unavailable. Without management, all tabs are always available.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEnabledAt()</code> — enable/disable tab</li>
  <li>Managing tab availability</li>
  <li>Creating dynamic interfaces</li>
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
  <li>Or enable: <code>tabbedPane.setEnabledAt(0, true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEnabledAt()</code> to manage</li>
  <li><strong>✅ Great:</strong> Disable temporarily unavailable tabs, enable when needed, use for dynamic interfaces</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without reason</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tab will be enabled or disabled. You can manage tab availability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (225, 'en', 'Tabs Master: Enable/Disable Tab',
        'Disable tab 0 via setEnabledAt(0, false), then enable via setEnabledAt(0, true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (226, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Getting Tab Index</h2>
<p class="intro">Tab index allows managing tabs. You can find tab position, switch to needed one. Without index, you cannot manage tabs.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>indexOfTab()</code> — getting index</li>
  <li>Method <code>getSelectedIndex()</code> — getting selected index</li>
  <li>Working with tab indices</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Working with indices is necessary for programmatic tab management and navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get index: <code>int index = tabbedPane.indexOfTab("Tab");</code></li>
  <li>Or get selected: <code>int selected = tabbedPane.getSelectedIndex();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>indexOfTab()</code> to get, <code>getSelectedIndex()</code> for selected</li>
  <li><strong>✅ Great:</strong> Use for navigation, use for management</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring indices</li>
</ul>
<p><strong>Important:</strong> Check index existence.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You will be able to get tab index. You can use for navigation and management.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (226, 'en', 'Tabs Master: Get Tab Index',
        'Get index via indexOfTab("Tab"), get selected via getSelectedIndex()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (227, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Separator in Toolbar</h2>
<p class="intro">Separator improves organization. You can group tools, improve readability. Without separator, all tools will be together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addSeparator()</code> — adding separator</li>
  <li>Grouping tools</li>
  <li>Improving organization</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Separators help visually group tools and improve toolbar readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add separator: <code>toolBar.addSeparator();</code></li>
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
<p>A separator will appear between tools. You can group tools.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (227, 'en', 'Toolbar Master: Add Separator', 'Add separator via addSeparator()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (228, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Spacing in Toolbar</h2>
<p class="intro">Spacing improves visual appearance. You can add distance between tools, improve readability. Without spacing, tools will be close together.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>addSeparator()</code> — adding separator for spacing</li>
  <li>Improving visual appearance</li>
  <li>Creating neat toolbar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Spacing improves visual perception and toolbar readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add separators: <code>toolBar.addSeparator();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addSeparator()</code> for spacing</li>
  <li><strong>✅ Great:</strong> Use for grouping, improve visual appearance, improve readability</li>
  <li><strong>⚠️ Avoid:</strong> Too many separators</li>
</ul>
<p><strong>Important:</strong> Make logical groups. Don''t abuse.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>There will be spacing between tools. You can group tools.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (228, 'en', 'Toolbar Master: Set Spacing',
        'Add separator via addSeparator() to create spacing')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (229, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Toolbar Orientation</h2>
<p class="intro">Orientation determines direction. You can place toolbar horizontally or vertically, improve layout. Without setting, orientation will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setOrientation()</code> — setting orientation</li>
  <li>Constants <code>SwingConstants.HORIZONTAL</code>, <code>SwingConstants.VERTICAL</code></li>
  <li>Managing toolbar direction</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Choosing orientation allows you to adapt toolbar to different interface layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set orientation: <code>toolBar.setOrientation(SwingConstants.VERTICAL);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setOrientation()</code> to set</li>
  <li><strong>✅ Great:</strong> Use HORIZONTAL for horizontal, VERTICAL for vertical, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Using inappropriate orientation</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The toolbar will be in the specified orientation. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (229, 'en', 'Toolbar Master: Set Orientation',
        'Set orientation VERTICAL via setOrientation()')
ON CONFLICT (task_id, language_code) DO NOTHING;
