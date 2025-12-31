-- Flyway migration V3: Lesson 47
-- This migration contains lesson, tasks, and documentation for lesson 47

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (421, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Реагирование на нажатия клавиш с KeyListener</h2>
<p class="intro">KeyListener позволяет реагировать на клавиатуру. Горячие клавиши, ввод текста, навигация — всё это требует обработки клавиатуры. Без него интерфейс не будет интерактивным.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>KeyListener</code> — обработка клавиатуры</li>
  <li>Методы <code>keyPressed()</code>, <code>keyReleased()</code>, <code>keyTyped()</code></li>
  <li>Обработка нажатий клавиш</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>KeyListener необходим для создания интерактивного интерфейса с обработкой клавиатуры.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай слушатель: <code>KeyListener listener = new KeyListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyPressed(KeyEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getKeyCode() == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Нажат Enter!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyReleased(KeyEvent e) {}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void keyTyped(KeyEvent e) {}<br>
};</code></li>
  <li>Добавь слушатель к компоненту: <code>component.addKeyListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getKeyCode()</code> для физических клавиш</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getKeyChar()</code> для символов, проверять модификаторы: <code>isShiftDown()</code>, <code>isControlDown()</code></li>
  <li><strong>⚠️ Избегай:</strong> Обрабатывать все клавиши — может быть медленно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При нажатии клавиш будет срабатывать обработчик. Можно обрабатывать любые клавиши и комбинации.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (421, 'ru', 'KeyListener-новичок: реагируй на нажатия клавиш',
        'Создай KeyListener, обработай нажатие Enter и добавь слушатель к компоненту')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (422, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Обработка комбинаций клавиш с KeyListener</h2>
<p class="intro">Обработка комбинаций клавиш делает интерфейс быстрым. Горячие клавиши, быстрые действия, комбинации — всё это требует обработки модификаторов. Без этого нельзя создать удобные горячие клавиши.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Методы <code>isControlDown()</code>, <code>isShiftDown()</code>, <code>isAltDown()</code></li>
  <li>Обработка комбинаций клавиш</li>
  <li>Создание горячих клавиш</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка комбинаций клавиш необходима для создания удобных горячих клавиш.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Проверь модификаторы: <code>if (e.isControlDown() && e.getKeyCode() == KeyEvent.VK_C) {<br>
&nbsp;&nbsp;label.setText("Ctrl+C нажато!");<br>
}</code></li>
  <li>Или проверь Shift: <code>if (e.isShiftDown() && e.getKeyCode() == KeyEvent.VK_ENTER) {<br>
&nbsp;&nbsp;label.setText("Shift+Enter нажато!");<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять модификаторы перед проверкой клавиши</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>isControlDown()</code> для Ctrl, использовать <code>isShiftDown()</code> для Shift, использовать <code>isAltDown()</code> для Alt</li>
  <li><strong>⚠️ Избегай:</strong> Обрабатывать все комбинации — может быть сложно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Комбинации клавиш будут обрабатываться. Можно создать горячие клавиши Ctrl+C, Shift+Enter и другие.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (422, 'ru', 'KeyListener-мастер: обрабатывай комбинации клавиш',
        'В keyPressed проверь isControlDown() и VK_C, выведи сообщение при нажатии Ctrl+C')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (424, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Добавление клея в BoxLayout</h2>
<p class="intro">Клей создаёт растягивающееся пространство. Можно разделить компоненты, прижать их к краям, создать гибкие компоновки. Без клея компоненты будут прижаты друг к другу.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>Box.createHorizontalGlue()</code> — горизонтальный клей</li>
  <li>Метод <code>Box.createVerticalGlue()</code> — вертикальный клей</li>
  <li>Создание растягивающегося пространства</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Клей необходим для создания гибких компоновок с разделением компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай клей: <code>Component glue = Box.createHorizontalGlue();</code></li>
  <li>Добавь компоненты и клей: <code>add(button1);<br>
add(glue);<br>
add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createHorizontalGlue()</code> для горизонтального</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>createVerticalGlue()</code> для вертикального, разделять компоненты клеем, прижимать компоненты к краям</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много клея — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между компонентами появится растягивающееся пространство. Клей займёт доступное пространство. Компоненты будут разделены.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (424, 'ru', 'BoxLayout-мастер: добавь клей',
        'Создай горизонтальный клей через createHorizontalGlue(), добавь компоненты и клей')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (423, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Обработка отпускания клавиш с KeyListener</h2>
<p class="intro">Обработка отпускания клавиш позволяет отслеживать состояние. Игры, анимации, горячие клавиши — всё это требует обработки отпускания. Без этого нельзя определить, когда действие должно прекратиться.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>keyReleased()</code> — обработка отпускания</li>
  <li>Отслеживание состояния клавиш</li>
  <li>Обработка отпускания клавиш</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка отпускания клавиш необходима для отслеживания состояния и управления действиями.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Переопредели keyReleased: <code>@Override<br>
public void keyReleased(KeyEvent e) {<br>
&nbsp;&nbsp;if (e.getKeyCode() == KeyEvent.VK_SPACE) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Пробел отпущен!");<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>keyReleased()</code> для обработки отпускания</li>
  <li><strong>✅ Отлично:</strong> Останавливать действия при отпускании, использовать для управления состоянием</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать keyReleased — действие не остановится</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При отпускании клавиши будет срабатывать обработчик. Можно остановить действие, изменить состояние.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (423, 'ru', 'KeyListener-мастер: обрабатывай отпускание клавиш',
        'Переопредели keyReleased(), обработай отпускание VK_SPACE, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (425, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Добавление жёсткой области в BoxLayout</h2>
<p class="intro">Жёсткая область создаёт фиксированное пространство. Можно разделить компоненты фиксированным отступом. Без жёсткой области отступ будет изменяться.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>Box.createRigidArea()</code> — жёсткая область</li>
  <li>Создание фиксированного пространства</li>
  <li>Разделение компонентов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Жёсткая область необходима для создания фиксированных отступов между компонентами.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай область: <code>Component area = Box.createRigidArea(new Dimension(10, 10));</code></li>
  <li>Добавь компоненты и область: <code>add(button1);<br>
add(area);<br>
add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createRigidArea()</code> для жёсткой области</li>
  <li><strong>✅ Отлично:</strong> Использовать Dimension для размера, разделять компоненты областью, использовать для фиксированных отступов</li>
  <li><strong>⚠️ Избегай:</strong> Слишком большая область — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между компонентами появится фиксированное пространство. Отступ будет постоянным.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (425, 'ru', 'BoxLayout-мастер: добавь жёсткую область',
        'Создай жёсткую область через createRigidArea() с размером 10x10, добавь между компонентами')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (426, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Добавление распорки в BoxLayout</h2>
<p class="intro">Распорка создаёт фиксированное пространство. Можно разделить компоненты фиксированным отступом. Без распорки отступ будет изменяться.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>Box.createHorizontalStrut()</code> — горизонтальная распорка</li>
  <li>Метод <code>Box.createVerticalStrut()</code> — вертикальная распорка</li>
  <li>Создание фиксированного пространства</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Распорка необходима для создания фиксированных отступов между компонентами.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай распорку: <code>Component strut = Box.createHorizontalStrut(20);</code></li>
  <li>Добавь компоненты и распорку: <code>add(button1);<br>
add(strut);<br>
add(button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>createHorizontalStrut()</code> для горизонтальной</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>createVerticalStrut()</code> для вертикальной, разделять компоненты распоркой, использовать для фиксированных отступов</li>
  <li><strong>⚠️ Избегай:</strong> Слишком большая распорка — может быть избыточно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между компонентами появится фиксированное пространство. Отступ будет постоянным.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (426, 'ru', 'BoxLayout-мастер: добавь распорку',
        'Создай горизонтальную распорку через createHorizontalStrut(20), добавь между компонентами')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (427, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Настройка максимального размера в BoxLayout</h2>
<p class="intro">Максимальный размер ограничивает компонент. Можно указать максимальный размер, предотвратить чрезмерное растяжение. Без ограничения компонент может растянуться слишком сильно.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setMaximumSize()</code> — установка максимального размера</li>
  <li>Ограничение размера компонента</li>
  <li>Создание контролируемых компоновок</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Максимальный размер необходим для предотвращения чрезмерного растяжения компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи максимальный размер: <code>component.setMaximumSize(new Dimension(200, 100));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setMaximumSize()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать Dimension для размера, использовать для ограничения, адаптировать под содержимое</li>
  <li><strong>⚠️ Избегай:</strong> Слишком маленький размер — может быть неудобно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компонент будет ограничен максимальным размером. Компонент не растянется больше указанного.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (427, 'ru', 'BoxLayout-мастер: настрой максимальный размер',
        'Установи максимальный размер 200x100 через setMaximumSize()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (428, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Установка отступов в BorderLayout</h2>
<p class="intro">Отступы улучшают визуальный вид. Можно добавить расстояние между компонентами, улучшить читаемость. Без отступов компоненты будут вплотную.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Конструктор <code>BorderLayout(int, int)</code> — отступы</li>
  <li>Горизонтальные и вертикальные отступы</li>
  <li>Улучшение визуального вида</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Отступы необходимы для улучшения визуального вида и читаемости.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай layout с отступами: <code>BorderLayout layout = new BorderLayout(10, 10);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>BorderLayout(int, int)</code> для отступов</li>
  <li><strong>✅ Отлично:</strong> Использовать разумные значения, улучшать визуальный вид, улучшать читаемость</li>
  <li><strong>⚠️ Избегай:</strong> Слишком большие отступы</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Между компонентами будут отступы. Можно улучшить визуальный вид.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (428, 'ru', 'BorderLayout-мастер: установи отступы',
        'Создай BorderLayout с отступами 10, 10 через конструктор BorderLayout(10, 10)')
ON CONFLICT (task_id, language_code) DO NOTHING;
