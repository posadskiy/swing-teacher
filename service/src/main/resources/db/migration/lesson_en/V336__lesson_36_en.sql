-- Flyway migration V3: Lesson 36
-- This migration contains lesson, tasks, and documentation for lesson 36

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (301, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Opening Color Palette</h2>
<p class="intro">JColorChooser allows choosing any color. Theme settings, background color selection, interface customization — all of this requires color selection. Without it, user is limited to preset colors.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JColorChooser</code> — color selection dialog</li>
  <li>Creating color selection dialog</li>
  <li>Getting selected color</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>JColorChooser is necessary for color selection in application.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show color selection dialog: <code>Color color = JColorChooser.showDialog(frame, "Choose color", Color.WHITE);</code></li>
  <li>Use selected color: <code>if (color != null) {<br>
&nbsp;&nbsp;panel.setBackground(color);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check for null — user may have canceled</li>
  <li><strong>✅ Great:</strong> Specify initial color — will show it when opening, use selected color for component settings</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring null — may be error</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Color selection dialog will appear. This is window with color palette. You can select color from spectrum, tabs or enter RGB values. After selection, you''ll get Color object.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (301, 'en', 'Color Selection Beginner: Open Color Palette',
        'Show color selection dialog with initial color WHITE and use selected color')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (302, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Creating Custom Color Selection Dialog</h2>
<p class="intro">Custom dialog allows configuring color selection. You can add additional buttons, change title, add handlers. Without this, you''ll have to use standard dialog.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Creating <code>JColorChooser</code> as component</li>
  <li>Method <code>createDialog()</code> — creating dialog</li>
  <li>Configuring color selection dialog</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom dialog is necessary for extended color selection configuration.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create color chooser: <code>JColorChooser colorChooser = new JColorChooser(Color.WHITE);</code></li>
  <li>Create dialog: <code>JDialog dialog = JColorChooser.createDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Choose color",<br>
&nbsp;&nbsp;true,<br>
&nbsp;&nbsp;colorChooser,<br>
&nbsp;&nbsp;null,<br>
&nbsp;&nbsp;null<br>
);</code></li>
  <li>Show dialog: <code>dialog.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>createDialog()</code> for creating dialog</li>
  <li><strong>✅ Great:</strong> Add handlers for OK and Cancel buttons, configure initial color</li>
  <li><strong>⚠️ Avoid:</strong> Too complex configuration — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Custom color selection dialog will appear. You can configure it for your needs, add handlers.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (302, 'en', 'Color Selection Master: Create Custom Dialog',
        'Create JColorChooser with initial color WHITE, create dialog via createDialog, show dialog')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (304, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Using All BorderLayout Regions</h2>
<p class="intro">Using all regions creates structured interface. Header at top, toolbar at bottom, content in center — all of this requires all regions. Without this, interface will be incomplete.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>All BorderLayout regions (NORTH, SOUTH, EAST, WEST, CENTER)</li>
  <li>Placing components in all regions</li>
  <li>Creating complex layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Using all regions is necessary for creating structured interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set manager: <code>setLayout(new BorderLayout());</code></li>
  <li>Add to all regions: <code>add(buttonNorth, BorderLayout.NORTH);<br>
add(buttonSouth, BorderLayout.SOUTH);<br>
add(buttonEast, BorderLayout.EAST);<br>
add(buttonWest, BorderLayout.WEST);<br>
add(panelCenter, BorderLayout.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> All regions for structure</li>
  <li><strong>✅ Great:</strong> CENTER for main content, NORTH/SOUTH for headers and panels, EAST/WEST for side panels</li>
  <li><strong>⚠️ Avoid:</strong> Too many components in one region</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed in all regions. Each component will take its region. CENTER will take remaining space.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (304, 'en', 'BorderLayout Master: Use All Regions',
        'Set BorderLayout, add components to all five regions (NORTH, SOUTH, EAST, WEST, CENTER)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (303, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Configuring Color Selection Modes</h2>
<p class="intro">Configuring selection modes makes palette convenient. You can show only needed tabs, hide unnecessary ones. Without this, user will see all tabs, even if they''re not needed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setChooserPanels()</code> — configuring selection panels</li>
  <li>Class <code>ColorChooserComponentFactory</code> — component factory</li>
  <li>Configuring color selection modes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring selection modes is necessary for simplifying color selection interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get default panels: <code>AbstractColorChooserPanel[] panels = ColorChooserComponentFactory.getDefaultChooserPanels();</code></li>
  <li>Set panels: <code>colorChooser.setChooserPanels(panels);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getDefaultChooserPanels()</code> for standard panels</li>
  <li><strong>✅ Great:</strong> Create custom selection panels, filter panels, leaving only needed ones</li>
  <li><strong>⚠️ Avoid:</strong> Removing all panels — user won''t be able to select color</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Only needed tabs will be in color selection dialog. You can configure which selection modes to show.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (303, 'en', 'Color Selection Master: Configure Selection Modes',
        'Get standard panels via getDefaultChooserPanels(), set them in colorChooser')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (306, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Adding Gaps in BorderLayout</h2>
<p class="intro">Gaps make layout neat. Components won''t be pressed against each other, there will be visual separation. Without gaps, components will be pressed to edges.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setHgap()</code> — horizontal gap</li>
  <li>Method <code>setVgap()</code> — vertical gap</li>
  <li>Configuring gaps in BorderLayout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gaps are necessary for creating neat layout with visual separation of components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create manager: <code>BorderLayout layout = new BorderLayout();</code></li>
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
<p>Gaps will appear between regions. Components won''t be pressed against each other. Layout will look neat.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (306, 'en', 'BorderLayout Master: Add Gaps',
        'Create BorderLayout, set horizontal and vertical gaps to 10')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (305, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Preview Panel</h2>
<p class="intro">Preview panel shows selected color. You can see how color will look before applying. Without preview, you''ll have to apply color to see result.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreviewPanel()</code> — setting preview panel</li>
  <li>Creating custom preview panel</li>
  <li>Displaying selected color</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Preview panel is necessary for visualizing selected color before applying.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create panel: <code>JPanel previewPanel = new JPanel();<br>
previewPanel.setPreferredSize(new Dimension(100, 50));</code></li>
  <li>Set panel: <code>colorChooser.setPreviewPanel(previewPanel);</code></li>
  <li>Update color: <code>colorChooser.getSelectionModel().addChangeListener(e -> {<br>
&nbsp;&nbsp;previewPanel.setBackground(colorChooser.getColor());<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreviewPanel()</code> for setting</li>
  <li><strong>✅ Great:</strong> Update color via ChangeListener, show additional information, use custom panel</li>
  <li><strong>⚠️ Avoid:</strong> Too large panel — may be excessive</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Preview panel will appear in dialog. Panel will show selected color. Color will update when selecting.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (305, 'en', 'Color Selection Master: Add Preview Panel',
        'Create JPanel for preview, set via setPreviewPanel(), add ChangeListener for color update')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (307, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Working with Color Selection Model</h2>
<p class="intro">Model allows managing selection. You can get model, set color programmatically, track changes. Without model, you can''t manage selection.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getSelectionModel()</code> — getting model</li>
  <li>Working with ColorSelectionModel</li>
  <li>Managing color selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Model is necessary for programmatic color selection management.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get model: <code>ColorSelectionModel model = colorChooser.getSelectionModel();</code></li>
  <li>Set color: <code>model.setSelectedColor(Color.RED);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getSelectionModel()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use <code>setSelectedColor()</code> for setting, use <code>getSelectedColor()</code> for getting, use <code>addChangeListener()</code> for tracking</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring model</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to manage selection via model. Color can be set programmatically.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (307, 'en', 'Color Selection Master: Work with Model',
        'Get model via getSelectionModel(), set color RED via setSelectedColor()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (308, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Getting Selected Color</h2>
<p class="intro">Getting color allows using selection. You can get selected color, apply it to components. Without getting color, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getColor()</code> — getting color</li>
  <li>Method <code>showDialog()</code> — showing dialog</li>
  <li>Getting selected color</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting color is necessary for applying selected color to components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show dialog: <code>Color color = JColorChooser.showDialog(frame, "Choose color", Color.WHITE);</code></li>
  <li>Use color: <code>if (color != null) {<br>
&nbsp;&nbsp;component.setBackground(color);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>showDialog()</code> for showing</li>
  <li><strong>✅ Great:</strong> Check null for cancellation, use initial color, apply color to components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring null</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Color selection dialog will appear. You can select color and get it.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (308, 'en', 'Color Selection Master: Get Selected Color',
        'Show dialog via showDialog() with initial color WHITE, check result for null')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (309, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Configuring Color Model</h2>
<p class="intro">Color model determines selection. You can configure how color is selected, improve functionality. Without configuration, model will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setColorSelectionModel()</code> — setting model</li>
  <li>Configuring color selection</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Configuring color model is necessary for extended color selection management.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>DefaultColorSelectionModel model = new DefaultColorSelectionModel();<br>
model.setSelectedColor(Color.RED);</code></li>
  <li>Set model: <code>colorChooser.setColorSelectionModel(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setColorSelectionModel()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use DefaultColorSelectionModel, configure initial color, use for improving functionality</li>
  <li><strong>⚠️ Avoid:</strong> Incorrect model</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Color model will be configured. You can configure color selection.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (309, 'en', 'Color Selection Master: Configure Color Model',
        'Create DefaultColorSelectionModel, set color RED, set model via setColorSelectionModel()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (310, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Inserting Icon in JTextPane</h2>
<p class="intro">Icon improves visual appearance. You can insert image into text, improve formatting. Without icon, text will be only text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>insertIcon()</code> — inserting icon</li>
  <li>Inserting images into text</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Inserting icon is necessary for improving visual appearance of text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create icon: <code>ImageIcon icon = new ImageIcon("icon.png");</code></li>
  <li>Insert icon: <code>textPane.insertIcon(icon);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>insertIcon()</code> for inserting</li>
  <li><strong>✅ Great:</strong> Use ImageIcon for creating, use for improving appearance, improve formatting</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Icon will appear in text. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (310, 'en', 'Text Pane Master: Insert Icon', 'Create ImageIcon "icon.png", insert via insertIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (311, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Getting Styled Document</h2>
<p class="intro">Styled document allows managing styles. You can get access to styles, change formatting, improve functionality. Without access, you can''t manage styles.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getStyledDocument()</code> — getting styled document</li>
  <li>Access to document styles</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Access to styled document is necessary for managing styles and formatting.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get document: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getStyledDocument()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for managing styles, use for formatting, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Changing without necessity</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get access to styled document. You can manage styles, formatting.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (311, 'en', 'Text Pane Master: Get Styled Document',
        'Get styled document via getStyledDocument()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (312, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Creating Read-Only JTextPane</h2>
<p class="intro">Read-only protects content. You can prohibit editing, improve security. Without protection, content can be changed.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setEditable()</code> — setting editability</li>
  <li>Protection from changes</li>
  <li>Improving security</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Read-only mode is necessary for protecting content from changes.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Disable editing: <code>textPane.setEditable(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setEditable(false)</code> for disabling</li>
  <li><strong>✅ Great:</strong> Use for protection, improve security, use for viewing</li>
  <li><strong>⚠️ Avoid:</strong> Disabling for editable fields</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Text pane will be read-only. Content cannot be changed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (312, 'en', 'Text Pane Master: Make Read-Only', 'Disable editing via setEditable(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
