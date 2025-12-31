-- Flyway migration V59: Lesson 51
-- This migration contains lesson, tasks, and documentation for lesson 52

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (453, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Установка системного Look and Feel</h2>
<p class="intro">Look and Feel определяет внешний вид интерфейса. Можно установить системный стиль, сделать интерфейс похожим на нативную программу. Без настройки будет использоваться стандартный Metal.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>UIManager</code> — менеджер внешнего вида</li>
  <li>Метод <code>setLookAndFeel(String)</code> — установка L&F</li>
  <li>Системный Look and Feel</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Системный Look and Feel необходим для создания нативного вида интерфейса.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи системный L&F: <code>UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());</code></li>
  <li>Обнови компоненты: <code>SwingUtilities.updateComponentTreeUI(frame);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getSystemLookAndFeelClassName()</code> для системного</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>updateComponentTreeUI()</code> для обновления, использовать для нативного вида, устанавливать до создания компонентов</li>
  <li><strong>⚠️ Избегай:</strong> Устанавливать после создания — может не работать</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Интерфейс будет иметь системный стиль. Компоненты будут выглядеть как нативные.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (453, 'ru', 'Look and Feel-новичок: установи системный L&F',
        'Установи системный L&F через UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName()), обнови компоненты через SwingUtilities.updateComponentTreeUI()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (454, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Установка Metal Look and Feel</h2>
<p class="intro">Metal — классический стиль Java. Можно использовать стандартный стиль, который работает везде одинаково. Без настройки Metal используется по умолчанию.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Metal Look and Feel — классический стиль Java</li>
  <li>Установка Metal L&F</li>
  <li>Использование стандартного стиля</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Metal Look and Feel необходим для использования стандартного стиля Java.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи Metal L&F: <code>UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Полное имя класса</li>
  <li><strong>✅ Отлично:</strong> Использовать для стандартного стиля, использовать для совместимости, обновлять компоненты после установки</li>
  <li><strong>⚠️ Избегай:</strong> Использовать устаревший стиль</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Интерфейс будет иметь Metal стиль. Это классический стиль Java.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (454, 'ru', 'Look and Feel-мастер: установи Metal L&F',
        'Установи Metal L&F через UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel"), обнови компоненты')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (455, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Установка Nimbus Look and Feel</h2>
<p class="intro">Nimbus — современный стиль Java. Можно использовать красивый современный стиль, улучшить визуальный вид. Без настройки будет использоваться Metal.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Nimbus Look and Feel — современный стиль</li>
  <li>Установка Nimbus L&F</li>
  <li>Использование современного стиля</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Nimbus Look and Feel необходим для использования современного стиля интерфейса.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи Nimbus L&F: <code>UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Полное имя класса</li>
  <li><strong>✅ Отлично:</strong> Использовать для современного стиля, использовать для улучшения вида, обновлять компоненты после установки</li>
  <li><strong>⚠️ Избегай:</strong> Использовать на старых системах — может не работать</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Интерфейс будет иметь Nimbus стиль. Это современный красивый стиль.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (455, 'ru', 'Look and Feel-мастер: установи Nimbus L&F',
        'Установи Nimbus L&F через UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel"), обнови компоненты')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (456, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Получение списка доступных Look and Feel</h2>
<p class="intro">Список позволяет узнать доступные стили. Можно показать пользователю список, выбрать стиль, настроить интерфейс. Без списка нельзя узнать, какие стили доступны.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getInstalledLookAndFeels()</code> — список L&F</li>
  <li>Получение информации о стилях</li>
  <li>Просмотр доступных стилей</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Список необходим для просмотра и выбора доступных стилей.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи список: <code>UIManager.LookAndFeelInfo[] lafs = UIManager.getInstalledLookAndFeels();</code></li>
  <li>Просмотри список: <code>for (UIManager.LookAndFeelInfo laf : lafs) {<br>
&nbsp;&nbsp;label.setText(laf.getName() + ": " + laf.getClassName());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getInstalledLookAndFeels()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getName()</code> для имени, использовать <code>getClassName()</code> для класса, показывать пользователю список</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать список</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Будет выведен список доступных стилей. Можно узнать, какие стили доступны.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (456, 'ru', 'Look and Feel-мастер: получи список доступных L&F',
        'Получи список L&F через UIManager.getInstalledLookAndFeels(), выведи имя и класс каждого стиля')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (457, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Установка кастомного Look and Feel</h2>
<p class="intro">Кастомный L&F позволяет создать уникальный стиль. Можно использовать сторонние библиотеки, создать свой стиль, улучшить визуальный вид. Без кастомного L&F можно использовать только стандартные.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Создание кастомного L&F</li>
  <li>Установка кастомного стиля</li>
  <li>Использование сторонних библиотек</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Кастомный L&F необходим для создания уникального стиля интерфейса.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи кастомный L&F: <code>UIManager.setLookAndFeel("com.example.CustomLookAndFeel");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Полное имя класса</li>
  <li><strong>✅ Отлично:</strong> Использовать сторонние библиотеки, создавать свой стиль, обновлять компоненты после установки</li>
  <li><strong>⚠️ Избегай:</strong> Использовать несуществующий класс</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Интерфейс будет иметь кастомный стиль. Можно создать уникальный внешний вид.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (457, 'ru', 'Look and Feel-мастер: установи кастомный L&F',
        'Установи кастомный L&F через UIManager.setLookAndFeel("com.example.CustomLookAndFeel"), обнови компоненты')
ON CONFLICT (task_id, language_code) DO NOTHING;

