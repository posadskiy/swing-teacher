-- Flyway migration V3: Lesson 22
-- This migration contains lesson, tasks, and documentation for lesson 22

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (183, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Tabbed Interface</h2>
<p class="intro">JTabbedPane organizes content. You can split the interface into tabs, group related content, save space. Without tabs, everything will be in one place.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JTabbedPane</code> — tabbed panel</li>
  <li>Creating tabs</li>
  <li>Adding components to tabs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tabs are necessary for organizing content and saving space in the interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create tabbed panel: <code>JTabbedPane tabbedPane = new JTabbedPane();</code></li>
  <li>Add tabs: <code>tabbedPane.addTab("Tab 1", new JPanel());</code> and <code>tabbedPane.addTab("Tab 2", new JPanel());</code></li>
  <li>Add to the form: <code>add(tabbedPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addTab()</code> to add tabs</li>
  <li><strong>✅ Great:</strong> Use clear tab names, group related content</li>
  <li><strong>⚠️ Avoid:</strong> Too many tabs — overloads interface</li>
</ul>
<p><strong>Important:</strong> <code>addTab(String title, Icon icon, Component component)</code> — with icon. <code>insertTab(String title, Icon icon, Component component, String tip, int index)</code> — insert tab. <code>removeTabAt(int index)</code> — remove tab. <code>setSelectedIndex(int index)</code> — select tab.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A tabbed panel will appear. These are tabs at the top, you can switch between them. Content of each tab is displayed when selected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (183, 'en', 'Tabs Beginner: Create Tabbed Interface',
        'Create a tabbed panel, add two tabs "Tab 1" and "Tab 2" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (184, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Tab Placement</h2>
<p class="intro">Placement affects interface appearance. Top — standard, bottom — alternative, left/right — for vertical interfaces. You can choose appropriate placement.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setTabPlacement(int)</code> — setting placement</li>
  <li>Constants <code>TOP</code>, <code>BOTTOM</code>, <code>LEFT</code>, <code>RIGHT</code></li>
  <li>Placing tabs in different places</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Choosing placement allows you to adapt the interface to different types of applications.</p>
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
  <li><strong>✅ Use:</strong> TOP for top (default), BOTTOM for bottom, LEFT for left, RIGHT for right</li>
  <li><strong>⚠️ Avoid:</strong> Using inappropriate placement</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tabs will be placed in the specified location. Top, bottom, left or right. You can choose appropriate placement.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (184, 'en', 'Tabs Master: Set Tab Placement',
        'Create a tabbed panel, set placement at bottom via setTabPlacement(JTabbedPane.BOTTOM)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (185, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Tab Selection</h2>
<p class="intro">Tab selection allows programmatic switching. You can open the needed tab on startup, switch after action, improve user experience. Without management, selection will be only manual.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setSelectedIndex(int)</code> — select tab by index</li>
  <li>Method <code>setSelectedComponent(Component)</code> — select tab by component</li>
  <li>Managing selected tab</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Programmatic tab selection allows you to control displayed content and improve user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Select tab by index: <code>tabbedPane.setSelectedIndex(1);</code></li>
  <li>Or by component: <code>tabbedPane.setSelectedComponent(component);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setSelectedIndex()</code> to select, <code>setSelectedComponent()</code> to select</li>
  <li><strong>✅ Great:</strong> Select tab on startup, switch after action</li>
  <li><strong>⚠️ Avoid:</strong> Selecting non-existent tab</li>
</ul>
<p><strong>Important:</strong> <code>getSelectedIndex()</code> — get selected tab index. <code>getSelectedComponent()</code> — get selected component.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The selected tab will become active. Content of this tab will be displayed. You can switch programmatically.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (185, 'en', 'Tabs Master: Select Tab',
        'Create a tabbed panel, add two tabs, select second via setSelectedIndex(1)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (186, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Icon on Tab</h2>
<p class="intro">Icon improves visual appearance. You can add an icon to the tab, make it more recognizable, improve navigation. Without icon, tab will be only with text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setIconAt(int, Icon)</code> — setting icon</li>
  <li>Method <code>addTab(String, Icon, Component)</code> — adding with icon</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Icons improve visual perception and navigation through tabs.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add tab with icon: <code>tabbedPane.addTab("Tab", icon, component);</code></li>
  <li>Or set icon for existing: <code>tabbedPane.setIconAt(0, icon);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addTab()</code> with icon, <code>setIconAt()</code> to set</li>
  <li><strong>✅ Great:</strong> Use clear icons, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Using too large icons</li>
</ul>
<p><strong>Important:</strong> <code>getIconAt(int index)</code> — get icon.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>An icon will appear on the tab. You can improve visual appearance and navigation.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (186, 'en', 'Tabs Master: Add Icon to Tab',
        'Create a tabbed panel, add tab with icon via addTab("Tab", icon, component)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (187, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Tooltip on Tab</h2>
<p class="intro">Tooltip helps the user. You can show additional information, explain tab purpose, improve understanding. Without tooltip, user may not understand tab purpose.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipTextAt(int, String)</code> — setting tooltip</li>
  <li>Showing information on hover</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltips improve interface understanding and help user navigate.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>tabbedPane.setToolTipTextAt(0, "This is the first tab");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipTextAt()</code> to set</li>
  <li><strong>✅ Great:</strong> Use informative tooltips, explain tab purpose, use to help user</li>
  <li><strong>⚠️ Avoid:</strong> Using too long tooltips</li>
</ul>
<p><strong>Important:</strong> <code>getToolTipTextAt(int index)</code> — get tooltip.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When hovering mouse over tab, a tooltip will appear. This is a popup tooltip with information. You can improve user experience.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (187, 'en', 'Tabs Master: Add Tooltip to Tab',
        'Create a tabbed panel, add tab, set tooltip "First tab" via setToolTipTextAt(0, "First tab")')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (188, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Enable/Disable Tab</h2>
<p class="intro">Enable/disable manages availability. You can disable tab when it''s unavailable, show state, improve user experience. Without management, all tabs are always available.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEnabledAt(int, boolean)</code> — enable/disable</li>
  <li>Managing tab availability</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing availability allows you to show tab states and improve user experience.</p>
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
  <li><strong>✅ Great:</strong> Disable unavailable tabs, show state, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without explanation</li>
</ul>
<p><strong>Important:</strong> <code>isEnabledAt(int index)</code> — check availability.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tab will become unavailable or available. Unavailable tab will be gray and inactive. You can manage availability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (188, 'en', 'Tabs Master: Enable/Disable Tab',
        'Create a tabbed panel, add tab, disable it via setEnabledAt(0, false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (189, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Handling Tab Change</h2>
<p class="intro">Handling changes allows reacting to switching. You can update other components, load data, perform actions on switch. Without handling, you cannot react to changes.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>ChangeListener</code> — change listener</li>
  <li>Method <code>addChangeListener()</code> — adding listener</li>
  <li>Reacting to tab switching</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling changes allows you to synchronize interface and react to user actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>tabbedPane.addChangeListener(e -> {<br>
&nbsp;&nbsp;int index = tabbedPane.getSelectedIndex();<br>
&nbsp;&nbsp;label.setText("Selected tab: " + index);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addChangeListener()</code> to handle</li>
  <li><strong>✅ Great:</strong> Use <code>getSelectedIndex()</code> to get index, update other components, load data on switch</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring changes</li>
</ul>
<p><strong>Important:</strong> <code>getSelectedComponent()</code> — get selected component.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When switching tabs, handler will fire. You can handle change and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (189, 'en', 'Tabs Master: Handle Tab Change',
        'Create a tabbed panel, add ChangeListener, get selected tab index via getSelectedIndex(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;
