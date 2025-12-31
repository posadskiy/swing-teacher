-- Flyway migration V3: Lesson 3
-- This migration contains lesson, tasks, and documentation for lesson 3

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (16, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating a Label</h2>
<p class="intro">Labels (<code>JLabel</code>) are static text that helps the user understand what is happening. Without them, the interface is like a map without a legend.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JLabel</code> class — a component for displaying text and icons</li>
  <li>Creating a label without text and with text</li>
  <li>Basic use of labels in the interface</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Labels are the foundation of interface informativeness! They explain to the user what each button, input field, or other element does. Labels make the interface clear and user-friendly.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label object: <code>JLabel label = new JLabel();</code></li>
  <li>Add the label to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Create a variable, then add — you can configure the label</li>
  <li><strong>✅ Excellent:</strong> Create with text immediately: <code>new JLabel("Text")</code> — shorter and clearer</li>
  <li><strong>⚠️ Acceptable:</strong> <code>add(new JLabel());</code> — works, but you can''t configure it later</li>
  <li><strong>❌ Bad:</strong> Forget to call <code>add()</code> — the label won''t appear</li>
</ul>
<p><strong>Important:</strong> Labels don''t respond to clicks — they''re only for displaying information. You can create an empty label and add text later using the <code>setText()</code> method. Labels automatically adjust their size to fit the content. Use clear variable names.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>An empty label (or with text, if specified during creation) will appear on the form. It will be of standard size. In the next lessons, we''ll learn how to add text, icons, and beautifully format labels.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (16, 'en', 'Beginner Label: create an informational sign', 'Create a label and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (17, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Adding Text to a Label</h2>
<p class="intro">Text on a label is information for the user. Clear labels make the application friendly and professional.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setText(String text)</code> method — setting text on a label</li>
  <li>Creating a label with text in the constructor</li>
  <li>Working with strings for labels</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Text on a label helps understand the interface. "Enter name:", "Status:", "Result:" — all of this makes the interface clear and professional.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel();</code></li>
  <li>Set the text: <code>label.setText("Hello, world!");</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Text in quotes, clear and informative</li>
  <li><strong>✅ Excellent:</strong> Create immediately with text: <code>new JLabel("Hello!")</code> — shorter</li>
  <li><strong>⚠️ Avoid:</strong> Very long text — the label will stretch</li>
  <li><strong>❌ Bad:</strong> Forget quotes — <code>setText(Hello)</code> won''t work</li>
</ul>
<p><strong>Important:</strong> Text is always in double quotes. Use informative texts. You can use HTML in labels for formatting. Order: first <code>setText()</code>, then <code>add()</code>.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Your text will appear on the label. The label will automatically adjust its size to fit the text length.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (17, 'en', 'Label Text: give it a voice',
        'Create a label, set its text to "Hello, world!" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (18, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Icon on a Label</h2>
<p class="intro">An icon on a label makes information visual and attractive. Icons help the user quickly understand information.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIcon(Icon icon)</code> method — setting an icon</li>
  <li>The <code>ImageIcon</code> class for loading images</li>
  <li>Combining text and icon on a label</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icons make the interface visual! A red cross for errors, a green checkmark for success, a yellow exclamation mark for warnings — all of this helps quickly understand information.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel();</code></li>
  <li>Set the icon: <code>ImageIcon icon = new ImageIcon("path/to/image.png");</code><br><code>label.setIcon(icon);</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Icons of appropriate size (16x16, 32x32 pixels)</li>
  <li><strong>✅ Excellent:</strong> Combination of text and icon — informative and beautiful</li>
  <li><strong>⚠️ Avoid:</strong> Very large icons — the label will become huge</li>
  <li><strong>❌ Bad:</strong> Non-existent file path — the icon won''t load</li>
</ul>
<p><strong>Important:</strong> Icons can be loaded from files. You can use system icons or create your own. Icon and text can be together — the label will automatically arrange them. Order: you can set the icon first, then text, or vice versa.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>An icon will appear on the label. The label will automatically adjust its size to fit the icon. In the next lesson, we''ll learn how to align text and icon.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (18, 'en', 'Label Icon: add a visual effect', 'Create a label, set an icon and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (19, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Horizontal Alignment</h2>
<p class="intro">Horizontal alignment makes the interface neat. Headers centered, labels on the left, numbers on the right — all of this creates order and readability.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setHorizontalAlignment(int alignment)</code> method — horizontal alignment</li>
  <li>Constants: <code>SwingConstants.LEFT</code>, <code>CENTER</code>, <code>RIGHT</code></li>
  <li>Positioning text in a label</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Alignment makes the interface neat and professional. Proper alignment creates visual order and improves readability.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label with text: <code>JLabel label = new JLabel("Text");</code></li>
  <li>Set the alignment: <code>label.setHorizontalAlignment(SwingConstants.CENTER);</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> CENTER for headers, LEFT for regular text</li>
  <li><strong>✅ Excellent:</strong> RIGHT for numbers and dates — looks neat</li>
  <li><strong>⚠️ Avoid:</strong> Mixing different alignments without a system</li>
  <li><strong>❌ Bad:</strong> Forget about alignment — text may not be where it should be</li>
</ul>
<p><strong>Important:</strong> Available values: <code>LEFT</code> (left), <code>CENTER</code> (center), <code>RIGHT</code> (right). Use <code>SwingConstants</code> for constants. Alignment only works if the label is wider than the text. Can be combined with vertical alignment.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text on the label will be aligned to the specified edge. CENTER — centered, LEFT — left, RIGHT — right.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (19, 'en', 'Horizontal Alignment: place text correctly',
        'Create a label with text "Center", align it to the center and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (20, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Vertical Alignment</h2>
<p class="intro">Vertical alignment is especially important when the label is tall or next to other elements. This helps create visual harmony.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setVerticalAlignment(int alignment)</code> method — vertical alignment</li>
  <li>Constants: <code>SwingConstants.TOP</code>, <code>CENTER</code>, <code>BOTTOM</code></li>
  <li>Positioning text by height</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Vertical alignment helps align elements on one line. Everything should be at the same level for visual harmony.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel("Text");</code></li>
  <li>Set vertical alignment: <code>label.setVerticalAlignment(SwingConstants.CENTER);</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> CENTER for most cases — universal</li>
  <li><strong>✅ Excellent:</strong> Combination of horizontal and vertical alignment</li>
  <li><strong>⚠️ Avoid:</strong> TOP or BOTTOM without necessity</li>
</ul>
<p><strong>Important:</strong> Available values: <code>TOP</code> (top), <code>CENTER</code> (center), <code>BOTTOM</code> (bottom). Vertical alignment is noticeable when the label is taller than the text. Can be combined with horizontal for full control. Use CENTER by default.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text on the label will be aligned vertically. CENTER — centered on the label height, TOP — at the top, BOTTOM — at the bottom.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (20, 'en', 'Vertical Alignment: raise or lower text',
        'Create a label, align text vertically to the center and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (21, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Label Colors</h2>
<p class="intro">A colored label attracts attention and helps highlight important information. Colors help classify information.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>setBackground(Color)</code> and <code>setForeground(Color)</code></li>
  <li>Background and text colors of a label</li>
  <li>Creating contrasting combinations</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Colors help classify information! A red label for errors, green for success, yellow for warnings. This makes the interface clear and informative.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel("Text");</code></li>
  <li>Set colors: <code>label.setBackground(Color.YELLOW);</code><br><code>label.setForeground(Color.BLACK);</code><br><code>label.setOpaque(true);</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Contrasting colors — black on yellow, white on blue</li>
  <li><strong>✅ Excellent:</strong> <code>setOpaque(true)</code> for visible background</li>
  <li><strong>⚠️ Important:</strong> Without <code>setOpaque(true)</code> the background won''t be visible</li>
  <li><strong>❌ Avoid:</strong> Too bright or non-contrasting colors</li>
</ul>
<p><strong>Important:</strong> For a visible background, you need to call <code>setOpaque(true)</code>! Use preset colors. Create a color scheme: all labels of one type — one color. Remember contrast.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The label will display with a colored background and text. In the next lesson, we''ll learn how to work with fonts.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (21, 'en', 'Label Colors: color the informational sign',
        'Create a label, set yellow background, black text and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (22, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Label Font</h2>
<p class="intro">Font determines the mood of the interface. Bold font for headers, regular for text, italic for quotes. The right font makes the interface readable and professional.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setFont(Font font)</code> method — setting a font</li>
  <li>The <code>Font</code> class for creating fonts</li>
  <li>Font styles: regular, bold, italic</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Font determines the mood of the interface and its readability. The right font choice makes the interface professional.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel("Text");</code></li>
  <li>Set the font: <code>Font font = new Font("Arial", Font.BOLD, 16);</code><br><code>label.setFont(font);</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Readable fonts: Arial, Times New Roman, Verdana</li>
  <li><strong>✅ Sizes:</strong> 12-16 for regular text, 18+ for headers</li>
  <li><strong>⚠️ Avoid:</strong> Decorative fonts — may be unreadable</li>
  <li><strong>❌ Bad:</strong> Too small or too large size</li>
</ul>
<p><strong>Important:</strong> Creating a font: <code>new Font("Name", Style, Size)</code>. Styles: <code>Font.PLAIN</code> (regular), <code>Font.BOLD</code> (bold), <code>Font.ITALIC</code> (italic). Can be combined: <code>Font.BOLD | Font.ITALIC</code>. Use system fonts for compatibility.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text on the label will change its appearance. Bold font will make the text thicker, italic will tilt it. The size will also change.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (22, 'en', 'Label Font: choose text style',
        'Create a label, set bold Arial font size 16 and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (23, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 8: Label Size</h2>
<p class="intro">Label size determines its role. Large label — header, small — caption. Proper sizes create visual hierarchy.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSize(int width, int height)</code> method — setting size</li>
  <li>The <code>setPreferredSize(Dimension)</code> method — preferred size</li>
  <li>Managing label sizes</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper sizes create visual hierarchy and make the interface clear. Size helps determine the label''s role in the interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel("Text");</code></li>
  <li>Set the size: <code>label.setSize(200, 50);</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Sizes that match the content</li>
  <li><strong>✅ Excellent:</strong> <code>setPreferredSize()</code> for working with layout managers</li>
  <li><strong>⚠️ Avoid:</strong> Very large sizes — will take up a lot of space</li>
  <li><strong>❌ Bad:</strong> Size smaller than content — text will be cut off</li>
</ul>
<p><strong>Important:</strong> <code>setSize()</code> — exact size (may conflict with layout). <code>setPreferredSize()</code> — preferred size (works with layout). Label automatically adjusts to text if size is not set. For headers: 300-400 pixels width. For captions: 100-200 pixels.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The label will become the specified size. The text will remain inside (or be cut off if it doesn''t fit).</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (23, 'en', 'Label Size: make it the right size', 'Create a label, set size 200x50 and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (24, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 9: Label Tooltip</h2>
<p class="intro">A tooltip helps the user understand the purpose of an element. The user will hover the cursor and see additional information.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setToolTipText(String text)</code> method — setting a tooltip</li>
  <li>Tooltips when hovering the cursor</li>
  <li>Additional information for the user</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Tooltips help the user understand the purpose of an element. A short label "ID" with a tooltip "Unique user identifier" — everything is clear immediately.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel("ID");</code></li>
  <li>Set the tooltip: <code>label.setToolTipText("Unique identifier");</code></li>
  <li>Add to the form: <code>add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Good:</strong> Short, informative tooltips</li>
  <li><strong>✅ Excellent:</strong> Tooltips for all elements that may be unclear</li>
  <li><strong>⚠️ Avoid:</strong> Very long tooltips — inconvenient to read</li>
  <li><strong>❌ Bad:</strong> Tooltips that duplicate the label text</li>
</ul>
<p><strong>Important:</strong> Tooltip appears when hovering the cursor and after a delay. Use to explain abbreviations and acronyms. Short tooltips (up to 50 characters) read better. You can use HTML in tooltips for formatting. Tooltips are especially useful for icons without text.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>When hovering the cursor over the label, a tooltip will appear. It will show the text you specified. The tooltip will disappear when the cursor moves away.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (24, 'en', 'Label Tooltip: add popup help',
        'Create a label, add tooltip "This is a tooltip!" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (25, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 10: HTML in Label</h2>
<p class="intro">HTML allows you to create beautifully formatted text in labels. You can use bold text, italic, colors, and much more.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Using HTML in labels through <code>setText()</code></li>
  <li>Text formatting: bold, italic, color</li>
  <li>Creating visually attractive labels</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>HTML allows you to create formatted text in labels. Without HTML, the label will only be plain text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel();</code></li>
  <li>Set HTML text: <code>label.setText("&lt;html&gt;&lt;b&gt;Bold&lt;/b&gt;&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Required:</strong> Wrap HTML in <code>&lt;html&gt;&lt;/html&gt;</code> tags</li>
  <li><strong>✅ Use:</strong> <code>&lt;b&gt;</code> for bold text, <code>&lt;i&gt;</code> for italic</li>
  <li><strong>✅ Combine:</strong> You can combine tags for complex formatting</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text on the label will be formatted according to HTML tags. Bold text, italic, and other styles will be applied.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (25, 'en', 'HTML in Label: formatted text',
        'Create a label with HTML text "&lt;b&gt;Bold&lt;/b&gt;" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (26, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 11: Icon on a Label</h2>
<p class="intro">A label can display not only text, but also an image. Icons make labels visually attractive.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIcon()</code> method — setting an icon</li>
  <li>The <code>ImageIcon</code> class — image icon</li>
  <li>Creating labels with icons</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icons make labels visually attractive. Buttons, menus, lists — icons are used everywhere. Without them, the interface will be text-only.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create an icon: <code>ImageIcon icon = new ImageIcon("icon.png");</code></li>
  <li>Set the icon: <code>label.setIcon(icon);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIcon()</code> to set an icon</li>
  <li><strong>✅ Additionally:</strong> <code>setIconTextGap()</code> for spacing, <code>setHorizontalTextPosition()</code> for text position</li>
  <li><strong>✅ Combine:</strong> Text and icon together</li>
  <li><strong>⚠️ Avoid:</strong> Too large icons — may look messy</li>
</ul>
<p><strong>Important:</strong> <code>ImageIcon(String)</code> — create an icon from a file. You can use <code>setVerticalTextPosition()</code> for vertical text position.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The label will display an icon. The icon will appear next to the text or instead of it.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (26, 'en', 'Label Master: add an icon to the label',
        'Create an ImageIcon from file "icon.png", set the icon in the label via setIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (27, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 12: Text Alignment</h2>
<p class="intro">Text alignment makes labels neat. You can align text to the center, left, right.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setHorizontalAlignment()</code> method — horizontal alignment</li>
  <li>The <code>setVerticalAlignment()</code> method — vertical alignment</li>
  <li>Configuring text alignment</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Text alignment makes labels neat and professional. Without alignment, text will be in an unpredictable position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Align horizontally: <code>label.setHorizontalAlignment(SwingConstants.CENTER);</code></li>
  <li>Align vertically: <code>label.setVerticalAlignment(SwingConstants.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> CENTER for centering</li>
  <li><strong>✅ Excellent:</strong> LEFT/RIGHT for alignment, combine horizontal and vertical</li>
  <li><strong>⚠️ Avoid:</strong> Different alignment for different labels without a system</li>
</ul>
<p><strong>Important:</strong> CENTER, LEFT, RIGHT — alignment constants. TOP, BOTTOM — vertical constants. Use <code>SwingConstants</code> for constants.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text in the label will be aligned. The text will take the specified position.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (27, 'en', 'Label Master: align text',
        'Set horizontal and vertical alignment CENTER via setHorizontalAlignment() and setVerticalAlignment()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (28, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 13: HTML Content in Label</h2>
<p class="intro">HTML allows you to create complex formatted text. You can combine bold and italic, add colors, create lists.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Using HTML tags in labels</li>
  <li>Combining formatting: bold and italic</li>
  <li>Creating complex formatted text</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>HTML allows you to create formatted text in labels. Without HTML, the label will only be plain text.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a label: <code>JLabel label = new JLabel();</code></li>
  <li>Set HTML text: <code>label.setText("&lt;html&gt;&lt;b&gt;Bold&lt;/b&gt; and &lt;i&gt;Italic&lt;/i&gt;&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Required:</strong> Wrap HTML in <code>&lt;html&gt;&lt;/html&gt;</code> tags</li>
  <li><strong>✅ Use:</strong> <code>&lt;b&gt;</code> for bold text, <code>&lt;i&gt;</code> for italic</li>
  <li><strong>✅ Combine:</strong> You can combine tags for complex formatting</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text on the label will be formatted according to HTML tags. You can create complex formatting with a combination of styles.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (28, 'en', 'Label Master: add HTML content',
        'Set text with HTML tags: &lt;b&gt;Bold&lt;/b&gt; and &lt;i&gt;Italic&lt;/i&gt;')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (29, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 14: Icon Alignment</h2>
<p class="intro">Icon alignment determines its position. You can place the icon on the left, right, center.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setHorizontalAlignment()</code> method — horizontal alignment</li>
  <li>The <code>setVerticalAlignment()</code> method — vertical alignment</li>
  <li>Configuring icon position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Icon alignment determines its position in the label. Without configuration, the icon will be in the default position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the icon: <code>label.setIcon(new ImageIcon("icon.png"));</code></li>
  <li>Set the alignment: <code>label.setHorizontalAlignment(SwingConstants.LEFT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setHorizontalAlignment()</code> for horizontal, <code>setVerticalAlignment()</code> for vertical</li>
  <li><strong>✅ Constants:</strong> LEFT, CENTER, RIGHT for horizontal, TOP, BOTTOM for vertical</li>
  <li><strong>✅ Combine:</strong> With text for full control</li>
  <li><strong>⚠️ Avoid:</strong> Frequent alignment changes</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The icon will be in the specified position. You can place the icon on the left, right, or center.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (29, 'en', 'Label Master: configure icon alignment',
        'Set an icon, set horizontal alignment LEFT via setHorizontalAlignment()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (30, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 15: Vertical Alignment</h2>
<p class="intro">Vertical alignment determines the text position. You can place text at the top, center, bottom.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setVerticalAlignment()</code> method — vertical alignment</li>
  <li>Alignment constants (TOP, CENTER, BOTTOM)</li>
  <li>Configuring text position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Vertical alignment determines the text position in the label. Without configuration, text will be in the default position.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the alignment: <code>label.setVerticalAlignment(SwingConstants.TOP);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setVerticalAlignment()</code> for vertical alignment</li>
  <li><strong>✅ Constants:</strong> TOP (top), CENTER (center), BOTTOM (bottom)</li>
  <li><strong>✅ Combine:</strong> With horizontal for full control</li>
  <li><strong>⚠️ Avoid:</strong> Frequent alignment changes</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text will be in the specified position. You can place text at the top, center, or bottom.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (30, 'en', 'Label Master: configure vertical alignment',
        'Set vertical alignment TOP via setVerticalAlignment()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (31, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 16: Text Position Relative to Icon</h2>
<p class="intro">Text position determines its location relative to the icon. You can place text at the top, bottom, left, right of the icon.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setVerticalTextPosition()</code> method — vertical position</li>
  <li>The <code>setHorizontalTextPosition()</code> method — horizontal position</li>
  <li>Configuring text and icon position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Text position determines its location relative to the icon. Without configuration, the position will be default.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the icon: <code>label.setIcon(new ImageIcon("icon.png"));</code></li>
  <li>Set the text position: <code>label.setHorizontalTextPosition(SwingConstants.RIGHT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setHorizontalTextPosition()</code> for horizontal, <code>setVerticalTextPosition()</code> for vertical</li>
  <li><strong>✅ Constants:</strong> LEFT, CENTER, RIGHT for horizontal, TOP, BOTTOM for vertical</li>
  <li><strong>⚠️ Avoid:</strong> Frequent position changes</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The text will be in the specified position relative to the icon. You can place text on the left, right, top, or bottom of the icon.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (31, 'en', 'Label Master: configure text position',
        'Set an icon, set horizontal text position RIGHT via setHorizontalTextPosition()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (32, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 17: Mnemonic for Label</h2>
<p class="intro">Mnemonic improves interface accessibility. You can assign a hotkey to a label, link it to a component, improve navigation.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setDisplayedMnemonic()</code> method — setting a mnemonic</li>
  <li>The <code>setLabelFor()</code> method — linking to a component</li>
  <li>Creating accessible interfaces</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Mnemonic improves accessibility! You can activate the linked component via Alt+key without using the mouse. Without mnemonic, you need to use the mouse.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the mnemonic: <code>label.setDisplayedMnemonic(KeyEvent.VK_N);</code></li>
  <li>Link to a component: <code>label.setLabelFor(textField);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setDisplayedMnemonic()</code> with <code>KeyEvent.VK_*</code> constants</li>
  <li><strong>✅ Link:</strong> To a component via <code>setLabelFor()</code></li>
  <li><strong>✅ Improve:</strong> Interface accessibility</li>
  <li><strong>⚠️ Avoid:</strong> Duplicating mnemonics</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The mnemonic letter will be underlined in the label text. When pressing Alt+key, focus will move to the linked component.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (32, 'en', 'Label Master: set mnemonic',
        'Set mnemonic VK_N via setDisplayedMnemonic(), link to a component via setLabelFor()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (33, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 18: Label Border</h2>
<p class="intro">Border improves the visual appearance of a label. You can add a frame, improve the design.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBorder()</code> method — setting a border</li>
  <li>The <code>BorderFactory</code> class — border factory</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Border improves the visual appearance of a label. You can add a frame to highlight an element or improve the design.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create a border: <code>Border border = BorderFactory.createLineBorder(Color.BLACK, 1);</code></li>
  <li>Set the border: <code>label.setBorder(border);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBorder()</code> to set, <code>BorderFactory</code> to create</li>
  <li><strong>✅ Excellent:</strong> <code>createLineBorder()</code> for a simple line</li>
  <li><strong>⚠️ Avoid:</strong> Too thick border — may look rough</li>
</ul>
<p><strong>Important:</strong> Use to improve appearance. Make the border moderately thick.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>The label will have a border. You can improve the visual appearance and highlight the element.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (33, 'en', 'Label Master: add a border',
        'Create a border via BorderFactory.createLineBorder(Color.BLACK, 1), set via setBorder()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (34, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 19: Distance Between Icon and Text</h2>
<p class="intro">Distance improves the visual appearance of a label. You can set spacing between icon and text, improve readability.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setIconTextGap()</code> method — setting distance</li>
  <li>Managing spacing between icon and text</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Distance improves readability. Without distance, icon and text will be close together, which worsens visual perception.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set the distance: <code>label.setIconTextGap(10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setIconTextGap()</code> to set distance</li>
  <li><strong>✅ Reasonable values:</strong> 5-15 pixels — optimal for most cases</li>
  <li><strong>⚠️ Avoid:</strong> Too large or small distance</li>
</ul>
<p><strong>Important:</strong> Use to improve appearance and readability. Make the distance comfortable for perception.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Distance will appear between the icon and text. This will improve the visual appearance and readability of the label.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (34, 'en', 'Label Master: set distance between icon and text',
        'Set distance 10 via setIconTextGap()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
