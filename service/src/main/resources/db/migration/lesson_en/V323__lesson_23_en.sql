-- Flyway migration V3: Lesson 23
-- This migration contains lesson, tasks, and documentation for lesson 23

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (190, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Toolbar</h2>
<p class="intro">JToolBar provides quick access. Buttons for frequent actions, icons for commands, grouping tools. Without toolbar, you''ll have to use menu.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JToolBar</code> — toolbar</li>
  <li>Creating toolbar</li>
  <li>Adding components to toolbar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Toolbar is necessary for quick access to frequently used functions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create toolbar: <code>JToolBar toolbar = new JToolBar();</code></li>
  <li>Add buttons: <code>toolbar.add(new JButton("Button 1"));</code> and <code>toolbar.add(new JButton("Button 2"));</code></li>
  <li>Add to the form: <code>add(toolbar, BorderLayout.NORTH);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>add()</code> to add components</li>
  <li><strong>✅ Great:</strong> Use buttons with icons, group related tools, use separators for grouping</li>
  <li><strong>⚠️ Avoid:</strong> Too many buttons — overloads interface</li>
</ul>
<p><strong>Important:</strong> <code>addSeparator()</code> — add separator. <code>add(Component, int index)</code> — add at position. <code>remove(Component)</code> — remove component.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A toolbar will appear. This is a panel with buttons at the top (or in another place). You can quickly perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (190, 'en', 'Toolbar Beginner: Create Toolbar with Buttons',
        'Create a toolbar, add two buttons and add it to the form in BorderLayout.NORTH')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (191, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Toolbar Orientation</h2>
<p class="intro">Orientation affects toolbar appearance. Horizontal — for top/bottom, vertical — for left/right. You can choose appropriate orientation for the interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setOrientation(int)</code> — setting orientation</li>
  <li>Constants <code>HORIZONTAL</code> and <code>VERTICAL</code></li>
  <li>Horizontal and vertical toolbar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Choosing orientation allows you to adapt the toolbar to different types of interfaces.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set orientation: <code>toolbar.setOrientation(JToolBar.VERTICAL);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> HORIZONTAL for horizontal (default), VERTICAL for vertical</li>
  <li><strong>✅ Great:</strong> Choose orientation depending on place, use for saving space</li>
  <li><strong>⚠️ Avoid:</strong> Using wrong orientation</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The toolbar will have the set orientation. Horizontal — left to right, vertical — top to bottom.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (191, 'en', 'Toolbar Master: Set Orientation',
        'Create a toolbar, set vertical orientation via setOrientation(JToolBar.VERTICAL)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (192, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Floating Toolbar</h2>
<p class="intro">Floating toolbar improves flexibility. You can move the toolbar, place it in a convenient place, configure interface. Without this, toolbar will be fixed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setFloatable(boolean)</code> — floating toolbar</li>
  <li>Ability to move toolbar</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Floating toolbar allows user to configure interface according to their preferences.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable floating toolbar: <code>toolbar.setFloatable(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setFloatable(true)</code> to enable</li>
  <li><strong>✅ Great:</strong> Use to improve flexibility, allow user to configure, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without need</li>
</ul>
<p><strong>Important:</strong> <code>true</code> — enable moving (default), <code>false</code> — fix toolbar.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The toolbar can be moved. You can drag the toolbar to another place, make it floating.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (192, 'en', 'Toolbar Master: Enable Floating Toolbar',
        'Create a toolbar, enable floating toolbar via setFloatable(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (193, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Rollover Effect on Toolbar</h2>
<p class="intro">Rollover effect improves visual experience. Buttons highlight on hover, improve feedback, make interface more responsive. Without effect, buttons won''t react to hover.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setRollover(boolean)</code> — rollover effect</li>
  <li>Button highlighting on hover</li>
  <li>Improving visual experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Rollover effect improves visual feedback and makes interface more responsive.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable rollover effect: <code>toolbar.setRollover(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRollover(true)</code> to enable</li>
  <li><strong>✅ Great:</strong> Use to improve visual experience, improve feedback, make interface more responsive</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without need</li>
</ul>
<p><strong>Important:</strong> <code>true</code> — enable highlighting (default), <code>false</code> — disable highlighting.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When hovering mouse, buttons will highlight. You can improve visual experience and feedback.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (193, 'en', 'Toolbar Master: Enable Rollover Effect',
        'Create a toolbar, enable rollover effect via setRollover(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (194, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Separator on Toolbar</h2>
<p class="intro">Separator groups tools. You can separate related tools, improve organization, make toolbar more understandable. Without separators, all tools will be together.</p>
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
<p>Separators help organize tools into logical groups.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add separator: <code>toolbar.addSeparator();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addSeparator()</code> to add</li>
  <li><strong>✅ Great:</strong> Group related tools, improve organization, make toolbar more understandable</li>
  <li><strong>⚠️ Avoid:</strong> Using too many separators</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A separator will appear on the toolbar. This is a line separating tool groups. You can improve organization.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (194, 'en', 'Toolbar Master: Add Separator',
        'Create a toolbar, add button, add separator via addSeparator(), add another button')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (195, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Toolbar Border</h2>
<p class="intro">Border improves visual appearance. You can set the desired border, separate toolbar, improve design. Without configuration, border will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setBorder(Border)</code> — setting border</li>
  <li>Improving visual appearance</li>
  <li>Customizing appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Border allows you to visually separate toolbar and improve interface design.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set border: <code>toolbar.setBorder(BorderFactory.createEtchedBorder());</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBorder()</code> to set</li>
  <li><strong>✅ Great:</strong> Use BorderFactory to create borders, use to improve appearance, separate toolbar</li>
  <li><strong>⚠️ Avoid:</strong> Using too thick borders</li>
</ul>
<p><strong>Important:</strong> <code>BorderFactory.createEtchedBorder()</code> — etched border. <code>BorderFactory.createLineBorder(Color)</code> — line. <code>BorderFactory.createTitledBorder(String)</code> — border with title.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The toolbar will have the set border. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (195, 'en', 'Toolbar Master: Set Border',
        'Create a toolbar, set border via setBorder(BorderFactory.createEtchedBorder())')
ON CONFLICT (task_id, language_code) DO NOTHING;
