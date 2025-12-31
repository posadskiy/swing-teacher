-- Flyway migration V3: Lesson 37
-- This migration contains lesson, tasks, and documentation for lesson 37

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (301, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Открытие палитры цветов</h2>
<p class="intro">JColorChooser позволяет выбрать любой цвет. Настройка темы, выбор цвета фона, кастомизация интерфейса — всё это требует выбора цвета. Без него пользователь ограничен предустановленными цветами.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>JColorChooser</code> — диалог выбора цвета</li>
  <li>Создание диалога выбора цвета</li>
  <li>Получение выбранного цвета</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>JColorChooser необходим для выбора цветов в приложении.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог выбора цвета: <code>Color color = JColorChooser.showDialog(frame, "Выбери цвет", Color.WHITE);</code></li>
  <li>Используй выбранный цвет: <code>if (color != null) {<br>
&nbsp;&nbsp;panel.setBackground(color);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять на null — пользователь мог отменить</li>
  <li><strong>✅ Отлично:</strong> Указать начальный цвет — покажет его при открытии, использовать выбранный цвет для настройки компонентов</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать null — может быть ошибка</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог выбора цвета. Это окно с палитрой цветов. Можно выбрать цвет из спектра, вкладок или ввести RGB значения. После выбора получишь объект Color.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (301, 'ru', 'Выбор цвета-новичок: открой палитру цветов',
        'Покажи диалог выбора цвета с начальным цветом WHITE и используй выбранный цвет')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (302, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Создание кастомного диалога выбора цвета</h2>
<p class="intro">Кастомный диалог позволяет настроить выбор цвета. Можно добавить дополнительные кнопки, изменить заголовок, добавить обработчики. Без этого придётся использовать стандартный диалог.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Создание <code>JColorChooser</code> как компонента</li>
  <li>Метод <code>createDialog()</code> — создание диалога</li>
  <li>Настройка диалога выбора цвета</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Кастомный диалог необходим для расширенной настройки выбора цвета.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай цветовой выбор: <code>JColorChooser colorChooser = new JColorChooser(Color.WHITE);</code></li>
  <li>Создай диалог: <code>JDialog dialog = JColorChooser.createDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Выбери цвет",<br>
&nbsp;&nbsp;true,<br>
&nbsp;&nbsp;colorChooser,<br>
&nbsp;&nbsp;null,<br>
&nbsp;&nbsp;null<br>
);</code></li>
  <li>Покажи диалог: <code>dialog.setVisible(true);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createDialog()</code> для создания диалога</li>
  <li><strong>✅ Отлично:</strong> Добавлять обработчики для кнопок OK и Cancel, настраивать начальный цвет</li>
  <li><strong>⚠️ Избегай:</strong> Слишком сложной настройки — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится кастомный диалог выбора цвета. Можно настроить его под свои нужды, добавить обработчики.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (302, 'ru', 'Выбор цвета-мастер: создай кастомный диалог',
        'Создай JColorChooser с начальным цветом WHITE, создай диалог через createDialog, покажи диалог')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (304, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Использование всех регионов BorderLayout</h2>
<p class="intro">Использование всех регионов создаёт структурированный интерфейс. Заголовок сверху, панель инструментов снизу, контент в центре — всё это требует всех регионов. Без этого интерфейс будет неполным.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Все регионы BorderLayout (NORTH, SOUTH, EAST, WEST, CENTER)</li>
  <li>Размещение компонентов во всех регионах</li>
  <li>Создание сложной компоновки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Использование всех регионов необходимо для создания структурированного интерфейса.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи менеджер: <code>setLayout(new BorderLayout());</code></li>
  <li>Добавь во все регионы: <code>add(buttonNorth, BorderLayout.NORTH);<br>
add(buttonSouth, BorderLayout.SOUTH);<br>
add(buttonEast, BorderLayout.EAST);<br>
add(buttonWest, BorderLayout.WEST);<br>
add(panelCenter, BorderLayout.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Все регионы для структуры</li>
  <li><strong>✅ Отлично:</strong> CENTER для основного контента, NORTH/SOUTH для заголовков и панелей, EAST/WEST для боковых панелей</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много компонентов в одном регионе</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты расположатся во всех регионах. Каждый компонент займёт свой регион. CENTER займёт оставшееся место.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (304, 'ru', 'BorderLayout-мастер: используй все регионы',
        'Установи BorderLayout, добавь компоненты во все пять регионов (NORTH, SOUTH, EAST, WEST, CENTER)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (303, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Настройка режимов выбора цвета</h2>
<p class="intro">Настройка режимов выбора делает палитру удобной. Можно показывать только нужные вкладки, скрывать лишние. Без этого пользователь увидит все вкладки, даже если они не нужны.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setChooserPanels()</code> — настройка панелей выбора</li>
  <li>Класс <code>ColorChooserComponentFactory</code> — фабрика компонентов</li>
  <li>Настройка режимов выбора цвета</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Настройка режимов выбора необходима для упрощения интерфейса выбора цвета.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи панели по умолчанию: <code>AbstractColorChooserPanel[] panels = ColorChooserComponentFactory.getDefaultChooserPanels();</code></li>
  <li>Установи панели: <code>colorChooser.setChooserPanels(panels);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getDefaultChooserPanels()</code> для стандартных панелей</li>
  <li><strong>✅ Отлично:</strong> Создавать собственные панели выбора, фильтровать панели, оставляя только нужные</li>
  <li><strong>⚠️ Избегай:</strong> Удалять все панели — пользователь не сможет выбрать цвет</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В диалоге выбора цвета будут только нужные вкладки. Можно настроить, какие режимы выбора показывать.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (303, 'ru', 'Выбор цвета-мастер: настрой режимы выбора',
        'Получи стандартные панели через getDefaultChooserPanels(), установи их в colorChooser')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (306, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Добавление отступов в BorderLayout</h2>
<p class="intro">Отступы делают компоновку аккуратной. Компоненты не будут прижаты друг к другу, будет визуальное разделение. Без отступов компоненты будут прижаты к краям.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setHgap()</code> — горизонтальный отступ</li>
  <li>Метод <code>setVgap()</code> — вертикальный отступ</li>
  <li>Настройка отступов в BorderLayout</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Отступы необходимы для создания аккуратной компоновки с визуальным разделением компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай менеджер: <code>BorderLayout layout = new BorderLayout();</code></li>
  <li>Установи отступы: <code>layout.setHgap(10);<br>
layout.setVgap(10);</code></li>
  <li>Установи менеджер: <code>setLayout(layout);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setHgap()</code> для горизонтальных отступов, <code>setVgap()</code> для вертикальных отступов</li>
  <li><strong>✅ Отлично:</strong> Использовать одинаковые отступы, указывать отступы в конструкторе</li>
  <li><strong>⚠️ Избегай:</strong> Слишком больших отступов — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между регионами появятся отступы. Компоненты не будут прижаты друг к другу. Компоновка будет выглядеть аккуратно.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (306, 'ru', 'BorderLayout-мастер: добавь отступы',
        'Создай BorderLayout, установи горизонтальный и вертикальный отступы по 10')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (305, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Добавление панели предпросмотра</h2>
<p class="intro">Панель предпросмотра показывает выбранный цвет. Можно увидеть, как цвет будет выглядеть, перед применением. Без предпросмотра придётся применять цвет, чтобы увидеть результат.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setPreviewPanel()</code> — установка панели предпросмотра</li>
  <li>Создание кастомной панели предпросмотра</li>
  <li>Отображение выбранного цвета</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Панель предпросмотра необходима для визуализации выбранного цвета перед применением.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай панель: <code>JPanel previewPanel = new JPanel();<br>
previewPanel.setPreferredSize(new Dimension(100, 50));</code></li>
  <li>Установи панель: <code>colorChooser.setPreviewPanel(previewPanel);</code></li>
  <li>Обновляй цвет: <code>colorChooser.getSelectionModel().addChangeListener(e -> {<br>
&nbsp;&nbsp;previewPanel.setBackground(colorChooser.getColor());<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setPreviewPanel()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Обновлять цвет через ChangeListener, показывать дополнительную информацию, использовать кастомную панель</li>
  <li><strong>⚠️ Избегай:</strong> Слишком большая панель — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В диалоге появится панель предпросмотра. Панель будет показывать выбранный цвет. Цвет будет обновляться при выборе.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (305, 'ru', 'Выбор цвета-мастер: добавь панель предпросмотра',
        'Создай JPanel для предпросмотра, установи через setPreviewPanel(), добавь ChangeListener для обновления цвета')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (307, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Работа с моделью выбора цвета</h2>
<p class="intro">Модель позволяет управлять выбором. Можно получить модель, установить цвет программно, отслеживать изменения. Без модели нельзя управлять выбором.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getSelectionModel()</code> — получение модели</li>
  <li>Работа с ColorSelectionModel</li>
  <li>Управление выбором цвета</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Модель необходима для программного управления выбором цвета.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи модель: <code>ColorSelectionModel model = colorChooser.getSelectionModel();</code></li>
  <li>Установи цвет: <code>model.setSelectedColor(Color.RED);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getSelectionModel()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>setSelectedColor()</code> для установки, использовать <code>getSelectedColor()</code> для получения, использовать <code>addChangeListener()</code> для отслеживания</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать модель</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет управлять выбором через модель. Цвет можно установить программно.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (307, 'ru', 'Выбор цвета-мастер: работай с моделью',
        'Получи модель через getSelectionModel(), установи цвет RED через setSelectedColor()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (308, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Получение выбранного цвета</h2>
<p class="intro">Получение цвета позволяет использовать выбор. Можно получить выбранный цвет, применить его к компонентам. Без получения цвета выбор не будет иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getColor()</code> — получение цвета</li>
  <li>Метод <code>showDialog()</code> — показ диалога</li>
  <li>Получение выбранного цвета</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Получение цвета необходимо для применения выбранного цвета к компонентам.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог: <code>Color color = JColorChooser.showDialog(frame, "Выбери цвет", Color.WHITE);</code></li>
  <li>Используй цвет: <code>if (color != null) {<br>
&nbsp;&nbsp;component.setBackground(color);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>showDialog()</code> для показа</li>
  <li><strong>✅ Отлично:</strong> Проверять null для отмены, использовать начальный цвет, применять цвет к компонентам</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать null</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог выбора цвета. Можно выбрать цвет и получить его.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (308, 'ru', 'Выбор цвета-мастер: получи выбранный цвет',
        'Покажи диалог через showDialog() с начальным цветом WHITE, проверь результат на null')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (309, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Настройка модели цвета</h2>
<p class="intro">Модель цвета определяет выбор. Можно настроить, как выбирается цвет, улучшить функциональность. Без настройки модель будет стандартной.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setColorSelectionModel()</code> — установка модели</li>
  <li>Настройка выбора цвета</li>
  <li>Улучшение функциональности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Настройка модели цвета необходима для расширенного управления выбором цвета.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай модель: <code>DefaultColorSelectionModel model = new DefaultColorSelectionModel();<br>
model.setSelectedColor(Color.RED);</code></li>
  <li>Установи модель: <code>colorChooser.setColorSelectionModel(model);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setColorSelectionModel()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать DefaultColorSelectionModel, настраивать начальный цвет, использовать для улучшения функциональности</li>
  <li><strong>⚠️ Избегай:</strong> Неправильной модели</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Модель цвета будет настроена. Можно настроить выбор цвета.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (309, 'ru', 'Выбор цвета-мастер: настрой модель цвета',
        'Создай DefaultColorSelectionModel, установи цвет RED, установи модель через setColorSelectionModel()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (310, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 10: Вставка иконки в JTextPane</h2>
<p class="intro">Иконка улучшает визуальный вид. Можно вставить изображение в текст, улучшить форматирование. Без иконки текст будет только текстом.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>insertIcon()</code> — вставка иконки</li>
  <li>Вставка изображений в текст</li>
  <li>Улучшение визуального вида</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Вставка иконки необходима для улучшения визуального вида текста.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай иконку: <code>ImageIcon icon = new ImageIcon("icon.png");</code></li>
  <li>Вставь иконку: <code>textPane.insertIcon(icon);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>insertIcon()</code> для вставки</li>
  <li><strong>✅ Отлично:</strong> Использовать ImageIcon для создания, использовать для улучшения вида, улучшать форматирование</li>
  <li><strong>⚠️ Избегай:</strong> Слишком больших иконок</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В тексте появится иконка. Можно улучшить визуальный вид.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (310, 'ru', 'Текст-панель-мастер: вставь иконку', 'Создай ImageIcon "icon.png", вставь через insertIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (311, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 11: Получение стилизованного документа</h2>
<p class="intro">Стилизованный документ позволяет управлять стилями. Можно получить доступ к стилям, изменить форматирование, улучшить функциональность. Без доступа нельзя управлять стилями.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getStyledDocument()</code> — получение стилизованного документа</li>
  <li>Доступ к стилям документа</li>
  <li>Улучшение функциональности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Доступ к стилизованному документу необходим для управления стилями и форматированием.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи документ: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getStyledDocument()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для управления стилями, использовать для форматирования, улучшать функциональность</li>
  <li><strong>⚠️ Избегай:</strong> Изменять без необходимости</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить доступ к стилизованному документу. Можно управлять стилями, форматированием.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (311, 'ru', 'Текст-панель-мастер: получи стилизованный документ',
        'Получи стилизованный документ через getStyledDocument()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (312, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 12: Создание JTextPane только для чтения</h2>
<p class="intro">Только для чтения защищает контент. Можно запретить редактирование, улучшить безопасность. Без защиты можно изменить контент.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setEditable()</code> — установка редактируемости</li>
  <li>Защита от изменений</li>
  <li>Улучшение безопасности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Режим только для чтения необходим для защиты контента от изменений.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Отключи редактирование: <code>textPane.setEditable(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setEditable(false)</code> для отключения</li>
  <li><strong>✅ Отлично:</strong> Использовать для защиты, улучшать безопасность, использовать для просмотра</li>
  <li><strong>⚠️ Избегай:</strong> Отключать для редактируемых полей</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Текст-панель будет только для чтения. Нельзя будет изменить контент.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (312, 'ru', 'Текст-панель-мастер: сделай только для чтения', 'Отключи редактирование через setEditable(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
