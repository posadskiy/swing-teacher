-- Flyway migration V3: Lesson 48
-- This migration contains lesson, tasks, and documentation for lesson 48

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (429, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Tracking Component Focus with FocusListener</h2>
<p class="intro">FocusListener allows responding to focus. Input validation, hints, visual feedback — all of this requires focus handling. Without it, you can''t track which component is active.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Interface <code>FocusListener</code> — focus handling</li>
  <li>Methods <code>focusGained()</code> and <code>focusLost()</code></li>
  <li>Handling focus changes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>FocusListener is necessary for tracking active component and handling focus.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create listener: <code>FocusListener listener = new FocusListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void focusGained(FocusEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Component gained focus!");<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void focusLost(FocusEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Component lost focus!");<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Add listener: <code>textField.addFocusListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Validate data on focus loss</li>
  <li><strong>✅ Great:</strong> Show hints on focus gain, change visual style on focus</li>
  <li><strong>⚠️ Avoid:</strong> Too many handlers — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When clicking component, it will gain focus. When clicking another component, first will lose focus. You can track all focus changes.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (429, 'en', 'FocusListener Beginner: Track Component Focus',
        'Create FocusListener, handle focus gain and loss, add to text field')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (430, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Validation on Focus Loss with FocusListener</h2>
<p class="intro">Validation on focus loss improves user experience. You can check email, number, date immediately after input. Without this, errors will be discovered only on form submission.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Data validation in <code>focusLost()</code></li>
  <li>Checking input correctness</li>
  <li>Displaying validation errors</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Validation on focus loss is necessary for improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>In focusLost get text: <code>String text = textField.getText();</code></li>
  <li>Check correctness: <code>if (text.isEmpty()) {<br>
&nbsp;&nbsp;textField.setBackground(Color.RED);<br>
&nbsp;&nbsp;label.setText("Field cannot be empty!");<br>
} else {<br>
&nbsp;&nbsp;textField.setBackground(Color.WHITE);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Validate in <code>focusLost()</code></li>
  <li><strong>✅ Great:</strong> Show visual feedback (background color), show error message, restore focus on error: <code>requestFocus()</code></li>
  <li><strong>⚠️ Avoid:</strong> Validating in focusGained — too early</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On focus loss, validation will execute. If data is incorrect, field will highlight red. You can return focus for correction.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (430, 'en', 'FocusListener Master: Validate on Focus Loss',
        'In focusLost get field text, check for emptiness, set red background on error')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (432, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Navigating Cards in CardLayout</h2>
<p class="intro">Navigation allows switching between cards. You can show needed card, go to next or previous. Without navigation, only first card will be visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>show()</code> — showing card by name</li>
  <li>Method <code>next()</code> — next card</li>
  <li>Method <code>previous()</code> — previous card</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Navigation is necessary for switching between cards in CardLayout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get manager: <code>CardLayout layout = (CardLayout) panel.getLayout();</code></li>
  <li>Show card: <code>layout.show(panel, "card1");</code></li>
  <li>Or switch: <code>layout.next(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>show()</code> for showing by name</li>
  <li><strong>✅ Great:</strong> Use <code>next()</code> for next card, use <code>previous()</code> for previous, use <code>first()</code> and <code>last()</code> for extremes</li>
  <li><strong>⚠️ Avoid:</strong> Switching without checking — may be unexpected</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Cards will switch. When calling method, needed card will show. You can navigate between cards.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (432, 'en', 'CardLayout Master: Navigate Cards',
        'Get CardLayout, show card "card1" via show(), then switch to next via next()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (431, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Managing Focus Navigation with FocusListener</h2>
<p class="intro">Managing focus navigation makes interface convenient. You can configure order of transition between fields, hide unnecessary components from navigation. Without this, focus will transition in unpredictable order.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setFocusable()</code> — allowing focus</li>
  <li>Method <code>setFocusTraversalKeysEnabled()</code> — managing navigation</li>
  <li>Configuring focus order</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Managing focus navigation is necessary for creating convenient interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Allow focus: <code>component.setFocusable(true);</code></li>
  <li>Configure navigation: <code>component.setFocusTraversalKeysEnabled(true);</code></li>
  <li>Request focus: <code>component.requestFocus();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setFocusable()</code> for managing focus</li>
  <li><strong>✅ Great:</strong> Use <code>setFocusTraversalKeysEnabled()</code> for navigation, use <code>requestFocus()</code> for programmatic focus, configure order via FocusTraversalPolicy</li>
  <li><strong>⚠️ Avoid:</strong> Making all components non-focusable — loss of functionality</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Focus will transition in needed order. You can manage which components get focus.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (431, 'en', 'FocusListener Master: Manage Focus Navigation',
        'Set setFocusable(true), set setFocusTraversalKeysEnabled(true), request focus via requestFocus()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (433, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Switching to First and Last Card in CardLayout</h2>
<p class="intro">Switching to extreme cards speeds up navigation. You can quickly go to first or last card. Without this, you''ll have to switch one by one.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>first()</code> — first card</li>
  <li>Method <code>last()</code> — last card</li>
  <li>Navigating to extreme cards</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Switching to extreme cards is necessary for fast navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get manager: <code>CardLayout layout = (CardLayout) panel.getLayout();</code></li>
  <li>Switch to first: <code>layout.first(panel);</code></li>
  <li>Or to last: <code>layout.last(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>first()</code> for first card</li>
  <li><strong>✅ Great:</strong> Use <code>last()</code> for last, use for fast navigation, combine with <code>next()</code> and <code>previous()</code></li>
  <li><strong>⚠️ Avoid:</strong> Switching without checking</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Card will switch to first or last. You can quickly go to extreme cards.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (433, 'en', 'CardLayout Master: Switch to First and Last',
        'Get CardLayout, switch to first via first(), then to last via last()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (434, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Getting Card Count in CardLayout</h2>
<p class="intro">Card count allows managing navigation. You can know how many cards there are, create cyclic navigation. Without counting, you can''t manage navigation.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getComponentCount()</code> — component count</li>
  <li>Counting cards in container</li>
  <li>Improving navigation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Card count is necessary for managing navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get count: <code>int count = panel.getComponentCount();</code></li>
  <li>Use count: <code>JLabel label = new JLabel("Cards: " + count);<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getComponentCount()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use for navigation, use for cyclic navigation, check before navigation</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring count</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>You''ll be able to get card count. You can use for navigation.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (434, 'en', 'CardLayout Master: Get Card Count',
        'Get component count via getComponentCount(), output it')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (435, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Showing Card by Name in CardLayout</h2>
<p class="intro">Showing by name simplifies navigation. You can switch to card by name, without knowing its position. Without name, you''ll have to know position.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>show()</code> — showing card by name</li>
  <li>Navigating by card name</li>
  <li>Improving card management</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Showing by name is necessary for simplifying navigation.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get manager: <code>CardLayout layout = (CardLayout) panel.getLayout();</code></li>
  <li>Show card: <code>layout.show(panel, "cardName");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>show()</code> for showing</li>
  <li><strong>✅ Great:</strong> Use clear names, use for navigation, combine with other methods</li>
  <li><strong>⚠️ Avoid:</strong> Using non-existent names</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Card will switch by name. You can switch to needed card.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (435, 'en', 'CardLayout Master: Show Card by Name',
        'Get CardLayout, show card "cardName" via show()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (436, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Setting Component Orientation in FlowLayout</h2>
<p class="intro">Component orientation is important for RTL languages. You can change direction for Arabic, Hebrew, improve support. Without orientation, layout will be only LTR.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setComponentOrientation()</code> — setting orientation</li>
  <li>RTL language support</li>
  <li>Improving internationalization</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Component orientation is necessary for RTL language support.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set orientation: <code>flowLayout.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setComponentOrientation()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use RIGHT_TO_LEFT for RTL, use LEFT_TO_RIGHT for LTR, improve internationalization</li>
  <li><strong>⚠️ Avoid:</strong> Using wrong orientation</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be arranged in specified orientation. You can support RTL languages.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (436, 'en', 'FlowLayout Master: Set Component Orientation',
        'Set orientation RIGHT_TO_LEFT via setComponentOrientation()')
ON CONFLICT (task_id, language_code) DO NOTHING;
