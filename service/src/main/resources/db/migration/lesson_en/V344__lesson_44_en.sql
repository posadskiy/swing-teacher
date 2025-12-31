-- Flyway migration V3: Lesson 44
-- This migration contains lesson, tasks, and documentation for lesson 44

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (383, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Spring Layout with SpringLayout</h2>
<p class="intro">SpringLayout allows creating flexible layouts. Components can "attract" each other through springs. This gives maximum control over placement.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>SpringLayout</code> — spring layout</li>
  <li>Class <code>Spring</code> — spring</li>
  <li>Creating spring connections</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>SpringLayout is necessary for creating flexible layouts with maximum control.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set manager: <code>SpringLayout layout = new SpringLayout();<br>
setLayout(layout);</code></li>
  <li>Add component: <code>add(button);</code></li>
  <li>Set spring connections: <code>layout.putConstraint(SpringLayout.WEST, button, 10, SpringLayout.WEST, this);<br>
layout.putConstraint(SpringLayout.NORTH, button, 10, SpringLayout.NORTH, this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>putConstraint()</code> for setting connections</li>
  <li><strong>✅ Great:</strong> Link components to each other, use <code>Spring.constant()</code> for fixed values</li>
  <li><strong>⚠️ Avoid:</strong> Too many connections — difficult to manage</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed with spring connections. When window size changes, components will "attract" each other.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (383, 'en', 'SpringLayout Beginner: Create Spring Layout',
        'Set SpringLayout, add button, set WEST and NORTH connections with gap 10 from container edge')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (384, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Linking Components to Each Other in SpringLayout</h2>
<p class="intro">Linking components creates flexible layout. Components will maintain distances from each other when window size changes. Without this, components may "spread apart".</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Linking components to each other</li>
  <li>Creating spring connections between components</li>
  <li>Configuring distances between components</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Linking components is necessary for creating flexible layout with distance preservation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add components: <code>add(button1);<br>
add(button2);</code></li>
  <li>Link components: <code>layout.putConstraint(SpringLayout.EAST, button1, 10, SpringLayout.WEST, button2);</code></li>
  <li>Or link vertically: <code>layout.putConstraint(SpringLayout.SOUTH, button1, 10, SpringLayout.NORTH, button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Link components via <code>putConstraint()</code></li>
  <li><strong>✅ Great:</strong> Use EAST-WEST for horizontal link, use SOUTH-NORTH for vertical link, link to container for edge binding</li>
  <li><strong>⚠️ Avoid:</strong> Too many connections — difficult to manage</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be linked to each other. When window size changes, they will maintain distances.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (384, 'en', 'SpringLayout Master: Link Components to Each Other',
        'Add two buttons, link EAST of first button to WEST of second with gap 10')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (386, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Determining Click Count in MouseListener</h2>
<p class="intro">Click count allows distinguishing actions. Single click for selection, double for opening — all of this requires determining click count. Without this, you can''t distinguish click types.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getClickCount()</code> — click count</li>
  <li>Distinguishing single and double click</li>
  <li>Handling different click types</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Determining click count is necessary for distinguishing action types.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle click: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getClickCount() == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Double click!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getClickCount()</code> for checking</li>
  <li><strong>✅ Great:</strong> Handle single click (1), handle double click (2), handle triple click (3)</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring count — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to distinguish click types. On single click one action will execute, on double — another.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (386, 'en', 'MouseListener Master: Determine Click Count',
        'Add MouseListener, check getClickCount() == 2 for double click, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (385, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Using Spring Arithmetic in SpringLayout</h2>
<p class="intro">Spring arithmetic allows creating complex layouts. You can calculate distances, create dependencies, make adaptive interfaces. Without this, you''ll have to use only fixed values.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>Spring.sum()</code>, <code>Spring.max()</code>, <code>Spring.min()</code></li>
  <li>Arithmetic operations with springs</li>
  <li>Creating complex spring connections</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Spring arithmetic is necessary for creating complex layouts with calculated distances.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create springs: <code>Spring spring1 = Spring.constant(10);<br>
Spring spring2 = Spring.constant(20);</code></li>
  <li>Add springs: <code>Spring sum = Spring.sum(spring1, spring2);</code></li>
  <li>Use in connection: <code>layout.putConstraint(SpringLayout.WEST, button, sum, SpringLayout.WEST, this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>Spring.sum()</code> for addition</li>
  <li><strong>✅ Great:</strong> Use <code>Spring.max()</code> for maximum, use <code>Spring.min()</code> for minimum, combine multiple operations</li>
  <li><strong>⚠️ Avoid:</strong> Too complex calculations — may be unclear</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Springs will be calculated mathematically. Distances will depend on other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (385, 'en', 'SpringLayout Master: Use Spring Arithmetic',
        'Create two springs via Spring.constant(10) and Spring.constant(20), add them via Spring.sum(), use in putConstraint')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (387, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Determining Mouse Button in MouseListener</h2>
<p class="intro">Determining button allows distinguishing actions. Left button for selection, right for context menu — all of this requires determining button. Without this, you can''t distinguish buttons.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getButton()</code> — getting button</li>
  <li>Button constants (BUTTON1, BUTTON2, BUTTON3)</li>
  <li>Distinguishing left, right and middle button</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Determining button is necessary for distinguishing actions depending on pressed button.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle click: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getButton() == MouseEvent.BUTTON1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Left button!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getButton()</code> for checking</li>
  <li><strong>✅ Great:</strong> Use BUTTON1 for left, use BUTTON2 for middle, use BUTTON3 for right</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring button — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to distinguish mouse buttons. When clicking, you can determine which button is pressed.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (387, 'en', 'MouseListener Master: Determine Mouse Button',
        'Add MouseListener, check getButton() == BUTTON1, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (390, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Requesting Focus in FocusListener</h2>
<p class="intro">Requesting focus allows managing focus. You can programmatically set focus, improve navigation. Without request, focus will be set automatically.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>requestFocus()</code> — requesting focus</li>
  <li>Method <code>requestFocusInWindow()</code> — requesting focus in window</li>
  <li>Managing focus</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Requesting focus is necessary for programmatic focus management.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Request focus: <code>component.requestFocusInWindow();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>requestFocusInWindow()</code> for requesting</li>
  <li><strong>✅ Great:</strong> Use for managing focus, improve navigation, use for improving UX</li>
  <li><strong>⚠️ Avoid:</strong> Requesting too often</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will get focus. You can programmatically set focus.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (390, 'en', 'FocusListener Master: Request Focus', 'Request focus via requestFocusInWindow()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (388, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Determining Mouse Position in MouseListener</h2>
<p class="intro">Mouse position allows determining click location. You can know where click occurred, handle context action. Without position, you can''t determine click location.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getX()</code> — X coordinate</li>
  <li>Method <code>getY()</code> — Y coordinate</li>
  <li>Determining cursor position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Determining mouse position is necessary for handling context actions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle click: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int x = e.getX();<br>
&nbsp;&nbsp;&nbsp;&nbsp;int y = e.getY();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Position: (" + x + ", " + y + ")");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getX()</code> for X</li>
  <li><strong>✅ Great:</strong> Use <code>getY()</code> for Y, use <code>getPoint()</code> for point, use for context actions</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring position</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get mouse position. When clicking, you can know coordinates.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (388, 'en', 'MouseListener Master: Determine Mouse Position',
        'Add MouseListener, get X via getX(), Y via getY(), output position')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (393, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Managing Focusability in FocusListener</h2>
<p class="intro">Focusability determines focus availability. You can make component unavailable for focus, improve navigation. Without management, all components are focusable.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setFocusable()</code> — setting focusability</li>
  <li>Method <code>isFocusable()</code> — checking focusability</li>
  <li>Managing focus availability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing focusability is necessary for improving navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Disable focus: <code>component.setFocusable(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setFocusable()</code> for managing</li>
  <li><strong>✅ Great:</strong> Use false for disabling, use true for enabling, improve navigation</li>
  <li><strong>⚠️ Avoid:</strong> Disabling for interactive components</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will be unavailable for focus. You can improve navigation.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (393, 'en', 'FocusListener Master: Manage Focusability', 'Disable focus via setFocusable(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (389, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Determining Click Count in MouseListener</h2>
<p class="intro">Click count allows distinguishing types. You can handle single, double, triple click, create different actions. Without checking, you can''t distinguish types.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getClickCount()</code> — getting count</li>
  <li>Distinguishing single and double click</li>
  <li>Handling different click types</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Determining click count is necessary for distinguishing action types.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Handle click: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getClickCount() == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Double click!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getClickCount()</code> for checking</li>
  <li><strong>✅ Great:</strong> Check == 1 for single, check == 2 for double, check == 3 for triple</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring count</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to determine click count. When clicking, you can know if single, double or triple click.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (389, 'en', 'MouseListener Master: Determine Click Count',
        'Add MouseListener, check getClickCount() == 2, output message')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (396, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Getting Focus Owner in FocusListener</h2>
<p class="intro">Focus owner determines active component. You can get component with focus, handle it, improve functionality. Without getting, you can''t determine active component.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>KeyboardFocusManager</code> — focus manager</li>
  <li>Method <code>getFocusOwner()</code> — getting owner</li>
  <li>Determining component with focus</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting focus owner is necessary for determining active component.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get owner: <code>Component owner = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getFocusOwner()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use KeyboardFocusManager, check for null, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring null</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get component with focus. You can handle active component.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (396, 'en', 'FocusListener Master: Get Focus Owner',
        'Get focus owner via KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (391, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Getting Constraint in SpringLayout</h2>
<p class="intro">Getting constraint allows managing position. You can get constraint, change it, improve management. Without getting, you can''t change constraint.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getConstraint()</code> — getting constraint</li>
  <li>Getting component constraints</li>
  <li>Managing constraints</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting constraint is necessary for managing component position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get constraint: <code>SpringLayout.Constraints constraints = layout.getConstraints(component);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getConstraints()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for management, change constraints, improve management</li>
  <li><strong>⚠️ Avoid:</strong> Changing without necessity</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get component constraints. You can change position, size.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (391, 'en', 'SpringLayout Master: Get Constraint', 'Get component constraints via getConstraints()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (392, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Setting Constraint in SpringLayout</h2>
<p class="intro">Constraint links components. You can set distance between components, improve layout. Without constraint, components won''t be linked.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>putConstraint()</code> — setting constraint</li>
  <li>Linking components</li>
  <li>Improving layout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Constraint is necessary for linking components and improving layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set constraint: <code>layout.putConstraint(SpringLayout.WEST, component2, 10, SpringLayout.EAST, component1);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>putConstraint()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use SpringLayout.WEST, EAST for sides, use for linking, improve layout</li>
  <li><strong>⚠️ Avoid:</strong> Creating conflicting constraints</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be linked by constraint. You can set distance between components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (392, 'en', 'SpringLayout Master: Set Constraint',
        'Set constraint via putConstraint(WEST, component2, 10, EAST, component1)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (394, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Creating Spring in SpringLayout</h2>
<p class="intro">Spring determines constraint elasticity. You can create spring with needed parameters, improve layout. Without spring, constraint will be rigid.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>Spring</code> — spring</li>
  <li>Method <code>Spring.constant()</code> — creating constant spring</li>
  <li>Creating springs for constraints</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Spring is necessary for creating elastic constraints.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create spring: <code>Spring spring = Spring.constant(100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>Spring.constant()</code> for creating</li>
  <li><strong>✅ Great:</strong> Use for constraints, use for layout, improve placement</li>
  <li><strong>⚠️ Avoid:</strong> Creating too rigid springs</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Spring will be created. You can use for constraints.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (394, 'en', 'SpringLayout Master: Create Spring', 'Create spring 100 via Spring.constant(100)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (395, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Getting Constraint in SpringLayout</h2>
<p class="intro">Constraint determines position. You can get component constraint, change it, improve functionality. Without getting, you can''t change constraint.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getConstraint()</code> — getting constraint</li>
  <li>Access to component constraints</li>
  <li>Improving functionality</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Getting constraint is necessary for changing component position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get constraint: <code>SpringLayout.Constraints constraints = layout.getConstraints(component);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getConstraints()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for accessing constraints, use for changing, improve functionality</li>
  <li><strong>⚠️ Avoid:</strong> Changing without necessity</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get component constraint. You can change position.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (395, 'en', 'SpringLayout Master: Get Constraint', 'Get constraint via getConstraints(component)')
ON CONFLICT (task_id, language_code) DO NOTHING;
