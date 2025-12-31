-- Flyway migration V3: Lesson 52
-- This migration contains lesson, tasks, and documentation for lesson 52

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (453, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Setting System Look and Feel</h2>
<p class="intro">Look and Feel determines interface appearance. You can set system style, make interface look like native program. Without setting, standard Metal will be used.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>UIManager</code> — appearance manager</li>
  <li>Method <code>setLookAndFeel(String)</code> — setting L&F</li>
  <li>System Look and Feel</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>System Look and Feel is necessary for creating native interface appearance.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set system L&F: <code>UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());</code></li>
  <li>Update components: <code>SwingUtilities.updateComponentTreeUI(frame);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getSystemLookAndFeelClassName()</code> for system</li>
  <li><strong>✅ Great:</strong> Use <code>updateComponentTreeUI()</code> for updating, use for native appearance, set before creating components</li>
  <li><strong>⚠️ Avoid:</strong> Setting after creating — may not work</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Interface will have system style. Components will look native.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (453, 'en', 'Look and Feel Beginner: Set System L&F',
        'Set system L&F via UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName()), update components via SwingUtilities.updateComponentTreeUI()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (454, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Setting Metal Look and Feel</h2>
<p class="intro">Metal is classic Java style. You can use standard style that works the same everywhere. Without setting, Metal is used by default.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Metal Look and Feel — classic Java style</li>
  <li>Setting Metal L&F</li>
  <li>Using standard style</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Metal Look and Feel is necessary for using standard Java style.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set Metal L&F: <code>UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Full class name</li>
  <li><strong>✅ Great:</strong> Use for standard style, use for compatibility, update components after setting</li>
  <li><strong>⚠️ Avoid:</strong> Using outdated style</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Interface will have Metal style. This is classic Java style.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (454, 'en', 'Look and Feel Master: Set Metal L&F',
        'Set Metal L&F via UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel"), update components')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (455, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Setting Nimbus Look and Feel</h2>
<p class="intro">Nimbus is modern Java style. You can use beautiful modern style, improve visual appearance. Without setting, Metal will be used.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Nimbus Look and Feel — modern style</li>
  <li>Setting Nimbus L&F</li>
  <li>Using modern style</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Nimbus Look and Feel is necessary for using modern interface style.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set Nimbus L&F: <code>UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Full class name</li>
  <li><strong>✅ Great:</strong> Use for modern style, use for improving appearance, update components after setting</li>
  <li><strong>⚠️ Avoid:</strong> Using on old systems — may not work</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Interface will have Nimbus style. This is modern beautiful style.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (455, 'en', 'Look and Feel Master: Set Nimbus L&F',
        'Set Nimbus L&F via UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel"), update components')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (456, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Getting List of Available Look and Feel</h2>
<p class="intro">List allows knowing available styles. You can show user list, choose style, configure interface. Without list, you can''t know which styles are available.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Method <code>getInstalledLookAndFeels()</code> — L&F list</li>
  <li>Getting information about styles</li>
  <li>Viewing available styles</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>List is necessary for viewing and choosing available styles.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Get list: <code>UIManager.LookAndFeelInfo[] lafs = UIManager.getInstalledLookAndFeels();</code></li>
  <li>View list: <code>for (UIManager.LookAndFeelInfo laf : lafs) {<br>
&nbsp;&nbsp;label.setText(laf.getName() + ": " + laf.getClassName());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> <code>getInstalledLookAndFeels()</code> for getting</li>
  <li><strong>✅ Great:</strong> Use <code>getName()</code> for name, use <code>getClassName()</code> for class, show user list</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring list</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>List of available styles will be output. You can know which styles are available.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (456, 'en', 'Look and Feel Master: Get List of Available L&F',
        'Get L&F list via UIManager.getInstalledLookAndFeels(), output name and class of each style')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (457, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 5: Setting Custom Look and Feel</h2>
<p class="intro">Custom L&F allows creating unique style. You can use third-party libraries, create your style, improve visual appearance. Without custom L&F, you can only use standard ones.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Creating custom L&F</li>
  <li>Setting custom style</li>
  <li>Using third-party libraries</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Custom L&F is necessary for creating unique interface style.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set custom L&F: <code>UIManager.setLookAndFeel("com.example.CustomLookAndFeel");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Full class name</li>
  <li><strong>✅ Great:</strong> Use third-party libraries, create your style, update components after setting</li>
  <li><strong>⚠️ Avoid:</strong> Using non-existent class</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Interface will have custom style. You can create unique appearance.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (457, 'en', 'Look and Feel Master: Set Custom L&F',
        'Set custom L&F via UIManager.setLookAndFeel("com.example.CustomLookAndFeel"), update components')
ON CONFLICT (task_id, language_code) DO NOTHING;
