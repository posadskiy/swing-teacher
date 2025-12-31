-- Flyway migration V3: Lesson 46
-- This migration contains lesson, tasks, and documentation for lesson 46

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (406, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Реагирование на клики мыши с MouseListener</h2>
<p class="intro">MouseListener делает компоненты интерактивными. Можно реагировать на клики, определять позицию курсора, различать левую и правую кнопки. Без слушателя мыши компонент не может реагировать на действия пользователя.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>MouseListener</code> — обработчик событий мыши</li>
  <li>Метод <code>addMouseListener()</code> — добавление слушателя</li>
  <li>События: клик, нажатие, отпускание, вход, выход</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>MouseListener необходим для создания интерактивных компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай компонент (например, JPanel): <code>JPanel panel = new JPanel();</code></li>
  <li>Добавь слушатель мыши: <code>panel.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Клик на позиции: " + e.getX() + ", " + e.getY());<br>
&nbsp;&nbsp;}<br>
});</code></li>
  <li>Добавь на форму: <code>add(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>MouseAdapter</code> для упрощения</li>
  <li><strong>✅ Отлично:</strong> Лямбда для простых действий (если поддерживается), отдельный класс для сложной логики</li>
  <li><strong>⚠️ Избегай:</strong> Реализовать все методы MouseListener — много кода</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При клике на компонент выполнится действие. Если использовал JLabel, на экране появится сообщение с координатами клика. Компонент теперь реагирует на мышь.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (406, 'ru', 'Слушатель мыши-новичок: реагируй на клики мыши',
        'Создай панель, добавь MouseListener, который выводит "Клик!" при клике, и добавь на форму')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (407, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Создание радио-кнопок в меню с JRadioButtonMenuItem</h2>
<p class="intro">JRadioButtonMenuItem позволяет выбрать один вариант из группы в меню. Размер шрифта, тема, режим отображения — всё это требует выбора одного варианта. Без них придётся создавать отдельные диалоги.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>JRadioButtonMenuItem</code> — радио-кнопка в меню</li>
  <li>Создание группы радио-кнопок в меню</li>
  <li>Добавление в меню</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>JRadioButtonMenuItem необходим для выбора одного варианта из группы в меню.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай группу: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Создай радио-пункты: <code>JRadioButtonMenuItem item1 = new JRadioButtonMenuItem("Small");<br>
JRadioButtonMenuItem item2 = new JRadioButtonMenuItem("Medium");</code></li>
  <li>Добавь в группу и меню: <code>group.add(item1);<br>
group.add(item2);<br>
menu.add(item1);<br>
menu.add(item2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> ButtonGroup для группировки</li>
  <li><strong>✅ Отлично:</strong> Устанавливать выбранный по умолчанию через <code>setSelected()</code>, добавлять ActionListener для обработки</li>
  <li><strong>⚠️ Избегай:</strong> Не использовать группу — можно выбрать несколько</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В меню появятся радио-кнопки. Можно выбрать один вариант, другой автоматически снимется.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (407, 'ru', 'Радио-пункт меню-новичок: создай радио-кнопки в меню',
        'Создай ButtonGroup, создай два JRadioButtonMenuItem, добавь в группу и меню')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (408, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Обработка выбора в JRadioButtonMenuItem</h2>
<p class="intro">Обработка выбора делает радио-пункт интерактивным. Можно обновлять другие компоненты, применять настройки, выполнять действия. Без этого выбор не будет иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Обработка выбора через ActionListener</li>
  <li>Определение выбранного пункта</li>
  <li>Реагирование на выбор</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка выбора необходима для создания интерактивного радио-пункта.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>item.addActionListener(e -> {<br>
&nbsp;&nbsp;if (item.isSelected()) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Выбрано: " + item.getText());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>isSelected()</code> для проверки</li>
  <li><strong>✅ Отлично:</strong> Получать текст через <code>getText()</code>, обновлять другие компоненты, использовать ItemListener для более точной обработки</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать выбор — потеря функциональности</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При выборе будет срабатывать обработчик. Можно получить выбранный пункт и выполнить действия.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (408, 'ru', 'Радио-пункт меню-мастер: обрабатывай выбор',
        'Добавь ActionListener, проверь isSelected(), выведи текст пункта через getText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (409, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Создание диалога подтверждения с JOptionPane</h2>
<p class="intro">Диалоги подтверждения защищают от случайных действий. Удаление файла, выход из программы, сброс данных — всё это требует подтверждения. Без них пользователь может случайно потерять данные.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>showConfirmDialog()</code> — диалог подтверждения</li>
  <li>Константы <code>YES_NO_OPTION</code>, <code>YES_NO_CANCEL_OPTION</code></li>
  <li>Обработка результата подтверждения</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Диалог подтверждения необходим для защиты от случайных действий.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог подтверждения: <code>int result = JOptionPane.showConfirmDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Ты уверен?",<br>
&nbsp;&nbsp;"Подтверждение",<br>
&nbsp;&nbsp;JOptionPane.YES_NO_OPTION<br>
);</code></li>
  <li>Обработай результат: <code>if (result == JOptionPane.YES_OPTION) {<br>
&nbsp;&nbsp;label.setText("Пользователь согласился!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> YES_NO_OPTION для простого выбора</li>
  <li><strong>✅ Отлично:</strong> Использовать YES_NO_CANCEL_OPTION для трёх вариантов, проверять результат перед выполнением действия</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать результат — действие выполнится всегда</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог с вопросом и кнопками. Пользователь может выбрать "Да", "Нет" или "Отмена". Результат можно обработать.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (409, 'ru', 'Диалог-мастер: создай диалог подтверждения',
        'Покажи диалог подтверждения с YES_NO_OPTION, обработай результат YES_OPTION')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (412, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Добавление JRadioButtonMenuItem в группу</h2>
<p class="intro">Группа делает пункты взаимоисключающими. Можно выбрать только один пункт из группы. Без группы можно выбрать несколько.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>ButtonGroup</code> — группа кнопок</li>
  <li>Метод <code>add()</code> — добавление в группу</li>
  <li>Создание взаимоисключающих пунктов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Группа необходима для создания взаимоисключающих пунктов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай группу: <code>ButtonGroup group = new ButtonGroup();</code></li>
  <li>Добавь пункты: <code>group.add(item1);<br>
group.add(item2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> ButtonGroup для группировки</li>
  <li><strong>✅ Отлично:</strong> Добавлять все радио-пункты в группу, использовать для взаимоисключающих вариантов</li>
  <li><strong>⚠️ Избегай:</strong> Добавлять в несколько групп</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Пункты будут в одной группе. Можно выбрать только один пункт из группы.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (412, 'ru', 'Радио-пункт меню-мастер: добавь в группу',
        'Создай ButtonGroup, добавь два радио-пункта через add()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (410, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Создание диалога ввода с JOptionPane</h2>
<p class="intro">Диалог ввода позволяет запросить данные у пользователя. Имя, пароль, настройки — всё это можно запросить через диалог. Без этого придётся создавать отдельные формы.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>showInputDialog()</code> — диалог ввода</li>
  <li>Получение введённого текста</li>
  <li>Обработка отмены ввода</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Диалог ввода необходим для запроса данных у пользователя.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог ввода: <code>String input = JOptionPane.showInputDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Введи своё имя:",<br>
&nbsp;&nbsp;"Ввод",<br>
&nbsp;&nbsp;JOptionPane.QUESTION_MESSAGE<br>
);</code></li>
  <li>Обработай результат: <code>if (input != null && !input.isEmpty()) {<br>
&nbsp;&nbsp;label.setText("Введено: " + input);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять на null — пользователь мог отменить</li>
  <li><strong>✅ Отлично:</strong> Проверять на пустую строку, использовать QUESTION_MESSAGE для вопроса</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать null — может быть ошибка</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог с полем ввода. Пользователь может ввести текст и нажать OK или отменить. Введённый текст можно получить.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (410, 'ru', 'Диалог-мастер: создай диалог ввода',
        'Покажи диалог ввода с вопросом "Введи своё имя:", обработай результат, проверь на null и пустоту')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (414, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Обработка изменения состояния в JRadioButtonMenuItem</h2>
<p class="intro">Обработка состояния делает пункт интерактивным. Можно реагировать на выбор, обновлять другие компоненты. Без обработки выбор не будет иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Обработка изменений через ItemListener</li>
  <li>Получение состояния</li>
  <li>Реагирование на изменения</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка состояния необходима для создания интерактивного пункта меню.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>item.addItemListener(e -> {<br>
&nbsp;&nbsp;if (e.getStateChange() == ItemEvent.SELECTED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Выбрано!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addItemListener()</code> для обработки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getStateChange()</code> для проверки, проверять SELECTED для выбора, обновлять другие компоненты</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать состояние</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При изменении состояния будет срабатывать обработчик. Можно обработать выбор и обновить другие компоненты.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (414, 'ru', 'Радио-пункт меню-мастер: обрабатывай изменение состояния',
        'Добавь ItemListener, проверь getStateChange() == SELECTED, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (411, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Создание кастомных кнопок в JOptionPane</h2>
<p class="intro">Кастомные кнопки делают диалог гибким. Можно создать кнопки с нужными названиями, добавить дополнительные опции. Без этого придётся использовать стандартные кнопки.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Создание кастомных кнопок</li>
  <li>Метод <code>showOptionDialog()</code> — диалог с опциями</li>
  <li>Настройка кнопок диалога</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Кастомные кнопки необходимы для создания гибкого диалога с нужными опциями.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай массив кнопок: <code>String[] options = {"Да", "Нет", "Отмена"};</code></li>
  <li>Покажи диалог: <code>int result = JOptionPane.showOptionDialog(<br>
&nbsp;&nbsp;frame,<br>
&nbsp;&nbsp;"Выбери действие",<br>
&nbsp;&nbsp;"Вопрос",<br>
&nbsp;&nbsp;JOptionPane.YES_NO_CANCEL_OPTION,<br>
&nbsp;&nbsp;JOptionPane.QUESTION_MESSAGE,<br>
&nbsp;&nbsp;null,<br>
&nbsp;&nbsp;options,<br>
&nbsp;&nbsp;options[0]<br>
);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>showOptionDialog()</code> для кастомных кнопок</li>
  <li><strong>✅ Отлично:</strong> Создавать понятные названия кнопок, указывать кнопку по умолчанию, обрабатывать результат по индексу</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много кнопок — может быть перегружено</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог с кастомными кнопками. Кнопки будут с указанными названиями. Можно выбрать нужную кнопку.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (411, 'ru', 'Диалог-мастер: создай кастомные кнопки',
        'Создай массив строк с тремя кнопками, покажи диалог через showOptionDialog() с этими кнопками')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (416, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 11: Добавление иконки к JRadioButtonMenuItem</h2>
<p class="intro">Иконка улучшает читаемость. Можно показать визуальный элемент, улучшить понимание назначения пункта. Без иконки пункт будет только с текстом.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setIcon()</code> — установка иконки</li>
  <li>Создание визуально оформленных пунктов</li>
  <li>Улучшение читаемости</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Иконка необходима для улучшения читаемости и визуального оформления.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи иконку: <code>item.setIcon(new ImageIcon("icon.png"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setIcon()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать ImageIcon для загрузки, использовать для визуального оформления, использовать понятные иконки</li>
  <li><strong>⚠️ Избегай:</strong> Слишком больших иконок</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>У пункта меню появится иконка. Пункт будет с визуальным элементом.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (416, 'ru', 'Радио-пункт меню-мастер: добавь иконку', 'Установи иконку через setIcon() с ImageIcon')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (413, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Создание диалога ввода с JOptionPane</h2>
<p class="intro">Диалог ввода позволяет получить данные. Можно запросить имя, значение, текст. Без диалога ввода придётся создавать кастомный диалог.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>showInputDialog()</code> — диалог ввода</li>
  <li>Получение введённых данных</li>
  <li>Создание интерактивных диалогов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Диалог ввода необходим для получения данных от пользователя.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог: <code>String input = JOptionPane.showInputDialog(frame, "Введите имя:");</code></li>
  <li>Обработай результат: <code>if (input != null) {<br>
&nbsp;&nbsp;label.setText("Имя: " + input);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>showInputDialog()</code> для ввода</li>
  <li><strong>✅ Отлично:</strong> Проверять null для отмены, использовать начальное значение, использовать для простого ввода</li>
  <li><strong>⚠️ Избегай:</strong> Слишком сложный ввод — нужен кастомный диалог</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог ввода. Можно ввести значение и получить его.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (413, 'ru', 'Диалог-мастер: создай диалог ввода',
        'Покажи диалог ввода через showInputDialog() с сообщением "Введите имя:", проверь результат на null')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (415, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 10: Создание диалога подтверждения с JOptionPane</h2>
<p class="intro">Диалог подтверждения позволяет получить подтверждение. Можно запросить подтверждение действия, получить ответ. Без диалога нельзя получить подтверждение.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>showConfirmDialog()</code> — диалог подтверждения</li>
  <li>Получение результата (YES, NO, CANCEL)</li>
  <li>Создание интерактивных диалогов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Диалог подтверждения необходим для получения подтверждения действия.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог: <code>int result = JOptionPane.showConfirmDialog(frame, "Удалить?", "Подтверждение", JOptionPane.YES_NO_OPTION);</code></li>
  <li>Обработай результат: <code>if (result == JOptionPane.YES_OPTION) {<br>
&nbsp;&nbsp;label.setText("Да!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>showConfirmDialog()</code> для подтверждения</li>
  <li><strong>✅ Отлично:</strong> Использовать YES_NO_OPTION для да/нет, использовать YES_NO_CANCEL_OPTION для да/нет/отмена, проверять результат</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать результат</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог подтверждения. Можно выбрать да, нет или отмена.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (415, 'ru', 'Диалог-мастер: создай диалог подтверждения',
        'Покажи диалог подтверждения через showConfirmDialog() с YES_NO_OPTION, проверь результат == YES_OPTION')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (417, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 12: Создание диалога сообщения с JOptionPane</h2>
<p class="intro">Диалог сообщения позволяет информировать пользователя. Можно показать сообщение, предупреждение, ошибку. Без диалога нельзя информировать пользователя.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>showMessageDialog()</code> — диалог сообщения</li>
  <li>Типы сообщений (ERROR, INFORMATION, WARNING, QUESTION, PLAIN)</li>
  <li>Создание информативных диалогов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Диалог сообщения необходим для информирования пользователя.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог: <code>JOptionPane.showMessageDialog(frame, "Сообщение", "Заголовок", JOptionPane.INFORMATION_MESSAGE);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>showMessageDialog()</code> для показа</li>
  <li><strong>✅ Отлично:</strong> Использовать INFORMATION_MESSAGE для информации, использовать ERROR_MESSAGE для ошибки, использовать WARNING_MESSAGE для предупреждения</li>
  <li><strong>⚠️ Избегай:</strong> Неправильный тип сообщения</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог сообщения. Можно показать информацию, предупреждение или ошибку.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (417, 'ru', 'Диалог-мастер: создай диалог сообщения',
        'Покажи диалог сообщения через showMessageDialog() с INFORMATION_MESSAGE')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (418, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 13: Установка ширины колонки в JTable</h2>
<p class="intro">Ширина колонки улучшает читаемость. Можно установить нужную ширину, улучшить отображение. Без настройки ширина будет автоматической.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setPreferredWidth()</code> — установка предпочтительной ширины</li>
  <li>Управление шириной колонок</li>
  <li>Улучшение читаемости</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Ширина колонки необходима для улучшения читаемости таблицы.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи модель колонок: <code>TableColumnModel columnModel = table.getColumnModel();</code></li>
  <li>Получи колонку: <code>TableColumn column = columnModel.getColumn(0);</code></li>
  <li>Установи ширину: <code>column.setPreferredWidth(200);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setPreferredWidth()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getColumnModel()</code> для получения, использовать для улучшения читаемости, улучшать отображение</li>
  <li><strong>⚠️ Избегай:</strong> Слишком узкие или широкие колонки</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Колонка будет нужной ширины. Можно улучшить читаемость.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (418, 'ru', 'Таблица-мастер: установи ширину колонки',
        'Получи модель колонок через getColumnModel(), получи колонку 0, установи ширину 200 через setPreferredWidth()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (419, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 14: Установка высоты строки в JTable</h2>
<p class="intro">Высота строки улучшает читаемость. Можно установить нужную высоту, улучшить отображение. Без настройки высота будет автоматической.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setRowHeight()</code> — установка высоты строки</li>
  <li>Управление высотой строк</li>
  <li>Улучшение читаемости</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Высота строки необходима для улучшения читаемости таблицы.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи высоту: <code>table.setRowHeight(30);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setRowHeight()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать для улучшения читаемости, улучшать отображение, делать высоту разумной</li>
  <li><strong>⚠️ Избегай:</strong> Слишком маленькая или большая высота</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Строки будут нужной высоты. Можно улучшить читаемость.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (419, 'ru', 'Таблица-мастер: установи высоту строки', 'Установи высоту строки 30 через setRowHeight()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (420, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 15: Установка режима автоизменения размера в JTable</h2>
<p class="intro">Режим автоизменения определяет поведение. Можно установить, как изменяются колонки при изменении размера таблицы, улучшить компоновку. Без установки режим будет стандартным.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setAutoResizeMode()</code> — установка режима</li>
  <li>Константы <code>JTable.AUTO_RESIZE_ALL_COLUMNS</code>, <code>JTable.AUTO_RESIZE_OFF</code></li>
  <li>Управление автоматическим изменением размера</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Режим автоизменения необходим для управления поведением колонок при изменении размера.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи режим: <code>table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setAutoResizeMode()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать AUTO_RESIZE_ALL_COLUMNS для всех, использовать AUTO_RESIZE_OFF для отключения, улучшать компоновку</li>
  <li><strong>⚠️ Избегай:</strong> Использовать неподходящий режим</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Колонки будут изменяться автоматически. Можно улучшить компоновку.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (420, 'ru', 'Таблица-мастер: установи режим автоизменения размера',
        'Установи режим AUTO_RESIZE_ALL_COLUMNS через setAutoResizeMode()')
ON CONFLICT (task_id, language_code) DO NOTHING;
