-- Flyway migration V3: Lesson 13
-- This migration contains lesson, tasks, and documentation for lesson 13

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (107, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Slider Tick Marks</h2>
<p class="intro">Tick marks make slider precise. Without tick marks it''s hard to select exact value. With tick marks you can see where the thumb is and what value is selected.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Methods <code>setMajorTickSpacing(int)</code> and <code>setMinorTickSpacing(int)</code></li>
  <li>The <code>setPaintTicks(boolean)</code> method — displaying tick marks</li>
  <li>The <code>setPaintLabels(boolean)</code> method — displaying labels</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why this is needed:</h3>
<p>Tick marks improve value selection accuracy and make slider more visual.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create slider: <code>JSlider slider = new JSlider(0, 100, 50);</code></li>
  <li>Configure tick marks: <code>slider.setMajorTickSpacing(10);</code><br><code>slider.setPaintTicks(true);</code><br><code>slider.setPaintLabels(true);</code></li>
  <li>Add to the form: <code>add(slider);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Major tick marks every 10-20 units</li>
  <li><strong>✅ Excellent:</strong> Combination of tick marks and labels — maximum clarity</li>
  <li><strong>⚠️ Avoid:</strong> Too frequent tick marks — overload interface</li>
</ul>
<p><strong>Important:</strong> <code>setMinorTickSpacing(5)</code> — minor tick marks every 5 units. Use reasonable intervals: 10, 20, 25, 50.</p>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Tick marks and labels will appear on slider. Major tick marks will be at specified intervals, and labels will show numeric values.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (107, 'en', 'Slider Tick Marks: add labels to scale',
        'Create a slider, add major tick marks every 10 units with labels and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (English)
-- ============================================================================

-- Note: Task translations are inserted directly below, not migrated from task table
-- (task table does not have title/question columns)
