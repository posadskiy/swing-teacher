-- Flyway migration V3: Lesson 1
-- This migration contains lesson, tasks, and documentation for lesson 1

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (1, 'en', '<div class="lesson-header">
<h2>🎮 Hello!</h2>
<p class="intro">Welcome to the course on learning the <strong>Java Swing</strong> library! We will learn to create visual interfaces of any complexity: windows, buttons, sliders, and much more.</p>
</div>

<section class="learning-objectives">
<h3>📚 About the course:</h3>
<ul>
  <li>Learning the Java Swing library</li>
  <li>Creating visual interfaces for applications</li>
  <li>Mastering components: windows, buttons, input fields, and other elements</li>
</ul>
</section>

<section class="importance">
<h3>💎 How to work with the course:</h3>
<p>This window will display reference information for completing tasks. <strong>It is important to read to the end and try to understand!</strong> On the left is the window with the task.</p>
</section>

<section class="implementation">
<h3>⚔️ First task:</h3>
<p>Click the <strong>"Check"</strong> button — the first task will be immediately counted. This is a thank you for reading this text.</p>
</section>

<section class="result">
<h3>👀 Ready to start?</h3>
<p>So, let''s begin! There is a lot of interesting and useful material ahead. Good luck with your learning!</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

-- Insert into translation table
INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (1, 'en', 'Introduction', '<p>Click the <strong>"Check"</strong> button')
ON CONFLICT (task_id, language_code) DO NOTHING;
