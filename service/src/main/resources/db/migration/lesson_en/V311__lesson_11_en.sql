-- Flyway migration V3: Lesson 11
-- This migration contains lesson, tasks, and documentation for lesson 11

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (94, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a List of Elements</h2>
<p class="intro">Lists (<code>JList</code>) display many elements. Files, products, users — all of this is convenient to show in a list. Lists make data organized and accessible for selection.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JList</code> class — list of elements</li>
  <li>Creating a list with data</li>
  <li>Displaying elements in a list</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Lists allow displaying many elements in an organized way and provide convenient selection.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create array of elements: <code>String[] items = {"Item 1", "Item 2", "Item 3"};</code></li>
  <li>Create list: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code></li>
  <li>Add to the form: <code>add(list);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create with array of elements</li>
  <li><strong>✅ Excellent:</strong> Use typed <code>JList&lt;String&gt;</code>, use DefaultListModel for dynamic list</li>
  <li><strong>⚠️ Avoid:</strong> Empty list — user won''t see elements</li>
</ul>
<p><strong>Important:</strong> You can create with array: <code>new JList&lt;&gt;(items)</code>. You can create with model: <code>new JList&lt;&gt;(model)</code>. Get selected: <code>String selected = list.getSelectedValue();</code>. Set selected: <code>list.setSelectedIndex(0);</code>. Lists are better placed in JScrollPane for scrolling.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A list of elements will appear on the form. This is a vertical list with elements. You can select an element by clicking.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (94, 'en', 'Beginner List: create a list of elements',
        'Create a list with elements "Item 1", "Item 2", "Item 3" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (95, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: List Selection Mode</h2>
<p class="intro">Selection mode determines list behavior. One file for opening, several files for deletion — different tasks require different modes. Proper mode makes the interface intuitive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSelectionMode(int mode)</code> method — setting selection mode</li>
  <li>Modes: <code>SINGLE_SELECTION</code>, <code>SINGLE_INTERVAL_SELECTION</code>, <code>MULTIPLE_INTERVAL_SELECTION</code></li>
  <li>Managing item selection in list</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper selection mode makes the interface intuitive and matches user expectations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code></li>
  <li>Set selection mode: <code>list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);</code></li>
  <li>Add to the form: <code>add(list);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>SINGLE_SELECTION</code> for selecting one element</li>
  <li><strong>✅ Excellent:</strong> <code>MULTIPLE_INTERVAL_SELECTION</code> for multiple selection, <code>SINGLE_INTERVAL_SELECTION</code> for selecting range</li>
  <li><strong>⚠️ Avoid:</strong> Multiple selection where one is needed — confuses user</li>
</ul>
<p><strong>Important:</strong> SINGLE_INTERVAL_SELECTION — select one range (Shift+click). MULTIPLE_INTERVAL_SELECTION — select several elements (Ctrl+click). Use SINGLE_SELECTION for simple cases.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>List will work in the selected mode. You can select one element, range, or several elements.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (95, 'en', 'Selection Mode: one or several elements',
        'Create a list, set MULTIPLE_INTERVAL_SELECTION mode via setSelectionMode() and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (96, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Getting Selected Element</h2>
<p class="intro">Getting selected element allows processing user selection. You can perform action with selected element, update other components. Without this, list will only be for display.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getSelectedValue()</code> method — getting selected element</li>
  <li>The <code>getSelectedIndex()</code> method — getting index of selected element</li>
  <li>Working with selected elements</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Getting selected element is necessary for processing user actions and updating interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code></li>
  <li>Get selected element: <code>String selected = list.getSelectedValue();</code></li>
  <li>Use selected element: <code>JLabel label = new JLabel("Selected: " + selected);<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getSelectedValue()</code> for getting element, <code>getSelectedIndex()</code> for getting index</li>
  <li><strong>✅ Excellent:</strong> Check for null before using, use in event handler</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring null — may cause error</li>
</ul>
<p><strong>Important:</strong> <code>getSelectedValuesList()</code> — get list of selected elements. Use in ListSelectionListener.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get selected element. When selecting, you can find out which element is selected.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (96, 'en', 'Selected Element: get selected element',
        'Create a list, get selected element via getSelectedValue(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (97, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Handling Element Selection</h2>
<p class="intro">Handling selection makes list interactive. You can react to user selection, update other components, perform actions. Without handling, selection won''t have effect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>ListSelectionListener</code> interface — selection listener</li>
  <li>The <code>addListSelectionListener()</code> method — adding listener</li>
  <li>Handling selection events</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Handling selection allows reacting to user actions and updating interface in real time.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code></li>
  <li>Add listener: <code>list.addListSelectionListener(e -> {<br>
&nbsp;&nbsp;if (!e.getValueIsAdjusting()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;String selected = list.getSelectedValue();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Selected: " + selected);<br>
&nbsp;&nbsp;}<br>
});</code></li>
  <li>Add to the form: <code>add(list);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>addListSelectionListener()</code> for handling</li>
  <li><strong>✅ Excellent:</strong> Check <code>getValueIsAdjusting()</code> to avoid multiple events, update other components on selection, use lambda expressions for brevity</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring <code>getValueIsAdjusting()</code> — multiple events</li>
</ul>
<p><strong>Important:</strong> Check <code>getValueIsAdjusting()</code> to avoid extra events. Use for updating other components.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When selecting element, handler will fire. You can handle selection and perform actions.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (97, 'en', 'Selection Listener: handle element selection',
        'Create a list, add ListSelectionListener, check getValueIsAdjusting(), get selected element and output it')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (98, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: List Model</h2>
<p class="intro">DefaultListModel allows dynamically managing elements. You can add new elements, remove old ones, change list during runtime. Without model, list is static.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>DefaultListModel</code> class — list model</li>
  <li>Methods <code>addElement()</code>, <code>removeElement()</code>, <code>getElementAt()</code></li>
  <li>Dynamic management of list elements</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>DefaultListModel allows dynamically changing list during application runtime, which is necessary for interactive interfaces.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create model: <code>DefaultListModel&lt;String&gt; model = new DefaultListModel&lt;&gt;();</code></li>
  <li>Add elements: <code>model.addElement("Element 1");</code><br><code>model.addElement("Element 2");</code></li>
  <li>Create list with model: <code>JList&lt;String&gt; list = new JList&lt;&gt;(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> DefaultListModel for dynamic list</li>
  <li><strong>✅ Excellent:</strong> Use <code>addElement()</code> for adding, <code>removeElement()</code> for removing, <code>getElementAt()</code> for getting element</li>
  <li><strong>⚠️ Avoid:</strong> Using array for dynamic list — inconvenient</li>
</ul>
<p><strong>Important:</strong> <code>getSize()</code> — get model size. Use for lists that change during runtime.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>List will work with model. You can add and remove elements dynamically.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (98, 'en', 'List Model: work with DefaultListModel',
        'Create DefaultListModel, add elements via addElement(), create list with model and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (99, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Scrollable List</h2>
<p class="intro">Scrolling allows displaying long lists. Hundreds of elements, thousands of records — all of this is convenient to view with scrolling. Without scrolling, long list won''t fit on screen.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JScrollPane</code> class — scrollable panel</li>
  <li>Adding list to JScrollPane</li>
  <li>Creating scrollable list</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Scrolling is necessary for displaying long lists and improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code></li>
  <li>Create scrollable panel: <code>JScrollPane scrollPane = new JScrollPane(list);</code></li>
  <li>Add to the form: <code>add(scrollPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Always use JScrollPane for lists</li>
  <li><strong>✅ Excellent:</strong> Configure scrollable panel sizes, use <code>setPreferredSize()</code> for size</li>
  <li><strong>⚠️ Avoid:</strong> List without scrolling — may not fit</li>
</ul>
<p><strong>Important:</strong> Configure sizes for convenience.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>List will be scrollable. If there are many elements, scrollbar will appear. You can scroll the list.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (99, 'en', 'Scrollable List: add scrolling',
        'Create a list, wrap it in JScrollPane and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (100, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Multiple Selection</h2>
<p class="intro">Multiple selection allows working with several elements. Delete several files, select several products — all of this requires multiple selection. Without this, you''ll have to select one by one.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>getSelectedValuesList()</code> method — getting list of selected elements</li>
  <li>The <code>getSelectedIndices()</code> method — getting indices of selected elements</li>
  <li>Working with multiple selection</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Multiple selection is necessary for bulk operations and improving user work efficiency.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create list with multiple selection: <code>JList&lt;String&gt; list = new JList&lt;&gt;(items);</code><br><code>list.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);</code></li>
  <li>Get all selected elements: <code>List&lt;String&gt; selected = list.getSelectedValuesList();</code></li>
  <li>Use selected elements: <code>JLabel label = new JLabel();<br>
for (String item : selected) {<br>
&nbsp;&nbsp;label.setText("Selected: " + item);<br>
}<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getSelectedValuesList()</code> for getting list, <code>getSelectedIndices()</code> for getting indices</li>
  <li><strong>✅ Excellent:</strong> Check that list is not empty, use in event handler</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring empty list</li>
</ul>
<p><strong>Important:</strong> <code>isSelectionEmpty()</code> — check if there is selection. Check for emptiness before using. Use for multiple operations.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You can get all selected elements. With multiple selection, you can process all selected elements.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (100, 'en', 'Multiple Selection: get all selected elements',
        'Create a list with MULTIPLE_INTERVAL_SELECTION, get all selected elements via getSelectedValuesList() and output them')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
