-- Flyway migration V3: Lesson 53
-- This migration contains lesson, tasks, and documentation for lesson 53

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (458, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Создание таймера с Timer</h2>
<p class="intro">Timer позволяет выполнять действия периодически. Анимации, обновления интерфейса, проверки состояния — всё это требует таймеров. Без них нельзя создать динамический интерфейс.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>Timer</code> — таймер</li>
  <li>Методы <code>start()</code>, <code>stop()</code>, <code>restart()</code></li>
  <li>Создание периодических действий</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Timer необходим для создания динамического интерфейса с периодическими действиями.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай ActionListener: <code>ActionListener task = new ActionListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void actionPerformed(ActionEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Tick!");<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Создай таймер: <code>Timer timer = new Timer(1000, task);</code></li>
  <li>Запусти таймер: <code>timer.start();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Указывать задержку в миллисекундах</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>setRepeats(false)</code> для одноразового выполнения, использовать <code>setInitialDelay()</code> для начальной задержки</li>
  <li><strong>⚠️ Избегай:</strong> Слишком частая проверка — может быть медленно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Таймер будет срабатывать каждую секунду. Действие будет выполняться периодически. Можно создать анимации, обновления интерфейса.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (458, 'ru', 'Timer-новичок: создай таймер',
        'Создай ActionListener, создай Timer с задержкой 1000 мс, запусти таймер')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (459, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Остановка и перезапуск таймера</h2>
<p class="intro">Управление таймером позволяет контролировать выполнение действий. Можно приостановить анимацию, остановить обновления, перезапустить с начала. Без этого таймер будет работать постоянно.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>stop()</code> — остановка таймера</li>
  <li>Метод <code>restart()</code> — перезапуск таймера</li>
  <li>Управление состоянием таймера</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Управление таймером необходимо для контроля выполнения периодических действий.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Останови таймер: <code>timer.stop();</code></li>
  <li>Перезапусти таймер: <code>timer.restart();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>stop()</code> для остановки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>restart()</code> для перезапуска с начала, проверять <code>isRunning()</code> перед остановкой</li>
  <li><strong>⚠️ Избегай:</strong> Останавливать уже остановленный таймер — безопасно, но избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Таймер можно будет останавливать и перезапускать. Действие будет приостанавливаться и возобновляться.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (459, 'ru', 'Timer-мастер: останавливай и перезапускай таймер',
        'Останови таймер через stop(), затем перезапусти через restart()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (462, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Определение кода клавиши в KeyListener</h2>
<p class="intro">Код клавиши позволяет обрабатывать конкретные клавиши. Enter для подтверждения, Escape для отмены, стрелки для навигации — всё это требует определения кода. Без этого нельзя обработать конкретную клавишу.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getKeyCode()</code> — код клавиши</li>
  <li>Константы кодов клавиш (VK_ENTER, VK_SPACE)</li>
  <li>Обработка конкретных клавиш</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Код клавиши необходим для обработки конкретных клавиш.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обработай нажатие: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getKeyCode() == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Enter нажат!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getKeyCode()</code> для проверки</li>
  <li><strong>✅ Отлично:</strong> Использовать константы VK_* для клавиш, обрабатывать функциональные клавиши, обрабатывать стрелки для навигации</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать код — потеря функциональности</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет обрабатывать конкретные клавиши. При нажатии Enter выполнится одно действие, при Escape — другое.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (462, 'ru', 'KeyListener-мастер: определи код клавиши',
        'Добавь KeyListener, проверь getKeyCode() == VK_ENTER, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (460, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Создание одноразового таймера</h2>
<p class="intro">Одноразовый таймер позволяет выполнить действие с задержкой. Показ сообщения через 3 секунды, автоматическое закрытие окна, отложенное выполнение — всё это требует одноразового таймера. Без этого таймер будет повторяться бесконечно.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setRepeats()</code> — настройка повторения</li>
  <li>Создание одноразового таймера</li>
  <li>Использование таймера для задержек</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Одноразовый таймер необходим для выполнения действий с задержкой.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай таймер: <code>Timer timer = new Timer(3000, e -> {<br>
&nbsp;&nbsp;label.setText("Прошло 3 секунды!");<br>
});</code></li>
  <li>Отключи повторение: <code>timer.setRepeats(false);</code></li>
  <li>Запусти таймер: <code>timer.start();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setRepeats(false)</code> для одноразового выполнения</li>
  <li><strong>✅ Отлично:</strong> Использовать для задержек перед действиями, останавливать таймер в обработчике для надёжности</li>
  <li><strong>⚠️ Избегай:</strong> Забыть setRepeats(false) — будет повторяться</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Таймер выполнится один раз и остановится. Действие произойдёт через указанное время.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (460, 'ru', 'Timer-мастер: создай одноразовый таймер',
        'Создай Timer с задержкой 3000 мс, установи setRepeats(false), запусти таймер')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (463, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Определение символа клавиши в KeyListener</h2>
<p class="intro">Символ клавиши позволяет обрабатывать текст. Можно получить введённый символ, обработать текст. Без символа нельзя обработать текстовый ввод.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getKeyChar()</code> — получение символа</li>
  <li>Различение символов и кодов</li>
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
  <li>Обработай нажатие: <code>component.addKeyListener(new KeyAdapter() {<br>
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
  <li><strong>✅ Используй:</strong> <code>getKeyChar()</code> для получения символа</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>keyTyped()</code> для текстового ввода, обрабатывать буквы и цифры, фильтровать символы</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать символ — потеря функциональности</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить введённый символ. При вводе можно определить символ.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (463, 'ru', 'KeyListener-мастер: определи символ клавиши',
        'Добавь KeyListener, получи символ через getKeyChar() в keyTyped(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (461, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Установка начальной задержки в Timer</h2>
<p class="intro">Начальная задержка позволяет отложить старт таймера. Показ сообщения через 5 секунд, автоматическое обновление после загрузки, отложенные действия — всё это требует начальной задержки. Без этого таймер начнёт работу сразу.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setInitialDelay()</code> — установка начальной задержки</li>
  <li>Разница между начальной задержкой и интервалом</li>
  <li>Создание таймеров с задержкой старта</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Начальная задержка необходима для отложенного старта таймера.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай таймер: <code>Timer timer = new Timer(1000, e -> {<br>
&nbsp;&nbsp;label.setText("Tick!");<br>
});</code></li>
  <li>Установи начальную задержку: <code>timer.setInitialDelay(5000);</code></li>
  <li>Запусти таймер: <code>timer.start();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setInitialDelay()</code> для задержки старта</li>
  <li><strong>✅ Отлично:</strong> Устанавливать разную задержку и интервал, использовать для отложенных действий</li>
  <li><strong>⚠️ Избегай:</strong> Слишком большая задержка — пользователь будет ждать</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Таймер начнёт работу через указанное время. Первое выполнение произойдёт через начальную задержку, затем по интервалу.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (461, 'ru', 'Timer-мастер: установи начальную задержку',
        'Создай Timer с интервалом 1000 мс, установи setInitialDelay(5000), запусти таймер')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (464, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Определение модификаторов в KeyListener</h2>
<p class="intro">Модификаторы позволяют обрабатывать комбинации. Можно определить, нажаты ли Ctrl, Alt, Shift, обработать комбинации. Без модификаторов нельзя обработать комбинации.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getModifiersEx()</code> — получение модификаторов</li>
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
  <li>Обработай нажатие: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if ((e.getModifiersEx() & InputEvent.CTRL_DOWN_MASK) != 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Ctrl нажат!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getModifiersEx()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Проверять CTRL_DOWN_MASK для Ctrl, проверять ALT_DOWN_MASK для Alt, проверять SHIFT_DOWN_MASK для Shift</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать модификаторы</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет определить модификаторы. При нажатии можно узнать, нажаты ли Ctrl, Alt, Shift.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (464, 'ru', 'KeyListener-мастер: определи модификаторы',
        'Добавь KeyListener, проверь getModifiersEx() & CTRL_DOWN_MASK, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (465, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Определение расположения клавиши в KeyListener</h2>
<p class="intro">Расположение клавиши позволяет различать позиции. Можно определить, левая или правая клавиша нажата, обработать соответственно. Без проверки нельзя различить позиции.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getKeyLocation()</code> — получение расположения</li>
  <li>Различение левой и правой клавиши</li>
  <li>Обработка разных расположений</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Расположение клавиши необходимо для различения позиций клавиш.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обработай нажатие: <code>component.addKeyListener(new KeyAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getKeyLocation() == KeyEvent.KEY_LOCATION_LEFT) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Левая клавиша!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getKeyLocation()</code> для проверки</li>
  <li><strong>✅ Отлично:</strong> Проверять KEY_LOCATION_LEFT для левой, проверять KEY_LOCATION_RIGHT для правой, проверять KEY_LOCATION_STANDARD для стандартной</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать расположение</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет определить расположение клавиши. При нажатии можно узнать, левая или правая клавиша.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (465, 'ru', 'KeyListener-мастер: определи расположение клавиши',
        'Добавь KeyListener, проверь getKeyLocation() == KEY_LOCATION_LEFT, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
