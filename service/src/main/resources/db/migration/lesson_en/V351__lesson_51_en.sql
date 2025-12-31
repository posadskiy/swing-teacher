-- Flyway migration V3: Lesson 51
-- This migration contains lesson, tasks, and documentation for lesson 51

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (448, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Custom Component</h2>
<p class="intro">Custom components allow creating unique elements. You can create component with needed behavior, graphics, functionality. Without custom components, you can only use standard ones.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Extending <code>JComponent</code> — base class</li>
  <li>Creating custom component</li>
  <li>Overriding methods</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom components are necessary for creating unique interface elements.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create class extending JComponent: <code>class MyComponent extends JComponent {<br>
&nbsp;&nbsp;public MyComponent() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;setPreferredSize(new Dimension(200, 100));<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;protected void paintComponent(Graphics g) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;super.paintComponent(g);<br>
&nbsp;&nbsp;&nbsp;&nbsp;// Custom rendering<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Extend JComponent for base functionality</li>
  <li><strong>✅ Great:</strong> Set preferred size, override <code>paintComponent()</code> for rendering, add custom functionality</li>
  <li><strong>⚠️ Avoid:</strong> Not setting size — may be layout issue</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Custom component will appear. You can create component with needed behavior.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (448, 'en', 'Custom Component Beginner: Create Your Component',
        'Create class extending JComponent, set preferred size 200x100, override paintComponent()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (449, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Setting Preferred Size in Custom Component</h2>
<p class="intro">Sizes affect layout. Layout manager uses preferred size for placement, improve arrangement. Without sizes, size will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setPreferredSize(Dimension)</code> — setting size</li>
  <li>Method <code>setMinimumSize(Dimension)</code> — minimum size</li>
  <li>Method <code>setMaximumSize(Dimension)</code> — maximum size</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Sizes are necessary for proper component layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set preferred size: <code>setPreferredSize(new Dimension(300, 200));</code></li>
  <li>Set minimum size: <code>setMinimumSize(new Dimension(100, 50));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPreferredSize()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use <code>setMinimumSize()</code> for limiting, use <code>setMaximumSize()</code> for limiting, use for layout</li>
  <li><strong>⚠️ Avoid:</strong> Setting too small or large sizes</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will have set sizes. Layout manager will consider them when placing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (449, 'en', 'Custom Component Master: Set Preferred Size',
        'Create custom component, set preferred size 300x200 via setPreferredSize()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (450, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Events in Custom Component</h2>
<p class="intro">Event handling makes component interactive. You can respond to clicks, key presses, mouse movements, create interactive elements. Without handling, component will be static.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Adding event listeners</li>
  <li>Handling mouse and keyboard</li>
  <li>Creating interactive components</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Event handling is necessary for creating interactive components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add mouse listener: <code>addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Click!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addMouseListener()</code> for mouse</li>
  <li><strong>✅ Great:</strong> Use <code>addKeyListener()</code> for keyboard, use MouseAdapter for convenience, create interactive components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring events</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will respond to events. You can create interactive component.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (450, 'en', 'Custom Component Master: Handle Events',
        'Create custom component, add MouseListener, handle mouseClicked(), output message')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (451, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Adding Custom Properties to Component</h2>
<p class="intro">Custom properties extend functionality. You can add properties, manage state, configure component. Without properties, component will be basic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Adding private fields</li>
  <li>Getters and setters</li>
  <li>Managing component state</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom properties are necessary for extending component functionality.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add private field: <code>private String text = "Text";</code></li>
  <li>Add getter and setter: <code>public String getText() { return text; }<br>
public void setText(String text) { this.text = text; repaint(); }</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Private fields</li>
  <li><strong>✅ Great:</strong> Use getters and setters, call <code>repaint()</code> on change, manage state</li>
  <li><strong>⚠️ Avoid:</strong> Using public fields</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will have custom properties. You can configure component through properties.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (451, 'en', 'Custom Component Master: Add Custom Properties',
        'Create custom component, add private field text, create getter and setter, in setter call repaint()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (452, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Adding Tooltip to Custom Component</h2>
<p class="intro">Tooltip helps user. You can show additional information, explain component purpose, improve understanding. Without tooltip, user may not understand component purpose.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setToolTipText(String)</code> — setting tooltip</li>
  <li>Showing information on hover</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Tooltip is necessary for improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set tooltip: <code>setToolTipText("This is custom component");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setToolTipText()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use informative tooltips, explain component purpose, use for helping user</li>
  <li><strong>⚠️ Avoid:</strong> Using too long tooltips</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On mouse hover, tooltip will appear. This is popup tooltip with information. You can improve user experience.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (452, 'en', 'Custom Component Master: Add Tooltip',
        'Create custom component, set tooltip "Custom component" via setToolTipText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
