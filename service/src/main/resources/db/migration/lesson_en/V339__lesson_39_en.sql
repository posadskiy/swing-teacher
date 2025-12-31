-- Flyway migration V3: Lesson 39
-- This migration contains lesson, tasks, and documentation for lesson 39

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (325, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Placing Components in Grid with GridLayout</h2>
<p class="intro">GridLayout creates neat grid. Calculator, keyboard, game board — all of this is convenient to do in grid. All cells same size, looks professional.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>GridLayout</code> — grid layout manager</li>
  <li>Creating grid (rows × columns)</li>
  <li>Uniform component placement</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>GridLayout is necessary for creating neat grid with same cells.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set GridLayout: <code>setLayout(new GridLayout(2, 3));</code> // 2 rows, 3 columns</li>
  <li>Add components: <code>add(new JButton("1"));</code><br>
<code>add(new JButton("2"));</code><br>
<code>add(new JButton("3"));</code><br>
// and so on...</li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Specify rows and columns: <code>new GridLayout(rows, columns)</code></li>
  <li><strong>✅ Great:</strong> With gaps: <code>new GridLayout(2, 3, 5, 5)</code> — gaps 5px, zero rows or columns — calculated automatically</li>
  <li><strong>⚠️ Avoid:</strong> Too many rows/columns — cells will become small</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed in grid. This is neat table with same cells. All components will be same size. This is perfect for calculators and game boards.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (325, 'en', 'GridLayout Beginner: Place Components in Grid',
        'Set GridLayout 2x3 (2 rows, 3 columns) and add 6 buttons')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (328, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Creating Checkbox in Menu</h2>
<p class="intro">JCheckBoxMenuItem allows enabling/disabling options in menu. Show panels, enable modes, configure parameters — all of this requires checkboxes in menu. Without them, you''ll have to create separate dialogs.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>JCheckBoxMenuItem</code> — checkbox in menu</li>
  <li>Creating checkboxes in menu</li>
  <li>Adding to menu</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>JCheckBoxMenuItem is necessary for enabling/disabling options directly in menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create checkbox item: <code>JCheckBoxMenuItem item = new JCheckBoxMenuItem("Show panel");</code></li>
  <li>Add to menu: <code>menu.add(item);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Clear names</li>
  <li><strong>✅ Great:</strong> Set initial state via <code>setSelected()</code>, add ActionListener for handling</li>
  <li><strong>⚠️ Avoid:</strong> Too many checkboxes — may be overloaded</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Checkbox will appear in menu. You can click to enable/disable. Checkmark will appear or disappear.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (328, 'en', 'Checkbox Menu Item Beginner: Create Checkbox in Menu',
        'Create JCheckBoxMenuItem with text "Show panel", add to menu')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (326, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Detecting Mouse Click</h2>
<p class="intro">Detecting clicks allows reacting to user actions. Single click — selection, double click — opening. Without this, you can''t handle mouse interaction.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>mouseClicked()</code> — handling click</li>
  <li>Method <code>getClickCount()</code> — click count</li>
  <li>Handling single and double clicks</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Detecting clicks is necessary for handling mouse interaction.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Override mouseClicked: <code>@Override<br>
public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;if (e.getClickCount() == 1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Single click!");<br>
&nbsp;&nbsp;} else if (e.getClickCount() == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Double click!");<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Check click count via <code>getClickCount()</code></li>
  <li><strong>✅ Great:</strong> Handle single clicks separately from double, check mouse button: <code>e.getButton() == MouseEvent.BUTTON1</code></li>
  <li><strong>⚠️ Avoid:</strong> Handling all clicks same — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking, handler will trigger. You can determine single or double click.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (326, 'en', 'Mouse Master: Detect Mouse Click',
        'Override mouseClicked, check click count, handle single and double click')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (329, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Handling JCheckBoxMenuItem State Change</h2>
<p class="intro">Handling changes makes checkbox item interactive. You can update other components, perform actions, change modes. Without this, checkbox will be only for display.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling change via ActionListener</li>
  <li>Checking checkbox state</li>
  <li>Reacting to toggle</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling changes is necessary for creating interactive checkbox menu item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>item.addActionListener(e -> {<br>
&nbsp;&nbsp;if (item.isSelected()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enabled!");<br>
&nbsp;&nbsp;} else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Disabled!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>isSelected()</code> for checking</li>
  <li><strong>✅ Great:</strong> Update other components, use ItemListener for more precise handling</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When state changes, handler will trigger. You can check state and perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (329, 'en', 'Checkbox Menu Item Master: Handle Change',
        'Add ActionListener, check isSelected(), output message depending on state')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (327, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Handling Mouse Dragging</h2>
<p class="intro">Handling dragging allows creating interactive elements. Dragging windows, drawing, moving objects — all of this requires handling dragging. Without this, you can''t create interactive interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>MouseMotionListener</code> — handling mouse movement</li>
  <li>Method <code>mouseDragged()</code> — handling dragging</li>
  <li>Tracking dragging</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling dragging is necessary for creating interactive interface elements.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add MouseMotionListener: <code>component.addMouseMotionListener(new MouseMotionListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseDragged(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int x = e.getX();<br>
&nbsp;&nbsp;&nbsp;&nbsp;int y = e.getY();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Dragging: " + x + ", " + y);<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseMoved(MouseEvent e) {}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>mouseDragged()</code> for dragging</li>
  <li><strong>✅ Great:</strong> Save initial position in <code>mousePressed()</code>, calculate offset in <code>mouseDragged()</code>, update component position when dragging</li>
  <li><strong>⚠️ Avoid:</strong> Handling without checking pressed button — may be unexpected</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When dragging mouse, handler will trigger. You can track mouse movement with pressed button. You can move components, draw.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (327, 'en', 'Mouse Master: Handle Dragging',
        'Add MouseMotionListener, override mouseDragged(), get coordinates and output them')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (330, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Working with JCheckBoxMenuItem State Model</h2>
<p class="intro">Model allows controlling state. You can get model, change it programmatically. Without model, you can''t control state.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getModel()</code> — getting model</li>
  <li>Working with ButtonModel</li>
  <li>Programmatic state management</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Model is necessary for programmatic state management of checkbox menu item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get model: <code>ButtonModel model = item.getModel();</code></li>
  <li>Set state: <code>model.setSelected(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getModel()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use <code>setSelected()</code> for setting, use for programmatic management</li>
  <li><strong>⚠️ Avoid:</strong> Changing model directly</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to manage state via model. State can be changed programmatically.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (330, 'en', 'Checkbox Menu Item Master: Work with Model',
        'Get model via getModel(), set state true via setSelected()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (334, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Showing Popup Menu</h2>
<p class="intro">Showing menu allows displaying it. You can show menu in needed position, improve accessibility. Without showing, menu won''t be visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>show()</code> — showing menu</li>
  <li>Showing menu at specified position</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Showing menu is necessary for displaying popup menu at needed position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Show menu: <code>popupMenu.show(component, 100, 100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>show()</code> for showing</li>
  <li><strong>✅ Great:</strong> Use coordinates for position, use for improving accessibility, improve user experience</li>
  <li><strong>⚠️ Avoid:</strong> Showing outside screen</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Popup menu will appear at specified position. You can improve accessibility.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (334, 'en', 'Popup Menu Master: Show Menu', 'Show menu via show(component, 100, 100)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (332, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Handling JCheckBoxMenuItem State Change via ItemListener</h2>
<p class="intro">Handling state makes item interactive. You can react to selection, update other components. Without handling, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Handling changes via ItemListener</li>
  <li>Getting state</li>
  <li>Reacting to changes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Handling state is necessary for creating interactive menu item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Add listener: <code>item.addItemListener(e -> {<br>
&nbsp;&nbsp;boolean selected = item.isSelected();<br>
&nbsp;&nbsp;label.setText("Selected: " + selected);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addItemListener()</code> for handling</li>
  <li><strong>✅ Great:</strong> Use <code>isSelected()</code> for checking, use <code>getStateChange()</code> for change, update other components</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring state</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When state changes, handler will trigger. You can handle selection and update other components.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (332, 'en', 'Checkbox Menu Item Master: Handle State Change',
        'Add ItemListener, check isSelected(), output state')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (331, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Adding Icon to JCheckBoxMenuItem</h2>
<p class="intro">Icon improves readability. You can show visual element, improve understanding of item purpose. Without icon, item will be only with text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setIcon()</code> — setting icon</li>
  <li>Creating visually styled items</li>
  <li>Improving readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Icon is necessary for improving readability and visual styling of menu item.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set icon: <code>item.setIcon(new ImageIcon("icon.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIcon()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use ImageIcon for loading, use for visual styling, use clear icons</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Menu item will have icon. Item will have visual element.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (331, 'en', 'Checkbox Menu Item Master: Add Icon', 'Set icon via setIcon() with ImageIcon')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (333, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Setting Border for JPopupMenu</h2>
<p class="intro">Border improves visual appearance. You can add frame, improve design. Without border, menu will be without frame.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setBorder()</code> — setting border</li>
  <li>Customizing menu border</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Border is necessary for improving visual appearance of menu.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create border: <code>Border border = BorderFactory.createLineBorder(Color.BLACK, 2);</code></li>
  <li>Set border: <code>popupMenu.setBorder(border);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBorder()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use BorderFactory for creating, use <code>createLineBorder()</code> for line, improve visual appearance</li>
  <li><strong>⚠️ Avoid:</strong> Too thick border</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Popup menu will have border. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (333, 'en', 'Popup Menu Master: Set Border',
        'Create border via BorderFactory.createLineBorder(Color.BLACK, 2), set via setBorder()')
ON CONFLICT (task_id, language_code) DO NOTHING;
