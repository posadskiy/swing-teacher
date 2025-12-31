-- Flyway migration V3: Lesson 43
-- This migration contains lesson, tasks, and documentation for lesson 43

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (370, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Создание групповой компоновки с GroupLayout</h2>
<p class="intro">GroupLayout позволяет создавать сложные компоновки. Группы компонентов, выравнивание, последовательное и параллельное размещение — всё это требует GroupLayout. Без него сложные формы будут выглядеть неаккуратно.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>GroupLayout</code> — групповая компоновка</li>
  <li>Классы <code>SequentialGroup</code> и <code>ParallelGroup</code> — группы</li>
  <li>Создание групповой компоновки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>GroupLayout необходим для создания сложных компоновок.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай менеджер: <code>GroupLayout layout = new GroupLayout(panel);<br>
panel.setLayout(layout);</code></li>
  <li>Создай горизонтальную группу: <code>layout.setHorizontalGroup(<br>
&nbsp;&nbsp;layout.createSequentialGroup()<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button2)<br>
);</code></li>
  <li>Создай вертикальную группу: <code>layout.setVerticalGroup(<br>
&nbsp;&nbsp;layout.createParallelGroup()<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button2)<br>
);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createSequentialGroup()</code> для последовательного размещения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>createParallelGroup()</code> для параллельного размещения, комбинировать последовательные и параллельные группы</li>
  <li><strong>⚠️ Избегай:</strong> Слишком сложной структуры — сложно поддерживать</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты расположатся в группах. Горизонтально и вертикально — как настроишь.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (370, 'ru', 'GroupLayout-новичок: создай групповую компоновку',
        'Создай GroupLayout, создай горизонтальную последовательную группу с двумя кнопками, создай вертикальную параллельную группу')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (371, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Добавление отступов между компонентами в GroupLayout</h2>
<p class="intro">Отступы делают интерфейс аккуратным. Компоненты не будут прижаты друг к другу, будет визуальное разделение. Без отступов интерфейс будет выглядеть перегруженным.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>addGap()</code> — добавление отступа</li>
  <li>Создание отступов между компонентами</li>
  <li>Настройка размеров отступов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Отступы необходимы для создания аккуратного интерфейса с визуальным разделением.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь компонент: <code>layout.createSequentialGroup()<br>
&nbsp;&nbsp;.addComponent(button1)</code></li>
  <li>Добавь отступ: <code>.addGap(10)</code></li>
  <li>Добавь ещё компонент: <code>.addComponent(button2)</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addGap()</code> для отступов</li>
  <li><strong>✅ Отлично:</strong> Использовать одинаковые отступы для единообразия, добавлять отступы в начале и конце групп</li>
  <li><strong>⚠️ Избегай:</strong> Слишком больших отступов — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между компонентами появятся отступы. Компоненты не будут прижаты друг к другу. Интерфейс будет выглядеть аккуратно.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (371, 'ru', 'GroupLayout-мастер: добавь отступы между компонентами',
        'В последовательной группе добавь компонент, добавь отступ 10, добавь ещё компонент')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (373, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Обработка нескольких кнопок одним ActionListener</h2>
<p class="intro">Один обработчик для нескольких кнопок упрощает код. Можно определить источник события и выполнить нужное действие. Без этого придётся создавать отдельный обработчик для каждой кнопки.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Обработка нескольких источников событий</li>
  <li>Метод <code>getSource()</code> — определение источника</li>
  <li>Создание универсальных обработчиков</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Один обработчик необходим для упрощения кода при обработке нескольких кнопок.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай обработчик: <code>ActionListener listener = e -> {<br>
&nbsp;&nbsp;if (e.getSource() == button1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Кнопка 1");<br>
&nbsp;&nbsp;} else if (e.getSource() == button2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Кнопка 2");<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Добавь к кнопкам: <code>button1.addActionListener(listener);<br>
button2.addActionListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getSource()</code> для определения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getActionCommand()</code> для команды, использовать один обработчик для группы, использовать switch для множества вариантов</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много условий — может быть сложно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Один обработчик будет работать для всех кнопок. При клике на любую кнопку сработает обработчик, который определит источник.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (373, 'ru', 'ActionListener-мастер: обрабатывай несколько кнопок',
        'Создай ActionListener, проверь getSource() для двух кнопок, добавь обработчик к обеим кнопкам')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (372, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Создание параллельных групп в GroupLayout</h2>
<p class="intro">Параллельные группы позволяют выравнивать компоненты. Можно создать колонки, строки, сложные компоновки. Без этого компоненты будут расположены только последовательно.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>createParallelGroup()</code> — создание параллельной группы</li>
  <li>Выравнивание компонентов параллельно</li>
  <li>Создание сложных компоновок</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Параллельные группы необходимы для выравнивания компонентов и создания сложных компоновок.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай параллельную группу: <code>layout.setHorizontalGroup(<br>
&nbsp;&nbsp;layout.createParallelGroup()<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;.addComponent(button2)<br>
);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createParallelGroup()</code> для параллельного размещения</li>
  <li><strong>✅ Отлично:</strong> Комбинировать последовательные и параллельные группы, использовать для создания колонок и строк</li>
  <li><strong>⚠️ Избегай:</strong> Только параллельные группы — может быть негибко</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты будут выровнены параллельно. Они будут расположены рядом друг с другом.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (372, 'ru', 'GroupLayout-мастер: создай параллельные группы',
        'Создай горизонтальную параллельную группу с двумя кнопками')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (374, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Использование команды действия в ActionListener</h2>
<p class="intro">Команда действия позволяет идентифицировать источник. Можно определить, какая кнопка нажата, без проверки источника. Без команды придётся проверять источник.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getActionCommand()</code> — получение команды</li>
  <li>Метод <code>setActionCommand()</code> — установка команды</li>
  <li>Идентификация источника через команду</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Команда действия необходима для идентификации источника события.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи команду: <code>button.setActionCommand("SAVE");</code></li>
  <li>Получи команду в обработчике: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;if ("SAVE".equals(cmd)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Сохранение!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setActionCommand()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getActionCommand()</code> для получения, использовать понятные команды, использовать для идентификации</li>
  <li><strong>⚠️ Избегай:</strong> Дублировать команды</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В обработчике можно будет получить команду. При нажатии можно определить команду.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (374, 'ru', 'ActionListener-мастер: используй команду действия',
        'Установи команду "SAVE" через setActionCommand(), получи команду в ActionListener через getActionCommand()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (375, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Определение времени события в ActionListener</h2>
<p class="intro">Время события позволяет отслеживать действия. Можно узнать, когда произошло событие, создать логи, отследить последовательность. Без времени нельзя отследить действия.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getWhen()</code> — получение времени</li>
  <li>Определение времени события</li>
  <li>Создание временных меток</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Время события необходимо для отслеживания действий и создания логов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи время: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;long when = e.getWhen();<br>
&nbsp;&nbsp;label.setText("Время: " + new Date(when));<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getWhen()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для логирования, использовать для отслеживания, преобразовывать в Date</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать время</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить время события. При нажатии можно узнать время.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (375, 'ru', 'ActionListener-мастер: определи когда',
        'Добавь ActionListener, получи время через getWhen(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (377, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Получение символа клавиши в KeyListener</h2>
<p class="intro">Символ клавиши важен для текстового ввода. Можно получить символ, обработать текст, улучшить функциональность. Без символа нельзя обработать текст.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getKeyChar()</code> — получение символа</li>
  <li>Получение символа нажатой клавиши</li>
  <li>Обработка текстового ввода</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Символ клавиши необходим для обработки текстового ввода.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи символ: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyTyped(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;char ch = e.getKeyChar();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Символ: " + ch);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getKeyChar()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>keyTyped()</code> для символов, обрабатывать текстовый ввод, улучшать функциональность</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать специальные клавиши</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить символ нажатой клавиши. Можно обработать текстовый ввод.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (377, 'ru', 'KeyListener-мастер: получи символ клавиши',
        'Добавь KeyListener, переопредели keyTyped(), получи символ через getKeyChar(), выведи')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (376, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Определение модификаторов в ActionListener</h2>
<p class="intro">Модификаторы позволяют обрабатывать комбинации. Можно определить, нажаты ли Ctrl, Alt, Shift, обработать комбинации. Без модификаторов нельзя обработать комбинации.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getModifiers()</code> — получение модификаторов</li>
  <li>Проверка Ctrl, Alt, Shift</li>
  <li>Обработка комбинаций клавиш</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Модификаторы необходимы для обработки комбинаций клавиш.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи модификаторы: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;int modifiers = e.getModifiers();<br>
&nbsp;&nbsp;if ((modifiers & ActionEvent.CTRL_MASK) != 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Ctrl нажат!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getModifiers()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Проверять CTRL_MASK для Ctrl, проверять ALT_MASK для Alt, проверять SHIFT_MASK для Shift</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать модификаторы</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет определить модификаторы. При нажатии можно узнать, нажаты ли Ctrl, Alt, Shift.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (376, 'ru', 'ActionListener-мастер: определи модификаторы',
        'Добавь ActionListener, проверь getModifiers() & CTRL_MASK, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (379, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 10: Получение кода клавиши в KeyListener</h2>
<p class="intro">Код клавиши важен для специальных клавиш. Можно обработать Enter, Escape, стрелки, улучшить функциональность. Без кода нельзя обработать специальные клавиши.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getKeyCode()</code> — получение кода клавиши</li>
  <li>Константы <code>KeyEvent.VK_*</code> — коды клавиш</li>
  <li>Обработка специальных клавиш</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Код клавиши необходим для обработки специальных клавиш.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи код: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int code = e.getKeyCode();<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (code == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enter нажат");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getKeyCode()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>keyPressed()</code> для кодов, использовать VK_* константы, обрабатывать специальные клавиши</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать специальные клавиши</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить код нажатой клавиши. Можно обработать специальные клавиши.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (379, 'ru', 'KeyListener-мастер: получи код клавиши',
        'Добавь KeyListener, переопредели keyPressed(), получи код через getKeyCode(), проверь VK_ENTER')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (382, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 13: Получение символа клавиши в KeyListener</h2>
<p class="intro">Символ клавиши важен для текстового ввода. Можно обработать символы, улучшить функциональность. Без символа нельзя обработать текстовый ввод.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getKeyChar()</code> — получение символа</li>
  <li>Обработка символьных клавиш</li>
  <li>Улучшение функциональности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Символ клавиши необходим для обработки текстового ввода.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи символ: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyTyped(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;char ch = e.getKeyChar();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Символ: " + ch);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getKeyChar()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>keyTyped()</code> для символов, использовать для текстового ввода, улучшать функциональность</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать специальные символы</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить символ нажатой клавиши. Можно обработать текстовый ввод.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (382, 'ru', 'KeyListener-мастер: получи символ клавиши',
        'Добавь KeyListener, переопредели keyTyped(), получи символ через getKeyChar(), выведи')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (378, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Создание последовательной группы в GroupLayout</h2>
<p class="intro">Последовательная группа размещает компоненты последовательно. Можно разместить компоненты один за другим, улучшить компоновку. Без группы компоненты не будут размещены.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>createSequentialGroup()</code> — создание последовательной группы</li>
  <li>Последовательное размещение компонентов</li>
  <li>Улучшение компоновки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Последовательная группа необходима для последовательного размещения компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай группу: <code>GroupLayout.SequentialGroup hGroup = layout.createSequentialGroup();</code></li>
  <li>Добавь компоненты: <code>hGroup.addComponent(component1).addComponent(component2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createSequentialGroup()</code> для создания</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>addComponent()</code> для добавления, использовать для последовательности, улучшать компоновку</li>
  <li><strong>⚠️ Избегай:</strong> Смешивать с параллельной группой неправильно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты будут размещены последовательно. Можно улучшить компоновку.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (378, 'ru', 'GroupLayout-мастер: создай последовательную группу',
        'Создай последовательную группу через createSequentialGroup(), добавь компоненты через addComponent()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (380, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 11: Создание параллельной группы в GroupLayout</h2>
<p class="intro">Параллельная группа размещает компоненты параллельно. Можно разместить компоненты рядом, выровнять, улучшить компоновку. Без группы компоненты не будут размещены.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>createParallelGroup()</code> — создание параллельной группы</li>
  <li>Параллельное размещение компонентов</li>
  <li>Улучшение компоновки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Параллельная группа необходима для параллельного размещения компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай группу: <code>GroupLayout.ParallelGroup vGroup = layout.createParallelGroup();</code></li>
  <li>Добавь компоненты: <code>vGroup.addComponent(component1).addComponent(component2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createParallelGroup()</code> для создания</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>addComponent()</code> для добавления, использовать для параллельности, улучшать компоновку</li>
  <li><strong>⚠️ Избегай:</strong> Смешивать с последовательной группой неправильно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты будут размещены параллельно. Можно улучшить компоновку.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (380, 'ru', 'GroupLayout-мастер: создай параллельную группу',
        'Создай параллельную группу через createParallelGroup(), добавь компоненты через addComponent()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (381, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 12: Добавление зазора в GroupLayout</h2>
<p class="intro">Зазор создаёт расстояние. Можно добавить расстояние между компонентами, улучшить компоновку. Без зазора компоненты будут вплотную.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>addGap()</code> — добавление зазора</li>
  <li>Создание расстояния между компонентами</li>
  <li>Улучшение компоновки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Зазор необходим для создания расстояния между компонентами.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь зазор: <code>hGroup.addGap(10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addGap()</code> для добавления</li>
  <li><strong>✅ Отлично:</strong> Использовать для создания расстояния, использовать для улучшения компоновки, улучшать расположение</li>
  <li><strong>⚠️ Избегай:</strong> Слишком больших зазоров</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между компонентами появится зазор. Можно улучшить компоновку.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (381, 'ru', 'GroupLayout-мастер: добавь зазор', 'Добавь зазор 10 через addGap() в группу')
ON CONFLICT (task_id, language_code) DO NOTHING;
