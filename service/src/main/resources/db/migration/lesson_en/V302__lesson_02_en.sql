-- Flyway migration V3: Lesson 2
-- This migration contains lesson, tasks, and documentation for lesson 2

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (2, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Button</h2>
<p class="intro">Your first step in Java Swing is creating a button. Without buttons, users cannot interact with the application.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JButton</code> class — basic visual component</li>
  <li>The <code>add()</code> method — adding a component to the form</li>
  <li>Structure for creating UI elements</li>
</ul>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a button object:<br><code>JButton button = new JButton();</code></li>
  <li>Add the button to the form:<br><code>add(button);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create a variable, then add — code is more readable</li>
  <li><strong>⚠️ Acceptable:</strong> <code>add(new JButton());</code> — works, but the button cannot be configured</li>
  <li><strong>❌ Bad:</strong> Forgetting <code>add()</code> — the button will not appear on screen</li>
</ul>
<p><strong>Important:</strong> In the editor, code runs inside a ready window, so <code>add()</code> is available immediately. Use clear variable names.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>A gray button of standard size will appear on the form. In the next lessons, we will learn to customize its appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (2, 'en', 'Beginner Button: Summon the Hero', 'Create a button and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (3, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Text to a Button</h2>
<p class="intro">A button without text is not informative for the user. We will learn to add labels to improve the user experience.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setText(String text)</code> method — setting text on a button</li>
  <li>Working with strings in Java</li>
  <li>Principles of clear user interfaces</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Text on a button is the main way to communicate with the user. Clear labels ("Save", "Cancel") make the interface intuitive and professional.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a button: <code>JButton button = new JButton();</code></li>
  <li>Set the text: <code>button.setText("Let''s go!");</code></li>
  <li>Add to the form: <code>add(button);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Short clear text in quotes — "Save", "Cancel"</li>
  <li><strong>⚠️ Avoid:</strong> Long texts (button will stretch), forgotten quotes (<code>setText(Let''s go)</code> won''t work), empty strings</li>
</ul>
<p><strong>Important:</strong> Text is always in double quotes. Use clear words. Order of calls: first <code>setText()</code>, then <code>add()</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The set text will be displayed on the button. The button will automatically adjust its size to the text length.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (3, 'en', 'Text Spell: Give the Button a Name', 'Create a button, set its text, and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (4, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Changing Background Color</h2>
<p class="intro">Color helps highlight important elements and improve the visual hierarchy of the interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBackground(Color color)</code> method</li>
  <li>The <code>Color</code> class from AWT</li>
  <li>Preset colors: <code>Color.YELLOW</code>, <code>Color.RED</code>, <code>Color.BLUE</code></li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Colors help users navigate: yellow — attention, red — danger, green — success. Correct colors make the interface intuitive.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a button: <code>JButton button = new JButton();</code></li>
  <li>Set the color: <code>button.setBackground(Color.YELLOW);</code></li>
  <li>Add to the form: <code>add(button);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Preset colors (<code>Color.YELLOW</code>, <code>Color.RED</code>, <code>Color.GREEN</code>)</li>
  <li><strong>⚠️ Advanced:</strong> Custom color via RGB: <code>new Color(255, 200, 0)</code></li>
  <li><strong>❌ Avoid:</strong> Too bright or low-contrast colors</li>
</ul>
<p><strong>Available colors:</strong> <code>RED</code>, <code>GREEN</code>, <code>BLUE</code>, <code>YELLOW</code>, <code>ORANGE</code>, <code>PINK</code>, <code>CYAN</code>, <code>MAGENTA</code>, <code>WHITE</code>, <code>BLACK</code>, <code>GRAY</code></p>
<p><strong>Practice:</strong> Use colors meaningfully (red — delete, green — save). Order of calls is not important.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The button will be displayed with a yellow background. The text will remain visible if its color contrasts with the background.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (4, 'en', 'Button Skin: Gold!', 'Create a button, paint the background yellow, and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (5, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Text Color</h2>
<p class="intro">Managing text color to create a readable interface. Proper contrast is critical for readability.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setForeground(Color color)</code> method — setting text color</li>
  <li>Difference between <code>setForeground()</code> (text) and <code>setBackground()</code> (background)</li>
  <li>Concept of contrast and readability</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper contrast is critical for readability. White text on a white background is invisible. Professional interfaces use proven color combinations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a button: <code>JButton button = new JButton();</code></li>
  <li>Set the text color: <code>button.setForeground(Color.WHITE);</code></li>
  <li>Add to the form: <code>add(button);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> White text on dark background or black on light — perfect contrast</li>
  <li><strong>✅ Classic pairs:</strong> white on blue, black on yellow, white on red</li>
  <li><strong>⚠️ Check:</strong> Colored text on colored background — need to check readability</li>
  <li><strong>❌ Avoid:</strong> Text and background of the same color, yellow text on white background</li>
</ul>
<p><strong>Rule:</strong> dark background → light text, light background → dark text. Order of calls is not important.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text on the button will be displayed in white. With a dark background, white text provides excellent readability.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (5, 'en', 'Text Color: Readable and Beautiful', 'Create a button, make the text white, and add it to the form!')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (6, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Managing Button Size</h2>
<p class="intro">Button size affects its importance and usability. Large buttons attract attention, small ones reduce the risk of accidental actions.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSize(int width, int height)</code> method — setting size in pixels</li>
  <li>Parameters: width and height</li>
  <li>Interaction with layout managers</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Button size determines its importance and convenience. A large "Save" button attracts attention and is easier to press. Correct sizes make the interface intuitive.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a button: <code>JButton button = new JButton();</code></li>
  <li>Set the size: <code>button.setSize(320, 200);</code></li>
  <li>Add to the form: <code>add(button);</code></li>
</ol>
<p><strong>Note:</strong> First parameter is width, second is height.</p>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Standard sizes:</strong> small (100x30), medium (200x50), large (320x200)</li>
  <li><strong>✅ Minimum:</strong> 80x30 for comfortable pressing</li>
  <li><strong>✅ Hierarchy:</strong> main button — the largest</li>
  <li><strong>❌ Avoid:</strong> negative numbers, zero size, too large values</li>
</ul>
<p><strong>Important:</strong> Don''t confuse width and height. Consider text length and layout manager constraints.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The button will be displayed at 320x200 pixels. The text will remain centered, the background color will fill the entire area.</p>
<p class="summary"><strong>Summary:</strong> You have mastered the basic skills of working with buttons: creation, text, colors, and sizes. Ahead — event handling and creating full-featured interfaces.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (6, 'en', 'Hitbox: Make the Button Huge', 'Create a button, set its size to 320x200, and add it to the form.')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (7, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Hotkeys (Mnemonic)</h2>
<p class="intro">Adding quick access via keyboard. Hotkeys speed up work for experienced users and improve interface accessibility.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMnemonic(int)</code> method — setting mnemonic</li>
  <li>Hotkeys for buttons (Alt + letter)</li>
  <li>Underlining a letter in text via HTML</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Hotkeys speed up work! You can activate a button without a mouse, which is convenient for experienced users. Activation without a mouse increases efficiency.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the mnemonic: <code>button.setMnemonic(KeyEvent.VK_O);</code></li>
  <li>Underline the letter in text: <code>button.setText("&lt;html&gt;&lt;u&gt;O&lt;/u&gt;pen&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> First letter of the word for mnemonic</li>
  <li><strong>✅ Show:</strong> Underline the letter in text via HTML</li>
  <li><strong>✅ Use:</strong> <code>KeyEvent.VK_*</code> constants for reliability</li>
  <li><strong>⚠️ Avoid:</strong> Rare letters, conflicts with other hotkeys</li>
</ul>
<p><strong>Important:</strong> Activation occurs via Alt + letter. Visually highlight the mnemonic in the button text.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The letter in the button text will be underlined. Pressing Alt + letter will activate the button.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (7, 'en', 'Master Button: Add a Hotkey',
        'Set mnemonic VK_O via setMnemonic(), underline the letter in text via HTML')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (8, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Icon with Text</h2>
<p class="intro">Combining a visual element and text makes buttons more informative and attractive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Combining icon and text</li>
  <li>The <code>setIconTextGap()</code> method — gap between elements</li>
  <li>Positioning text relative to icon</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed</h3>
<p>Icon with text improves understanding of the button''s purpose. The visual element attracts attention, text clarifies the action.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the icon: <code>button.setIcon(new ImageIcon("icon.png"));</code></li>
  <li>Set the text: <code>button.setText("Save");</code></li>
  <li>Set the gap: <code>button.setIconTextGap(5);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIconTextGap()</code> to control distance</li>
  <li><strong>✅ Additionally:</strong> <code>setHorizontalTextPosition()</code> and <code>setVerticalTextPosition()</code> for positioning</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons — disrupt balance</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Both icon and text will be displayed on the button next to each other. The gap between them can be adjusted for optimal appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (8, 'en', 'Master Button: Add Icon with Text',
        'Set icon via setIcon(), set text via setText(), set gap 5 via setIconTextGap()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (9, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Mnemonic for Button</h2>
<p class="intro">Adding a mnemonic allows activating the button via Alt+letter, speeding up work for experienced users.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setMnemonic()</code> method — setting mnemonic</li>
  <li>Underlining a letter in text via & symbol</li>
  <li>Creating accessible buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Mnemonic speeds up work! You can activate the button via Alt+letter without using a mouse. Without mnemonic, you''ll have to click with the mouse.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the mnemonic: <code>button.setMnemonic(KeyEvent.VK_S);</code></li>
  <li>Add underline to text: <code>button.setText("Save (&S)");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setMnemonic()</code> with <code>KeyEvent.VK_*</code> constants</li>
  <li><strong>✅ Show:</strong> Mnemonic in text via & symbol</li>
  <li><strong>✅ Use:</strong> Unique letters, first letter of the word</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating mnemonics — may cause conflict</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The letter in the button text will be underlined. You can activate the button via Alt+letter.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (9, 'en', 'Master Button: Add Mnemonic',
        'Set mnemonic VK_S via setMnemonic(), add &S to button text')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (10, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Icon on Hover</h2>
<p class="intro">Icon on hover makes the button interactive and improves visual feedback with the user.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setRolloverIcon()</code> method — icon on hover</li>
  <li>Creating interactive buttons</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon on hover improves visual feedback. You can show a different icon when hovering the mouse, making the button more interactive.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set normal icon: <code>button.setIcon(new ImageIcon("normal.png"));</code></li>
  <li>Set hover icon: <code>button.setRolloverIcon(new ImageIcon("hover.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRolloverIcon()</code> for hover</li>
  <li><strong>✅ Additionally:</strong> <code>setPressedIcon()</code> for press, <code>setSelectedIcon()</code> for selection</li>
  <li><strong>✅ Combine:</strong> Different icons for different states</li>
  <li><strong>⚠️ Avoid:</strong> Too many different icons — may be excessive</li>
</ul>
<p><strong>Important:</strong> Use for visual feedback. Make icons clear and distinguishable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On hover, the icon will change. The button will become more interactive and informative.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (10, 'en', 'Master Button: Add Icon on Hover',
        'Set normal icon via setIcon(), set hover icon via setRolloverIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (11, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: Icon for Disabled Button</h2>
<p class="intro">Icon for disabled button improves visual feedback and helps the user understand the button state.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setDisabledIcon()</code> method — icon for disabled button</li>
  <li>Creating visual feedback</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon for disabled button improves understanding of state. You can show a different icon when the button is disabled, improving visual feedback.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set normal icon: <code>button.setIcon(new ImageIcon("normal.png"));</code></li>
  <li>Set disabled icon: <code>button.setDisabledIcon(new ImageIcon("disabled.png"));</code></li>
  <li>Disable the button: <code>button.setEnabled(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDisabledIcon()</code> for disabled button</li>
  <li><strong>✅ Additionally:</strong> Combine with <code>setPressedIcon()</code> and <code>setSelectedIcon()</code></li>
  <li><strong>✅ Do:</strong> Make icons clear and distinguishable</li>
  <li><strong>⚠️ Avoid:</strong> Too many different icons — may be excessive</li>
</ul>
<p><strong>Important:</strong> Use for visual feedback. The icon should clearly show that the button is disabled.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When disabled, the icon will change. The button will show a different icon when disabled, improving understanding of state.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (11, 'en', 'Master Button: Add Icon for Disabled Button',
        'Set normal icon via setIcon(), set disabled icon via setDisabledIcon(), disable the button')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (12, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Icon on Press</h2>
<p class="intro">Icon on press makes the button interactive and improves visual feedback during interaction.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setPressedIcon()</code> method — icon on press</li>
  <li>Creating interactive buttons</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon on press improves visual feedback. You can show a different icon when pressing the mouse, making the button more interactive.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set normal icon: <code>button.setIcon(new ImageIcon("normal.png"));</code></li>
  <li>Set press icon: <code>button.setPressedIcon(new ImageIcon("pressed.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setPressedIcon()</code> for press</li>
  <li><strong>✅ Additionally:</strong> Combine with <code>setRolloverIcon()</code> and <code>setSelectedIcon()</code></li>
  <li><strong>✅ Do:</strong> Make icons clear and distinguishable</li>
  <li><strong>⚠️ Avoid:</strong> Too many different icons — may be excessive</li>
</ul>
<p><strong>Important:</strong> Use for visual feedback. The icon should clearly show the pressed state.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On press, the icon will change. The button will become more interactive and informative.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (12, 'en', 'Master Button: Add Icon on Press',
        'Set normal icon via setIcon(), set press icon via setPressedIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (13, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Icon on Hover (rollover)</h2>
<p class="intro">Icon on hover makes the button interactive and improves visual feedback when hovering the mouse.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setRolloverIcon()</code> method — icon on hover</li>
  <li>The <code>setRolloverEnabled()</code> method — enabling/disabling hover</li>
  <li>Creating interactive buttons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon on hover improves visual feedback. You can show a different icon when hovering the mouse, making the button more interactive.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set normal icon: <code>button.setIcon(new ImageIcon("normal.png"));</code></li>
  <li>Set hover icon: <code>button.setRolloverIcon(new ImageIcon("rollover.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setRolloverIcon()</code> for hover</li>
  <li><strong>✅ Additionally:</strong> <code>setRolloverEnabled(true)</code> to enable, combine with <code>setPressedIcon()</code></li>
  <li><strong>✅ Do:</strong> Make icons clear and distinguishable</li>
  <li><strong>⚠️ Avoid:</strong> Too many different icons — may be excessive</li>
</ul>
<p><strong>Important:</strong> Use for visual feedback. Combine with other icons for full control of states.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On hover, the icon will change. The button will become more interactive and informative.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (13, 'en', 'Master Button: Add Icon on Hover',
        'Set normal icon via setIcon(), set hover icon via setRolloverIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (14, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: Icon on Selection</h2>
<p class="intro">Icon on selection makes the button interactive and improves visual feedback when selecting the button.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSelectedIcon()</code> method — icon on selection</li>
  <li>Creating interactive buttons</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon on selection improves visual feedback. You can show a different icon when selecting the button, improving understanding of state.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set normal icon: <code>button.setIcon(new ImageIcon("normal.png"));</code></li>
  <li>Set selection icon: <code>button.setSelectedIcon(new ImageIcon("selected.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setSelectedIcon()</code> for selection</li>
  <li><strong>✅ Additionally:</strong> Combine with <code>setRolloverIcon()</code> for full control</li>
  <li><strong>✅ Do:</strong> Make icons clear and distinguishable</li>
  <li><strong>⚠️ Avoid:</strong> Too many different icons — may be excessive</li>
</ul>
<p><strong>Important:</strong> Use for visual feedback. The icon should clearly show the selection state.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On selection, the icon will change. The button will become more interactive and informative.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (14, 'en', 'Master Button: Add Icon on Selection',
        'Set normal icon via setIcon(), set selection icon via setSelectedIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (15, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Icon on Disable</h2>
<p class="intro">Icon on disable improves visual feedback and helps the user understand that the button is unavailable.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setDisabledIcon()</code> method — icon on disable</li>
  <li>Creating visual feedback</li>
  <li>Improving user experience</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon on disable improves understanding of state. You can show a different icon when disabling, improving visual feedback.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set normal icon: <code>button.setIcon(new ImageIcon("normal.png"));</code></li>
  <li>Set disable icon: <code>button.setDisabledIcon(new ImageIcon("disabled.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDisabledIcon()</code> for disable</li>
  <li><strong>✅ Combine:</strong> With <code>setIcon()</code> and other icons</li>
  <li><strong>✅ Do:</strong> Make icons clear and distinguishable</li>
  <li><strong>⚠️ Avoid:</strong> Too similar icons — user won''t notice the difference</li>
</ul>
<p><strong>Important:</strong> Use for visual feedback. The icon should clearly show that the button is disabled.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>On disable, the icon will change. The button will become more informative and clear for the user.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (15, 'en', 'Master Button: Add Icon on Disable',
        'Set normal icon via setIcon(), set disable icon via setDisabledIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
