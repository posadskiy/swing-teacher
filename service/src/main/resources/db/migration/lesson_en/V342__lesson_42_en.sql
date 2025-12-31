-- Flyway migration V3: Lesson 42
-- This migration contains lesson, tasks, and documentation for lesson 42

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (356, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Switchable Panels with CardLayout</h2>
<p class="intro">CardLayout is perfect for multi-page interfaces. Setup wizards, tabs, step-by-step forms — all of this requires CardLayout. Without it, you''ll have to hide/show components manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>CardLayout</code> — panel switching</li>
  <li>Methods <code>show()</code>, <code>next()</code>, <code>previous()</code> — switching</li>
  <li>Creating multi-page interface</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>CardLayout is necessary for creating multi-page interfaces.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create manager: <code>CardLayout cardLayout = new CardLayout();<br>
setLayout(cardLayout);</code></li>
  <li>Add panels with names: <code>add(panel1, "card1");<br>
add(panel2, "card2");</code></li>
  <li>Switch panel: <code>cardLayout.show(this, "card1");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear names for cards</li>
  <li><strong>✅ Great:</strong> Use <code>show()</code> for switching by name, use <code>next()</code> and <code>previous()</code> for navigation</li>
  <li><strong>⚠️ Avoid:</strong> Too many cards — difficult to manage</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Only one panel will be visible. When switching, one panel hides, another shows. It''s like flipping pages.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (356, 'en', 'CardLayout Beginner: Create Switchable Panels',
        'Create CardLayout, add two panels with names "card1" and "card2", show "card1"')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (357, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Navigation Between Cards in CardLayout</h2>
<p class="intro">Navigation between cards makes interface interactive. You can create setup wizards, step-by-step forms, tabs. Without navigation, user won''t be able to switch between panels.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>next()</code> — next card</li>
  <li>Method <code>previous()</code> — previous card</li>
  <li>Methods <code>first()</code> and <code>last()</code> — first and last card</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Navigation between cards is necessary for creating interactive interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Switch to next card: <code>cardLayout.next(this);</code></li>
  <li>Or switch to previous: <code>cardLayout.previous(this);</code></li>
  <li>Or switch to first: <code>cardLayout.first(this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>next()</code> for forward navigation</li>
  <li><strong>✅ Great:</strong> Use <code>previous()</code> for backward navigation, use <code>first()</code> and <code>last()</code> for edge navigation, use <code>show()</code> for specific card navigation</li>
  <li><strong>⚠️ Avoid:</strong> Switching without checking — may cause error</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Cards will switch. When calling next(), next card will show, previous() — previous. You can create navigation between panels.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (357, 'en', 'CardLayout Master: Navigation Between Cards',
        'Switch to next card via next(), then to previous via previous()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (359, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Configuring Weight in GridBagLayout</h2>
<p class="intro">Weight determines how components stretch. You can specify which components get extra space when size changes. Without weight, components won''t stretch.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Fields <code>weightx</code> and <code>weighty</code> — component weights</li>
  <li>Distributing extra space</li>
  <li>Creating flexible layouts</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Weight is necessary for managing component stretching when size changes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create constraints: <code>GridBagConstraints gbc = new GridBagConstraints();</code></li>
  <li>Set weights: <code>gbc.weightx = 1.0;<br>
gbc.weighty = 1.0;</code></li>
  <li>Add component: <code>add(component, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> weightx for horizontal weight</li>
  <li><strong>✅ Great:</strong> Use weighty for vertical weight, use 1.0 for even distribution, use 0.0 for fixed size</li>
  <li><strong>⚠️ Avoid:</strong> Too large weights — may be unpredictable</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will stretch according to weight. When size changes, components with weight will get extra space.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (359, 'en', 'GridBagLayout Master: Configure Weight',
        'Create GridBagConstraints, set weightx and weighty to 1.0, add component with constraints')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (358, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Determining Current Card in CardLayout</h2>
<p class="intro">Determining current card allows managing navigation. You can show correct buttons, update state, log transitions. Without this, you can''t know which card user is on.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Determining currently visible card</li>
  <li>Working with card names</li>
  <li>Checking CardLayout state</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Determining current card is necessary for managing navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Store card names: <code>String currentCard = "card1";</code></li>
  <li>Update when switching: <code>cardLayout.show(this, "card2");<br>
currentCard = "card2";</code></li>
  <li>Or use components: <code>Component[] components = getComponents();<br>
for (Component comp : components) {<br>
&nbsp;&nbsp;if (comp.isVisible()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Visible card: " + comp.getName());<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Store current card name in variable</li>
  <li><strong>✅ Great:</strong> Use <code>isVisible()</code> for checking visibility, use <code>getName()</code> for getting component name, create <code>getCurrentCard()</code> method for convenience</li>
  <li><strong>⚠️ Avoid:</strong> Checking all components every time — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to know current card. You can check which card is visible and perform actions based on that.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (358, 'en', 'CardLayout Master: Know Current Card',
        'Get all components, check isVisible() for each, output visible component name')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (360, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Configuring Fill in GridBagLayout</h2>
<p class="intro">Fill determines how component stretches. You can specify in which direction component will fill cell. Without fill, component will be minimum size.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Field <code>fill</code> — component fill</li>
  <li>Fill constants (NONE, HORIZONTAL, VERTICAL, BOTH)</li>
  <li>Creating stretching components</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Fill is necessary for managing component stretching in cell.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create constraints: <code>GridBagConstraints gbc = new GridBagConstraints();</code></li>
  <li>Set fill: <code>gbc.fill = GridBagConstraints.BOTH;</code></li>
  <li>Add component: <code>add(component, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> BOTH for filling in both directions</li>
  <li><strong>✅ Great:</strong> Use HORIZONTAL for horizontal, use VERTICAL for vertical, use NONE for minimum size</li>
  <li><strong>⚠️ Avoid:</strong> BOTH for all — may be messy</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will fill cell. Component will stretch according to fill.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (360, 'en', 'GridBagLayout Master: Configure Fill',
        'Create GridBagConstraints, set fill = BOTH, add component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (361, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Configuring Anchor in GridBagLayout</h2>
<p class="intro">Anchor determines component position. You can place component in center, corners, edges of cell. Without anchor, component will be in standard position.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Field <code>anchor</code> — component anchor</li>
  <li>Anchor constants (CENTER, NORTH, SOUTH, EAST, WEST)</li>
  <li>Positioning component in cell</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Anchor is necessary for precise component positioning in cell.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create constraints: <code>GridBagConstraints gbc = new GridBagConstraints();</code></li>
  <li>Set anchor: <code>gbc.anchor = GridBagConstraints.NORTH;</code></li>
  <li>Add component: <code>add(component, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> CENTER for center</li>
  <li><strong>✅ Great:</strong> Use NORTH, SOUTH for vertical, use EAST, WEST for horizontal, use combinations (NORTHWEST, SOUTHEAST)</li>
  <li><strong>⚠️ Avoid:</strong> Too complex combinations</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will be in specified position. Component will be placed according to anchor.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (361, 'en', 'GridBagLayout Master: Configure Anchor',
        'Create GridBagConstraints, set anchor = NORTH, add component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (362, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Configuring Insets in GridBagLayout</h2>
<p class="intro">Insets create space around component. You can specify insets from top, bottom, left, right, improve layout. Without insets, components will be pressed against each other.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>Insets</code> — insets</li>
  <li>Field <code>insets</code> — setting insets</li>
  <li>Creating space around component</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Insets are necessary for creating space around component.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create constraints: <code>GridBagConstraints gbc = new GridBagConstraints();</code></li>
  <li>Set insets: <code>gbc.insets = new Insets(5, 5, 5, 5);</code></li>
  <li>Add component: <code>add(component, gbc);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Insets for gaps</li>
  <li><strong>✅ Great:</strong> Specify insets for all sides, use reasonable values, use for improving layout</li>
  <li><strong>⚠️ Avoid:</strong> Too large insets — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Insets will appear around component. Component will have specified insets.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (362, 'en', 'GridBagLayout Master: Configure Insets',
        'Create GridBagConstraints, set insets = new Insets(5,5,5,5), add component')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (363, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Setting Preview Panel in JColorChooser</h2>
<p class="intro">Preview panel improves user experience. You can show custom preview, improve visualization. Without panel, there will be standard preview.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreviewPanel()</code> — setting preview panel</li>
  <li>Custom preview panel</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Preview panel is necessary for improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create panel: <code>JPanel previewPanel = new JPanel();</code></li>
  <li>Set panel: <code>colorChooser.setPreviewPanel(previewPanel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreviewPanel()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use custom panel, use for improving UX, improve visualization</li>
  <li><strong>⚠️ Avoid:</strong> Too complex panel</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Instead of standard panel, there will be custom. You can improve visualization.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (363, 'en', 'Color Selection Master: Set Preview Panel',
        'Create JPanel, set via setPreviewPanel()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (364, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Showing First Card in CardLayout</h2>
<p class="intro">First card allows returning to start. You can go to first card, improve navigation. Without this, you need to switch manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>first()</code> — first card</li>
  <li>Going to first card</li>
  <li>Improving navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Going to first card is necessary for improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get layout: <code>CardLayout layout = (CardLayout) container.getLayout();</code></li>
  <li>Show first card: <code>layout.first(container);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>first()</code> for navigation</li>
  <li><strong>✅ Great:</strong> Use for navigation, combine with <code>last()</code>, <code>next()</code>, <code>previous()</code>, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Switching without container</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>First card will be shown. You can return to start.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (364, 'en', 'CardLayout Master: Show First Card',
        'Get CardLayout via getLayout(), cast to CardLayout, call first(container)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (365, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Getting Color Selection Model</h2>
<p class="intro">Selection model allows managing color. You can get access to model, change color programmatically, improve functionality. Without access, you can''t manage color.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getSelectionModel()</code> — getting selection model</li>
  <li>Access to color model</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Selection model is necessary for programmatic color management.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get model: <code>ColorSelectionModel model = colorChooser.getSelectionModel();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getSelectionModel()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for managing color, use for programmatic changes, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Changing without necessity</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get access to selection model. You can manage color programmatically.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (365, 'en', 'Color Selection Master: Get Selection Model', 'Get selection model via getSelectionModel()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (366, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Showing Last Card in CardLayout</h2>
<p class="intro">Last card allows going to end. You can go to last card, improve navigation. Without this, you need to switch manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>last()</code> — last card</li>
  <li>Going to last card</li>
  <li>Improving navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Going to last card is necessary for improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get layout: <code>CardLayout layout = (CardLayout) container.getLayout();</code></li>
  <li>Show last card: <code>layout.last(container);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>last()</code> for navigation</li>
  <li><strong>✅ Great:</strong> Use for navigation, combine with <code>first()</code>, <code>next()</code>, <code>previous()</code>, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Switching without container</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Last card will be shown. You can go to end.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (366, 'en', 'CardLayout Master: Show Last Card',
        'Get CardLayout via getLayout(), cast to CardLayout, call last(container)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (367, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Showing Next Card in CardLayout</h2>
<p class="intro">Next card allows going forward. You can go to next card, improve navigation. Without this, you need to switch manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>next()</code> — next card</li>
  <li>Going to next card</li>
  <li>Improving navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Going to next card is necessary for improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get layout: <code>CardLayout layout = (CardLayout) container.getLayout();</code></li>
  <li>Show next card: <code>layout.next(container);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>next()</code> for navigation</li>
  <li><strong>✅ Great:</strong> Use for navigation, combine with <code>previous()</code>, <code>first()</code>, <code>last()</code>, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Switching without container</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Next card will be shown. You can go forward.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (367, 'en', 'CardLayout Master: Show Next Card',
        'Get CardLayout via getLayout(), cast to CardLayout, call next(container)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (368, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Setting Color in JColorChooser</h2>
<p class="intro">Color determines current selection. You can set initial color, get selected, improve management. Without setting, color will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setColor()</code> — setting color</li>
  <li>Method <code>getColor()</code> — getting color</li>
  <li>Managing color</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Setting color is necessary for managing color selection.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set color: <code>colorChooser.setColor(Color.RED);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setColor()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use <code>getColor()</code> for getting, use Color constants, improve management</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring selected color</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Color will be set. You can manage color selection.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (368, 'en', 'Color Selection Master: Set Color', 'Set color RED via setColor(Color.RED)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (369, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Showing Previous Card in CardLayout</h2>
<p class="intro">Previous card allows going back. You can go to previous card, improve navigation. Without this, you need to switch manually.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>previous()</code> — previous card</li>
  <li>Going to previous card</li>
  <li>Improving navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Going to previous card is necessary for improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get layout: <code>CardLayout layout = (CardLayout) container.getLayout();</code></li>
  <li>Show previous card: <code>layout.previous(container);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>previous()</code> for navigation</li>
  <li><strong>✅ Great:</strong> Use for navigation, combine with <code>next()</code>, <code>first()</code>, <code>last()</code>, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Switching without container</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Previous card will be shown. You can go back.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (369, 'en', 'CardLayout Master: Show Previous Card',
        'Get CardLayout via getLayout(), cast to CardLayout, call previous(container)')
ON CONFLICT (task_id, language_code) DO NOTHING;
