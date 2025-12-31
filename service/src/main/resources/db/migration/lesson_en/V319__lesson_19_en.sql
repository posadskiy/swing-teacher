-- Flyway migration V3: Lesson 19
-- This migration contains lesson, tasks, and documentation for lesson 19

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (163, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Creating Frameless Window</h2>
<p class="intro">JWindow allows creating frameless window. Popup tooltips, splash screens, custom dialogs — all of this requires frameless window. Without it, you''ll have to use JFrame with frame.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>JWindow</code> class — frameless window</li>
  <li>Creating window</li>
  <li>Difference from JFrame</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Frameless windows are necessary for popup windows, splash screens and custom dialogs.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create window: <code>JWindow window = new JWindow(frame);</code></li>
  <li>Set size: <code>window.setSize(400, 300);</code></li>
  <li>Make visible: <code>window.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Specify parent window</li>
  <li><strong>✅ Excellent:</strong> Use for popup windows, use for splash screens</li>
  <li><strong>⚠️ Avoid:</strong> Using instead of JFrame — better for windows with frame</li>
</ul>
<p><strong>Important:</strong> <code>JWindow(parent)</code> — create window. <code>JWindow()</code> — create window without parent. No frame and title.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Frameless window will appear. This is a window without title and buttons. You can use for popup windows.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (163, 'en', 'Beginner Window: create frameless window',
        'Create window with parent frame, size 400x300 and make it visible')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (164, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Setting Window Size</h2>
<p class="intro">Size defines window dimensions. You can set needed size, improve placement. Without setting, size will be automatic.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setSize(int, int)</code> method — setting size</li>
  <li>The <code>setSize(Dimension)</code> method — setting size via Dimension</li>
  <li>Managing window size</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing size allows controlling window dimensions and improving interface layout.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set size: <code>window.setSize(500, 400);</code></li>
  <li>Or via Dimension: <code>window.setSize(new Dimension(500, 400));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setSize()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use Dimension for size, use for layout, improve placement</li>
  <li><strong>⚠️ Avoid:</strong> Setting too small or large size</li>
</ul>
<p><strong>Important:</strong> <code>getSize()</code> — get size. Make size reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window will have set size. You can improve placement.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (164, 'en', 'Window Master: set size', 'Create window, set size 500x400 via setSize(500, 400)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (165, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Setting Window Location</h2>
<p class="intro">Location defines window position. You can set needed position, center window, place relative to another window. Without setting, window will appear in random place.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setLocation(int, int)</code> method — setting location</li>
  <li>The <code>setLocation(Point)</code> method — setting location via Point</li>
  <li>Managing window position</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Managing location allows controlling window position on screen and improving user experience.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set location: <code>window.setLocation(100, 100);</code></li>
  <li>Or via Point: <code>window.setLocation(new Point(100, 100));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setLocation()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use Point for position, center window relative to screen, place relative to another window</li>
  <li><strong>⚠️ Avoid:</strong> Placing outside screen</li>
</ul>
<p><strong>Important:</strong> <code>getLocation()</code> — get location. <code>setLocationRelativeTo(null)</code> — center relative to screen. <code>setLocationRelativeTo(component)</code> — center relative to component.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window will appear at specified position. You can improve placement.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (165, 'en', 'Window Master: set location',
        'Create window, set location 100, 100 via setLocation(100, 100)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (166, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Window Always On Top</h2>
<p class="intro">Always on top makes window visible. Popup tooltips, notifications, important messages — all of this requires window on top of others. Without this, window may be hidden.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setAlwaysOnTop(boolean)</code> method — always on top</li>
  <li>Window on top of all other windows</li>
  <li>Using for important windows</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>"Always on top" mode is necessary for important windows, notifications and popup tooltips.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Enable always on top: <code>window.setAlwaysOnTop(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setAlwaysOnTop(true)</code> to enable</li>
  <li><strong>✅ Excellent:</strong> Use for important windows, use for popup windows, use for notifications</li>
  <li><strong>⚠️ Avoid:</strong> Using for regular windows — may interfere</li>
</ul>
<p><strong>Important:</strong> <code>true</code> — always on top, <code>false</code> — normal priority.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window will always be on top of other windows. Even if you open other windows, this window will remain visible.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (166, 'en', 'Window Master: make always on top', 'Create window, enable always on top via setAlwaysOnTop(true)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (167, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Window Background Color</h2>
<p class="intro">Background color improves visual appearance. You can set needed color, make window noticeable. Without setting, color will be standard.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setBackground(Color)</code> method — setting background color</li>
  <li>Customizing appearance</li>
  <li>Improving visual appearance</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Setting background color allows customizing window appearance and improving visual perception.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set background color: <code>window.setBackground(Color.WHITE);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setBackground()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use Color constants, use <code>new Color()</code> for custom colors, use to improve appearance</li>
  <li><strong>⚠️ Avoid:</strong> Using too bright colors</li>
</ul>
<p><strong>Important:</strong> <code>Color.WHITE</code>, <code>Color.BLACK</code>, <code>Color.GRAY</code> — standard colors. <code>new Color(r, g, b)</code> — custom color. Make color reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window will have set background color. You can improve visual appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (167, 'en', 'Window Master: set background color',
        'Create window, set background color Color.WHITE via setBackground()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (168, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 6: Window Opacity</h2>
<p class="intro">Opacity creates effects. You can make window semi-transparent, create fog effect, improve visual appearance. Without setting, window will be opaque.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>setOpacity(float)</code> method — setting opacity</li>
  <li>Transparent window</li>
  <li>Creating effects</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Opacity allows creating visual effects and improving interface design.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set opacity: <code>window.setOpacity(0.8f);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>setOpacity()</code> to set</li>
  <li><strong>✅ Excellent:</strong> Use values from 0.0 (transparent) to 1.0 (opaque), use for effects, use to improve appearance</li>
  <li><strong>⚠️ Avoid:</strong> Using too low opacity</li>
</ul>
<p><strong>Important:</strong> 0.0 — fully transparent, 1.0 — fully opaque. Make opacity reasonable.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window will have set opacity. You can see through window.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (168, 'en', 'Window Master: set opacity',
        'Create window, set opacity 0.8 via setOpacity(0.8f)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (169, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 7: Closing Window</h2>
<p class="intro">Closing window releases resources. You can close window programmatically, free memory, finish work. Without closing, window will hang in memory.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>The <code>dispose()</code> method — closing window</li>
  <li>Releasing resources</li>
  <li>Managing window lifecycle</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Proper window closing is necessary for releasing resources and preventing memory leaks.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Close window: <code>window.dispose();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>dispose()</code> to close</li>
  <li><strong>✅ Excellent:</strong> Use <code>setVisible(false)</code> to hide, release resources, manage lifecycle</li>
  <li><strong>⚠️ Avoid:</strong> Not closing window — memory leak</li>
</ul>
<p><strong>Important:</strong> <code>dispose()</code> — close window and release resources. <code>setVisible(false)</code> — hide window without releasing resources. Use <code>dispose()</code> for final closing.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Window will close and release resources. You can manage window lifecycle.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (169, 'en', 'Window Master: close window', 'Create window, close it via dispose()')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
