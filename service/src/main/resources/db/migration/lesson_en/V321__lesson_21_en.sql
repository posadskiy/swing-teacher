-- Flyway migration V3: Lesson 21
-- This migration contains lesson, tasks, and documentation for lesson 21

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (175, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Split Panel</h2>
<p class="intro">JSplitPane allows efficient use of space. File list on the left, content on the right. Tree on the left, details on the right. Splitting makes the interface functional.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JSplitPane</code> — split panel</li>
  <li>Creating horizontal or vertical split</li>
  <li>Adding components to each part</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>A split panel is necessary for efficient use of space and creating functional interfaces.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create components for parts: <code>JPanel leftPanel = new JPanel();</code> and <code>JPanel rightPanel = new JPanel();</code></li>
  <li>Create split panel: <code>JSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, leftPanel, rightPanel);</code></li>
  <li>Add to the form: <code>add(splitPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>HORIZONTAL_SPLIT</code> — vertical split (left/right)</li>
  <li><strong>✅ Great:</strong> <code>VERTICAL_SPLIT</code> — horizontal split (top/bottom), configure divider position: <code>splitPane.setDividerLocation(200);</code></li>
</ul>
<p><strong>Important:</strong> Divider position: <code>setDividerLocation(position_in_pixels)</code>. Proportion: <code>setResizeWeight(0.5)</code> — equal distribution. One touch: <code>setOneTouchExpandable(true)</code> — buttons for quick expansion. You can nest JSplitPane inside each other for complex interfaces.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A split panel will appear. The screen will be divided into two parts with a draggable border. You can move the divider, changing the sizes of parts.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (175, 'en', 'Split Panel Beginner: Split Screen in Half',
        'Create a horizontal split panel with two panels and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (176, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Split Panel Orientation</h2>
<p class="intro">Orientation affects the appearance of the split. Horizontal — left/right, vertical — top/bottom. You can choose the appropriate orientation for the interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setOrientation(int)</code> — setting orientation</li>
  <li>Constants <code>HORIZONTAL_SPLIT</code> and <code>VERTICAL_SPLIT</code></li>
  <li>Horizontal and vertical split</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Choosing orientation allows you to adapt the split to different types of interfaces.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set orientation: <code>splitPane.setOrientation(JSplitPane.VERTICAL_SPLIT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> HORIZONTAL_SPLIT for horizontal, VERTICAL_SPLIT for vertical</li>
  <li><strong>✅ Great:</strong> Choose orientation depending on place, use for saving space</li>
  <li><strong>⚠️ Avoid:</strong> Using wrong orientation</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The split panel will have the set orientation. Horizontal — left/right, vertical — top/bottom.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (176, 'en', 'Split Panel Master: Set Orientation',
        'Create a split panel, set vertical orientation via setOrientation(JSplitPane.VERTICAL_SPLIT)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (177, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Divider Position</h2>
<p class="intro">Divider position determines the sizes of parts. You can set the initial position, center the divider, configure proportions. Without configuration, position will be random.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setDividerLocation(int)</code> — setting position</li>
  <li>Method <code>setDividerLocation(double)</code> — setting position in percent</li>
  <li>Managing divider position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing divider position allows you to control the initial proportions of parts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set position in pixels: <code>splitPane.setDividerLocation(200);</code></li>
  <li>Or in percent: <code>splitPane.setDividerLocation(0.5);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDividerLocation()</code> to set</li>
  <li><strong>✅ Great:</strong> Use pixels for precise position, use percent for proportional position, center divider</li>
  <li><strong>⚠️ Avoid:</strong> Setting position outside bounds</li>
</ul>
<p><strong>Important:</strong> <code>getDividerLocation()</code> — get current position.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The divider will be set to the specified position. Parts will have the set sizes. You can configure proportions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (177, 'en', 'Split Panel Master: Set Divider Position',
        'Create a split panel, set divider position 200 via setDividerLocation(200)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (178, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Resize Weight</h2>
<p class="intro">Weight determines how parts change when resizing. You can set which part will expand more. Without configuration, parts will change evenly.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setResizeWeight(double)</code> — setting weight</li>
  <li>Space distribution when resizing</li>
  <li>Managing proportions</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Resize weight allows you to control how parts of the split panel respond to window resizing.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set weight: <code>splitPane.setResizeWeight(0.3);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setResizeWeight()</code> to set</li>
  <li><strong>✅ Great:</strong> Use values from 0.0 to 1.0. 0.0 — left/top part doesn''t change, 1.0 — right/bottom part doesn''t change, 0.5 — equal distribution</li>
</ul>
<p><strong>Important:</strong> Use to manage proportions.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When resizing, parts will change according to weight. You can configure which part will expand.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (178, 'en', 'Split Panel Master: Set Resize Weight',
        'Create a split panel, set weight 0.3 via setResizeWeight(0.3)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (179, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: One Touch in Split Panel</h2>
<p class="intro">One touch simplifies work. You can quickly expand or collapse a part with one click. Without this, you''ll have to drag the divider manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setOneTouchExpandable(boolean)</code> — one touch</li>
  <li>Buttons for quick expand/collapse</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>One touch improves usability and speeds up work with the split panel.</p>
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
  <li><strong>✅ Great:</strong> Use to improve usability, use for quick access, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Disabling without need</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Buttons will appear on the divider. You can quickly expand or collapse a part with one click.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (179, 'en', 'Split Panel Master: Enable One Touch',
        'Create a split panel, enable one touch via setOneTouchExpandable(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (180, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Continuous Layout</h2>
<p class="intro">Continuous layout improves visual experience. When dragging the divider, parts update smoothly. Without this, update occurs only after release.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setContinuousLayout(boolean)</code> — continuous layout</li>
  <li>Smooth update when dragging</li>
  <li>Improving visual experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Continuous layout ensures smooth interface update when dragging the divider.</p>
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
  <li><strong>✅ Great:</strong> Use for smooth update, use to improve visual experience, use for heavy components</li>
  <li><strong>⚠️ Avoid:</strong> Disabling for light components — may be slower</li>
</ul>
<p><strong>Important:</strong> <code>false</code> — update only after release.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When dragging the divider, parts will update smoothly. You can see changes in real time.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (180, 'en', 'Split Panel Master: Enable Continuous Layout',
        'Create a split panel, enable continuous layout via setContinuousLayout(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (181, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Split Panel Border</h2>
<p class="intro">Border improves visual appearance. You can set the desired border, separate parts, improve design. Without configuration, border will be standard.</p>
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
<p>Border allows you to improve visual perception and separate parts of the split panel.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set border: <code>splitPane.setBorder(BorderFactory.createEtchedBorder());</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBorder()</code> to set</li>
  <li><strong>✅ Great:</strong> Use BorderFactory to create borders, use to improve appearance, separate parts</li>
  <li><strong>⚠️ Avoid:</strong> Using too thick borders</li>
</ul>
<p><strong>Important:</strong> <code>BorderFactory.createEtchedBorder()</code> — etched border. <code>BorderFactory.createLineBorder(Color)</code> — line. <code>BorderFactory.createTitledBorder(String)</code> — border with title.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The split panel will have the set border. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (181, 'en', 'Split Panel Master: Set Border',
        'Create a split panel, set border via setBorder(BorderFactory.createEtchedBorder())')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (182, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Minimum Sizes of Parts</h2>
<p class="intro">Minimum sizes limit shrinking. You can set minimum size for each part, prevent too small parts. Without limit, parts may be too small.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setLeftComponent(Component)</code> and <code>setRightComponent(Component)</code></li>
  <li>Method <code>setMinimumSize(Dimension)</code> for components</li>
  <li>Managing minimum sizes of parts</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Minimum sizes allow you to prevent too small parts and improve layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set minimum size for component: <code>leftPanel.setMinimumSize(new Dimension(100, 0));</code> and <code>rightPanel.setMinimumSize(new Dimension(100, 0));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMinimumSize()</code> to set</li>
  <li><strong>✅ Great:</strong> Use Dimension for size, use for limiting, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Setting too large minimum size</li>
</ul>
<p><strong>Important:</strong> Make size reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Parts cannot be smaller than minimum size. You can prevent too small parts.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (182, 'en', 'Split Panel Master: Set Minimum Sizes',
        'Create a split panel, set minimum size 100x0 for left panel via setMinimumSize()')
ON CONFLICT (task_id, language_code) DO NOTHING;
