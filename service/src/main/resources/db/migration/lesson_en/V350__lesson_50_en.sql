-- Flyway migration V3: Lesson 50
-- This migration contains lesson, tasks, and documentation for lesson 50

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (441, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Overriding paintComponent for Custom Rendering</h2>
<p class="intro">Custom rendering allows creating unique graphics. Charts, diagrams, games, animations — all of this requires custom rendering. Without it, you can only use standard components.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>paintComponent(Graphics)</code> — custom rendering</li>
  <li>Overriding method in JComponent</li>
  <li>Creating custom graphics</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom rendering is necessary for creating unique graphics.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create class extending JComponent: <code>class MyComponent extends JComponent {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;protected void paintComponent(Graphics g) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;super.paintComponent(g);<br>
&nbsp;&nbsp;&nbsp;&nbsp;g.drawString("Hello!", 10, 20);<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Always call <code>super.paintComponent(g)</code></li>
  <li><strong>✅ Great:</strong> Use Graphics2D for enhanced graphics, use for custom graphics, use for animations</li>
  <li><strong>⚠️ Avoid:</strong> Not calling super.paintComponent() — may be background issue</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will be rendered customly. You can create unique graphics.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (441, 'en', 'Custom Rendering Beginner: Override paintComponent',
        'Create class extending JComponent, override paintComponent(), call super.paintComponent(g), draw string via drawString()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (442, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Using Graphics2D for Enhanced Graphics</h2>
<p class="intro">Graphics2D provides enhanced capabilities. Antialiasing, gradients, transformations, enhanced shapes. Without Graphics2D, graphics will be basic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>Graphics2D</code> — enhanced graphics</li>
  <li>Casting Graphics to Graphics2D</li>
  <li>Using enhanced capabilities</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Graphics2D is necessary for creating enhanced graphics with additional capabilities.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Cast Graphics to Graphics2D: <code>Graphics2D g2d = (Graphics2D) g;</code></li>
  <li>Enable antialiasing: <code>g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Graphics2D for enhanced graphics</li>
  <li><strong>✅ Great:</strong> Enable antialiasing for smooth lines, use for gradients, use for transformations</li>
  <li><strong>⚠️ Avoid:</strong> Using Graphics instead of Graphics2D</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Graphics will be enhanced. Lines will be smooth, gradients beautiful.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (442, 'en', 'Custom Rendering Master: Use Graphics2D',
        'Override paintComponent(), cast Graphics to Graphics2D, enable antialiasing via setRenderingHint()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (443, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Drawing Shapes with Graphics2D</h2>
<p class="intro">Shapes are foundation of graphics. You can draw rectangles, ovals, lines, create complex images. Without shapes, you can''t create graphics.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>drawRect()</code>, <code>fillRect()</code> — rectangles</li>
  <li>Methods <code>drawOval()</code>, <code>fillOval()</code> — ovals</li>
  <li>Method <code>drawLine()</code> — lines</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Drawing shapes is necessary for creating graphics.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Draw rectangle: <code>g2d.drawRect(10, 10, 100, 50);</code></li>
  <li>Or filled: <code>g2d.fillRect(10, 10, 100, 50);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>drawRect()</code> for outline</li>
  <li><strong>✅ Great:</strong> Use <code>fillRect()</code> for filled, use <code>drawOval()</code> and <code>fillOval()</code> for ovals, use <code>drawLine()</code> for lines</li>
  <li><strong>⚠️ Avoid:</strong> Drawing outside component bounds</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Shapes will appear on component. You can draw rectangles, ovals, lines.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (443, 'en', 'Custom Rendering Master: Draw Shapes',
        'Override paintComponent(), draw filled rectangle via fillRect(10, 10, 100, 50)')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (444, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Using Colors in Graphics2D</h2>
<p class="intro">Colors make graphics vibrant. You can set color for drawing, create colorful images, improve visual appearance. Without colors, graphics will be black and white.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>setColor(Color)</code> — setting color</li>
  <li>Using standard and custom colors</li>
  <li>Creating colorful graphics</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Colors are necessary for creating colorful graphics.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set color: <code>g2d.setColor(Color.RED);</code></li>
  <li>Or custom: <code>g2d.setColor(new Color(255, 0, 0));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setColor()</code> for setting</li>
  <li><strong>✅ Great:</strong> Use standard colors Color.*, use <code>new Color(r, g, b)</code> for custom, use for colorful graphics</li>
  <li><strong>⚠️ Avoid:</strong> Using too bright colors</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Graphics will be colorful. You can use different colors for drawing.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (444, 'en', 'Custom Rendering Master: Use Colors',
        'Override paintComponent(), set color Color.RED via setColor(), draw rectangle')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (445, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Using Gradients in Graphics2D</h2>
<p class="intro">Gradients create smooth transitions. You can create beautiful gradient from one color to another, improve visual appearance. Without gradients, transitions will be sharp.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>GradientPaint</code> — gradient</li>
  <li>Method <code>setPaint(Paint)</code> — setting gradient</li>
  <li>Creating smooth transitions</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gradients are necessary for creating smooth color transitions.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create gradient: <code>GradientPaint gradient = new GradientPaint(0, 0, Color.RED, 100, 0, Color.BLUE);</code></li>
  <li>Set gradient: <code>g2d.setPaint(gradient);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> GradientPaint for creating</li>
  <li><strong>✅ Great:</strong> Use <code>setPaint()</code> for setting, use for smooth transitions, improve visual appearance</li>
  <li><strong>⚠️ Avoid:</strong> Using too contrasting colors</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Graphics will have gradient. You can create smooth transition from one color to another.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (445, 'en', 'Custom Rendering Master: Use Gradients',
        'Override paintComponent(), create gradient new GradientPaint(0, 0, Color.RED, 100, 0, Color.BLUE), set via setPaint(), draw rectangle')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (446, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Drawing Images with Graphics2D</h2>
<p class="intro">Images make graphics richer. You can display pictures, icons, photos, create visually attractive interfaces. Without images, graphics will be only vector.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>drawImage(Image, int, int, ImageObserver)</code> — drawing image</li>
  <li>Loading images</li>
  <li>Displaying images on component</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Images are necessary for creating visually attractive interfaces.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Load image: <code>Image image = Toolkit.getDefaultToolkit().getImage("image.png");</code></li>
  <li>Draw image: <code>g2d.drawImage(image, 10, 10, this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>drawImage()</code> for drawing</li>
  <li><strong>✅ Great:</strong> Use ImageIO.read() for loading, use for displaying pictures, scale images</li>
  <li><strong>⚠️ Avoid:</strong> Using too large images</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Image will appear on component. You can display pictures, icons, photos.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (446, 'en', 'Custom Rendering Master: Draw Images',
        'Override paintComponent(), load image via ImageIO.read(), draw via drawImage()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (447, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Updating Rendering with repaint()</h2>
<p class="intro">Updating rendering is necessary for animations. You can update component after change, create animations, update graphics. Without update, changes won''t be visible.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>repaint()</code> — updating rendering</li>
  <li>Method <code>repaint(int, int, int, int)</code> — updating area</li>
  <li>Managing component update</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Updating rendering is necessary for displaying changes and creating animations.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Update entire component: <code>component.repaint();</code></li>
  <li>Or area: <code>component.repaint(x, y, width, height);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>repaint()</code> for updating</li>
  <li><strong>✅ Great:</strong> Use <code>repaint(x, y, w, h)</code> for area, use for animations, update after changes</li>
  <li><strong>⚠️ Avoid:</strong> Calling too often — may be slow</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Component will update. You can create animations, update graphics.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (447, 'en', 'Custom Rendering Master: Update Rendering',
        'Create component with paintComponent(), call repaint() for update')
ON CONFLICT (task_id, language_code) DO NOTHING;
