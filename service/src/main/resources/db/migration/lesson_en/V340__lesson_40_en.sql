-- Flyway migration V3: Lesson 40
-- This migration contains lesson, tasks, and documentation for lesson 40

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (335, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Flexible Grid with GridBagLayout</h2>
<p class="intro">GridBagLayout — most powerful layout manager. Complex forms, adaptive interfaces, components of different sizes — all of this requires GridBagLayout. Without it, complex forms will look messy.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>GridBagLayout</code> — flexible grid</li>
  <li>Class <code>GridBagConstraints</code> — constraints for components</li>
  <li>Creating complex layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>GridBagLayout is necessary for creating complex and flexible layouts.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set manager: <code>setLayout(new GridBagLayout());</code></li>
  <li>Create constraints: <code>GridBagConstraints gbc = new GridBagConstraints();</code></li>
  <li>Configure constraints and add component: <code>gbc.gridx = 0;<br>
gbc.gridy = 0;<br>
gbc.fill = GridBagConstraints.HORIZONTAL;<br>
add(button, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Constants for fill: HORIZONTAL, VERTICAL, BOTH, NONE</li>
  <li><strong>✅ Great:</strong> Configure weightx and weighty for stretching, use insets for gaps</li>
  <li><strong>⚠️ Avoid:</strong> Too complex layout — difficult to maintain</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed in flexible grid. Each component can occupy several cells and stretch.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (335, 'en', 'GridBagLayout Beginner: Create Flexible Grid',
        'Set GridBagLayout, create constraints, add button at position (0,0) with fill=HORIZONTAL')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (336, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Configuring Stretching in GridBagLayout</h2>
<p class="intro">Configuring stretching makes interface adaptive. When window size changes, components will stretch proportionally. Without this, interface will look messy at different sizes.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Properties <code>weightx</code> and <code>weighty</code> — stretching priority</li>
  <li>Configuring component stretching</li>
  <li>Creating adaptive layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring stretching is necessary for creating adaptive interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Configure weightx: <code>gbc.weightx = 1.0;</code></li>
  <li>Configure weighty: <code>gbc.weighty = 1.0;</code></li>
  <li>Add component: <code>add(button, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> weightx = 1.0 for horizontal stretching</li>
  <li><strong>✅ Great:</strong> Use weighty = 1.0 for vertical stretching, use 0.0 for components that shouldn''t stretch</li>
  <li><strong>⚠️ Avoid:</strong> All components with weight = 1.0 — will be same size</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will stretch when window size changes. Components with weight = 1.0 will take all available space.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (336, 'en', 'GridBagLayout Master: Configure Stretching',
        'Configure weightx = 1.0 and weighty = 1.0 for constraints, add component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (338, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Configuring Alignment in FlowLayout</h2>
<p class="intro">Alignment makes interface neat. Components will be aligned same, interface will look professional. Without alignment, components will be placed chaotically.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Alignment constants (LEFT, CENTER, RIGHT)</li>
  <li>Method <code>setAlignment()</code> — setting alignment</li>
  <li>Configuring component alignment</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Alignment is necessary for creating neat interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create manager with alignment: <code>FlowLayout layout = new FlowLayout(FlowLayout.CENTER);</code></li>
  <li>Set manager: <code>setLayout(layout);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> CENTER for centering</li>
  <li><strong>✅ Great:</strong> Use LEFT for left alignment, use RIGHT for right alignment, use LEADING/TRAILING for text direction</li>
  <li><strong>⚠️ Avoid:</strong> Different alignment for different components</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be aligned. All components will be aligned same. Interface will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (338, 'en', 'FlowLayout Master: Configure Alignment',
        'Create FlowLayout with alignment CENTER, set manager')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (337, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Stretching Component Across Multiple Cells</h2>
<p class="intro">Stretching components across multiple cells makes layout flexible. Headers, large buttons, text areas — all of this can occupy multiple cells. Without this, components will be limited to one cell.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Properties <code>gridwidth</code> and <code>gridheight</code> — component size in cells</li>
  <li>Creating components occupying multiple cells</li>
  <li>Configuring component sizes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Stretching components across multiple cells is necessary for creating flexible layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Configure gridwidth: <code>gbc.gridwidth = 2;</code></li>
  <li>Configure gridheight: <code>gbc.gridheight = 2;</code></li>
  <li>Add component: <code>add(button, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> gridwidth for horizontal stretching</li>
  <li><strong>✅ Great:</strong> Use gridheight for vertical stretching, use GridBagConstraints.REMAINDER for remaining space, combine gridwidth and gridheight for large components</li>
  <li><strong>⚠️ Avoid:</strong> Too large components — may be messy</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will occupy multiple cells. Component will be stretched across specified number of cells.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (337, 'en', 'GridBagLayout Master: Stretch Component Across Multiple Cells',
        'Set gridwidth = 2 and gridheight = 2 for constraints, add component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (339, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Configuring Gaps in FlowLayout</h2>
<p class="intro">Gaps make layout neat. Components won''t be pressed against each other, there will be visual separation. Without gaps, components will be placed tightly.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setHgap()</code> — horizontal gap</li>
  <li>Method <code>setVgap()</code> — vertical gap</li>
  <li>Configuring gaps in FlowLayout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gaps are necessary for creating neat layout with visual separation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create manager: <code>FlowLayout layout = new FlowLayout();</code></li>
  <li>Set gaps: <code>layout.setHgap(10);<br>
layout.setVgap(10);</code></li>
  <li>Set manager: <code>setLayout(layout);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setHgap()</code> for horizontal gaps, <code>setVgap()</code> for vertical gaps</li>
  <li><strong>✅ Great:</strong> Use same gaps, specify gaps in constructor</li>
  <li><strong>⚠️ Avoid:</strong> Too large gaps — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Gaps will appear between components. Components won''t be pressed against each other. Layout will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (339, 'en', 'FlowLayout Master: Configure Gaps',
        'Create FlowLayout, set horizontal and vertical gaps to 10')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (342, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Setting Anchor in GridBagLayout</h2>
<p class="intro">Anchor determines position in cell. You can anchor component to cell edge, center, improve layout. Without anchor, position will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Field <code>anchor</code> in <code>GridBagConstraints</code> — anchor</li>
  <li>Positioning component in cell</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Anchor is necessary for precise component positioning in cell.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set anchor: <code>constraints.anchor = GridBagConstraints.CENTER;</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> anchor for setting</li>
  <li><strong>✅ Great:</strong> Use CENTER for centering, use NORTH, SOUTH, EAST, WEST, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Using incorrect anchor</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will be positioned by anchor. You can center, anchor to edges.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (342, 'en', 'GridBagLayout Master: Set Anchor',
        'Set anchor CENTER via constraints.anchor = GridBagConstraints.CENTER')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (340, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Creating Input Dialog</h2>
<p class="intro">Input dialog allows getting data. You can request text, number, improve interactivity. Without dialog, you can''t get input.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showInputDialog()</code> — input dialog</li>
  <li>Getting input from user</li>
  <li>Creating interactive dialogs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Input dialog is necessary for getting data from user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create dialog: <code>String input = JOptionPane.showInputDialog("Enter name:");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showInputDialog()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use clear messages, handle null (cancellation), use for getting data</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring cancellation</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Input dialog will appear. You can enter text, get result.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (340, 'en', 'Dialog Master: Create Input Dialog',
        'Create input dialog via showInputDialog("Enter name:"), save result')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (344, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Setting Fill in GridBagLayout</h2>
<p class="intro">Fill determines stretching. You can stretch component horizontally, vertically, both axes, improve layout. Without fill, component will be standard size.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Field <code>fill</code> in <code>GridBagConstraints</code> — fill</li>
  <li>Stretching component in cell</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Fill is necessary for managing component stretching in cell.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set fill: <code>constraints.fill = GridBagConstraints.BOTH;</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> fill for setting</li>
  <li><strong>✅ Great:</strong> Use BOTH for both axes, use HORIZONTAL for horizontal, use VERTICAL for vertical</li>
  <li><strong>⚠️ Avoid:</strong> Using incorrect fill</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will be stretched by fill. You can improve layout.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (344, 'en', 'GridBagLayout Master: Set Fill',
        'Set fill BOTH via constraints.fill = GridBagConstraints.BOTH')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (341, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Creating Confirmation Dialog</h2>
<p class="intro">Confirmation dialog allows getting answer. You can request action confirmation, improve security. Without dialog, you can''t confirm action.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showConfirmDialog()</code> — confirmation dialog</li>
  <li>Getting user answer</li>
  <li>Creating interactive dialogs</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Confirmation dialog is necessary for getting action confirmation from user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create dialog: <code>int result = JOptionPane.showConfirmDialog(null, "Confirm action?", "Confirmation", JOptionPane.YES_NO_OPTION);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showConfirmDialog()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use YES_NO_OPTION for choice, handle result, use for confirmations</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring result</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Confirmation dialog will appear. You can choose yes/no, get result.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (341, 'en', 'Dialog Master: Create Confirmation Dialog',
        'Create confirmation dialog via showConfirmDialog() with YES_NO_OPTION, save result')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (343, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Creating Message Dialog</h2>
<p class="intro">Message dialog allows notifying user. You can show information, warning, error, improve communication. Without dialog, you can''t notify.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>showMessageDialog()</code> — message dialog</li>
  <li>Displaying informational messages</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Message dialog is necessary for notifying user.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create dialog: <code>JOptionPane.showMessageDialog(null, "Operation completed", "Information", JOptionPane.INFORMATION_MESSAGE);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showMessageDialog()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use INFORMATION_MESSAGE for information, use WARNING_MESSAGE for warning, use ERROR_MESSAGE for error</li>
  <li><strong>⚠️ Avoid:</strong> Using inappropriate type</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Message dialog will appear. You can notify user.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (343, 'en', 'Dialog Master: Create Message Dialog',
        'Create message dialog via showMessageDialog() with INFORMATION_MESSAGE')
ON CONFLICT (task_id, language_code) DO NOTHING;
