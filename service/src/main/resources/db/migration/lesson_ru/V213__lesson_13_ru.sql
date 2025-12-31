-- Flyway migration V3: Lesson 13
-- This migration contains lesson, tasks, and documentation for lesson 13

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (107, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Деления слайдера</h2>
<p class="intro">Деления делают слайдер точным. Без делений сложно выбрать точное значение. С делениями видно, где находится ползунок и какое значение выбрано.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Методы <code>setMajorTickSpacing(int)</code> и <code>setMinorTickSpacing(int)</code></li>
  <li>Метод <code>setPaintTicks(boolean)</code> — отображение делений</li>
  <li>Метод <code>setPaintLabels(boolean)</code> — отображение меток</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Деления улучшают точность выбора значения и делают слайдер более наглядным.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай слайдер: <code>JSlider slider = new JSlider(0, 100, 50);</code></li>
  <li>Настрой деления: <code>slider.setMajorTickSpacing(10);</code><br><code>slider.setPaintTicks(true);</code><br><code>slider.setPaintLabels(true);</code></li>
  <li>Добавь на форму: <code>add(slider);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Крупные деления каждые 10-20 единиц</li>
  <li><strong>✅ Отлично:</strong> Комбинация делений и меток — максимальная наглядность</li>
  <li><strong>⚠️ Избегай:</strong> Слишком частых делений — перегружают интерфейс</li>
</ul>
<p><strong>Важно:</strong> <code>setMinorTickSpacing(5)</code> — мелкие деления каждые 5 единиц. Используй разумные интервалы: 10, 20, 25, 50.</p>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>На слайдере появятся деления и метки. Крупные деления будут на указанных интервалах, а метки покажут числовые значения.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (107, 'ru', 'Деления слайдера: добавь метки на шкалу',
        'Создай слайдер, добавь крупные деления каждые 10 единиц с метками и добавь на форму')
ON CONFLICT (task_id, language_code) DO NOTHING;
