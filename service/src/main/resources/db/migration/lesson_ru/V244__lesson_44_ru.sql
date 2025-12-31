-- Flyway migration V3: Lesson 44
-- This migration contains lesson, tasks, and documentation for lesson 44

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (383, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Создание пружинной компоновки с SpringLayout</h2>
<p class="intro">SpringLayout позволяет создавать гибкие компоновки. Компоненты могут "притягиваться" друг к другу через пружины. Это даёт максимальный контроль над размещением.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>SpringLayout</code> — пружинная компоновка</li>
  <li>Класс <code>Spring</code> — пружина</li>
  <li>Создание пружинных связей</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>SpringLayout необходим для создания гибких компоновок с максимальным контролем.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи менеджер: <code>SpringLayout layout = new SpringLayout();<br>
setLayout(layout);</code></li>
  <li>Добавь компонент: <code>add(button);</code></li>
  <li>Установи пружинные связи: <code>layout.putConstraint(SpringLayout.WEST, button, 10, SpringLayout.WEST, this);<br>
layout.putConstraint(SpringLayout.NORTH, button, 10, SpringLayout.NORTH, this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>putConstraint()</code> для установки связей</li>
  <li><strong>✅ Отлично:</strong> Связывать компоненты друг с другом, использовать <code>Spring.constant()</code> для фиксированных значений</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много связей — сложно управлять</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты расположатся с пружинными связями. При изменении размера окна компоненты будут "притягиваться" друг к другу.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (383, 'ru', 'SpringLayout-новичок: создай пружинную компоновку',
        'Установи SpringLayout, добавь кнопку, установи связи WEST и NORTH с отступом 10 от края контейнера')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (384, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Связывание компонентов друг с другом в SpringLayout</h2>
<p class="intro">Связывание компонентов создаёт гибкую компоновку. Компоненты будут сохранять расстояния друг от друга при изменении размера окна. Без этого компоненты могут "разъехаться".</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Связывание компонентов друг с другом</li>
  <li>Создание пружинных связей между компонентами</li>
  <li>Настройка расстояний между компонентами</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Связывание компонентов необходимо для создания гибкой компоновки с сохранением расстояний.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь компоненты: <code>add(button1);<br>
add(button2);</code></li>
  <li>Свяжи компоненты: <code>layout.putConstraint(SpringLayout.EAST, button1, 10, SpringLayout.WEST, button2);</code></li>
  <li>Или свяжи вертикально: <code>layout.putConstraint(SpringLayout.SOUTH, button1, 10, SpringLayout.NORTH, button2);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Связывать компоненты через <code>putConstraint()</code></li>
  <li><strong>✅ Отлично:</strong> Использовать EAST-WEST для горизонтальной связи, использовать SOUTH-NORTH для вертикальной связи, связывать с контейнером для привязки к краям</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много связей — сложно управлять</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты будут связаны друг с другом. При изменении размера окна они сохранят расстояния.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (384, 'ru', 'SpringLayout-мастер: связывай компоненты друг с другом',
        'Добавь две кнопки, свяжи EAST первой кнопки с WEST второй с отступом 10')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (386, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Определение количества кликов в MouseListener</h2>
<p class="intro">Количество кликов позволяет различать действия. Одинарный клик для выбора, двойной для открытия — всё это требует определения количества кликов. Без этого нельзя различить типы кликов.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getClickCount()</code> — количество кликов</li>
  <li>Различение одинарного и двойного клика</li>
  <li>Обработка разных типов кликов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Определение количества кликов необходимо для различения типов действий.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обработай клик: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getClickCount() == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Двойной клик!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getClickCount()</code> для проверки</li>
  <li><strong>✅ Отлично:</strong> Обрабатывать одинарный клик (1), обрабатывать двойной клик (2), обрабатывать тройной клик (3)</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать количество — потеря функциональности</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет различать типы кликов. При одинарном клике выполнится одно действие, при двойном — другое.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (386, 'ru', 'MouseListener-мастер: определи количество кликов',
        'Добавь MouseListener, проверь getClickCount() == 2 для двойного клика, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (385, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Использование арифметики пружин в SpringLayout</h2>
<p class="intro">Арифметика пружин позволяет создавать сложные компоновки. Можно вычислять расстояния, создавать зависимости, делать адаптивные интерфейсы. Без этого придётся использовать только фиксированные значения.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Методы <code>Spring.sum()</code>, <code>Spring.max()</code>, <code>Spring.min()</code></li>
  <li>Арифметические операции с пружинами</li>
  <li>Создание сложных пружинных связей</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Арифметика пружин необходима для создания сложных компоновок с вычисляемыми расстояниями.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай пружины: <code>Spring spring1 = Spring.constant(10);<br>
Spring spring2 = Spring.constant(20);</code></li>
  <li>Сложи пружины: <code>Spring sum = Spring.sum(spring1, spring2);</code></li>
  <li>Используй в связи: <code>layout.putConstraint(SpringLayout.WEST, button, sum, SpringLayout.WEST, this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>Spring.sum()</code> для сложения</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>Spring.max()</code> для максимума, использовать <code>Spring.min()</code> для минимума, комбинировать несколько операций</li>
  <li><strong>⚠️ Избегай:</strong> Слишком сложных вычислений — может быть непонятно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Пружины будут вычисляться математически. Расстояния будут зависеть от других компонентов.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (385, 'ru', 'SpringLayout-мастер: используй арифметику пружин',
        'Создай две пружины через Spring.constant(10) и Spring.constant(20), сложи их через Spring.sum(), используй в putConstraint')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (387, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Определение кнопки мыши в MouseListener</h2>
<p class="intro">Определение кнопки позволяет различать действия. Левая кнопка для выбора, правая для контекстного меню — всё это требует определения кнопки. Без этого нельзя различить кнопки.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getButton()</code> — получение кнопки</li>
  <li>Константы кнопок (BUTTON1, BUTTON2, BUTTON3)</li>
  <li>Различение левой, правой и средней кнопки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Определение кнопки необходимо для различения действий в зависимости от нажатой кнопки.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обработай клик: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getButton() == MouseEvent.BUTTON1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Левая кнопка!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getButton()</code> для проверки</li>
  <li><strong>✅ Отлично:</strong> Использовать BUTTON1 для левой, использовать BUTTON2 для средней, использовать BUTTON3 для правой</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать кнопку — потеря функциональности</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет различать кнопки мыши. При клике можно определить, какая кнопка нажата.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (387, 'ru', 'MouseListener-мастер: определи кнопку мыши',
        'Добавь MouseListener, проверь getButton() == BUTTON1, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (390, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Запрос фокуса в FocusListener</h2>
<p class="intro">Запрос фокуса позволяет управлять фокусом. Можно программно установить фокус, улучшить навигацию. Без запроса фокус будет устанавливаться автоматически.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>requestFocus()</code> — запрос фокуса</li>
  <li>Метод <code>requestFocusInWindow()</code> — запрос фокуса в окне</li>
  <li>Управление фокусом</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Запрос фокуса необходим для программного управления фокусом.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Запроси фокус: <code>component.requestFocusInWindow();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>requestFocusInWindow()</code> для запроса</li>
  <li><strong>✅ Отлично:</strong> Использовать для управления фокусом, улучшать навигацию, использовать для улучшения UX</li>
  <li><strong>⚠️ Избегай:</strong> Запрашивать слишком часто</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компонент получит фокус. Можно программно установить фокус.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (390, 'ru', 'FocusListener-мастер: запроси фокус', 'Запроси фокус через requestFocusInWindow()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (388, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Определение позиции мыши в MouseListener</h2>
<p class="intro">Позиция мыши позволяет определить место клика. Можно узнать, где произошёл клик, обработать контекстное действие. Без позиции нельзя определить место клика.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getX()</code> — координата X</li>
  <li>Метод <code>getY()</code> — координата Y</li>
  <li>Определение позиции курсора</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Определение позиции мыши необходимо для обработки контекстных действий.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обработай клик: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int x = e.getX();<br>
&nbsp;&nbsp;&nbsp;&nbsp;int y = e.getY();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Позиция: (" + x + ", " + y + ")");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getX()</code> для X</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getY()</code> для Y, использовать <code>getPoint()</code> для точки, использовать для контекстных действий</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать позицию</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить позицию мыши. При клике можно узнать координаты.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (388, 'ru', 'MouseListener-мастер: определи позицию мыши',
        'Добавь MouseListener, получи X через getX(), Y через getY(), выведи позицию')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (393, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 11: Управление фокусируемостью в FocusListener</h2>
<p class="intro">Фокусируемость определяет доступность фокуса. Можно сделать компонент недоступным для фокуса, улучшить навигацию. Без управления все компоненты фокусируемы.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setFocusable()</code> — установка фокусируемости</li>
  <li>Метод <code>isFocusable()</code> — проверка фокусируемости</li>
  <li>Управление доступностью фокуса</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Управление фокусируемостью необходимо для улучшения навигации.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Отключи фокус: <code>component.setFocusable(false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setFocusable()</code> для управления</li>
  <li><strong>✅ Отлично:</strong> Использовать false для отключения, использовать true для включения, улучшать навигацию</li>
  <li><strong>⚠️ Избегай:</strong> Отключать для интерактивных компонентов</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компонент будет недоступен для фокуса. Можно улучшить навигацию.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (393, 'ru', 'FocusListener-мастер: управляй фокусируемостью', 'Отключи фокус через setFocusable(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (389, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Определение количества кликов в MouseListener</h2>
<p class="intro">Количество кликов позволяет различать типы. Можно обработать одинарный, двойной, тройной клик, создать разные действия. Без проверки нельзя различить типы.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getClickCount()</code> — получение количества</li>
  <li>Различение одинарного и двойного клика</li>
  <li>Обработка разных типов кликов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Определение количества кликов необходимо для различения типов действий.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обработай клик: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getClickCount() == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Двойной клик!");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getClickCount()</code> для проверки</li>
  <li><strong>✅ Отлично:</strong> Проверять == 1 для одинарного, проверять == 2 для двойного, проверять == 3 для тройного</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать количество</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет определить количество кликов. При клике можно узнать, одинарный, двойной или тройной клик.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (389, 'ru', 'MouseListener-мастер: определи количество кликов',
        'Добавь MouseListener, проверь getClickCount() == 2, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (396, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 14: Получение владельца фокуса в FocusListener</h2>
<p class="intro">Владелец фокуса определяет активный компонент. Можно получить компонент с фокусом, обработать его, улучшить функциональность. Без получения нельзя определить активный компонент.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>KeyboardFocusManager</code> — менеджер фокуса</li>
  <li>Метод <code>getFocusOwner()</code> — получение владельца</li>
  <li>Определение компонента с фокусом</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Получение владельца фокуса необходимо для определения активного компонента.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи владельца: <code>Component owner = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getFocusOwner()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать KeyboardFocusManager, проверять на null, улучшать функциональность</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать null</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить компонент с фокусом. Можно обработать активный компонент.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (396, 'ru', 'FocusListener-мастер: получи владельца фокуса',
        'Получи владельца фокуса через KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (391, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Получение ограничения в SpringLayout</h2>
<p class="intro">Получение ограничения позволяет управлять позицией. Можно получить ограничение, изменить его, улучшить управление. Без получения нельзя изменить ограничение.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getConstraint()</code> — получение ограничения</li>
  <li>Получение ограничений компонента</li>
  <li>Управление ограничениями</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Получение ограничения необходимо для управления позицией компонента.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи ограничение: <code>SpringLayout.Constraints constraints = layout.getConstraints(component);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getConstraints()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для управления, изменять ограничения, улучшать управление</li>
  <li><strong>⚠️ Избегай:</strong> Изменять без необходимости</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить ограничения компонента. Можно изменить позицию, размер.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (391, 'ru', 'SpringLayout-мастер: получи ограничение', 'Получи ограничения компонента через getConstraints()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (392, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 10: Установка ограничения в SpringLayout</h2>
<p class="intro">Ограничение связывает компоненты. Можно установить расстояние между компонентами, улучшить компоновку. Без ограничения компоненты не будут связаны.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>putConstraint()</code> — установка ограничения</li>
  <li>Связывание компонентов</li>
  <li>Улучшение компоновки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Ограничение необходимо для связывания компонентов и улучшения компоновки.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи ограничение: <code>layout.putConstraint(SpringLayout.WEST, component2, 10, SpringLayout.EAST, component1);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>putConstraint()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать SpringLayout.WEST, EAST для сторон, использовать для связывания, улучшать компоновку</li>
  <li><strong>⚠️ Избегай:</strong> Создавать конфликтующие ограничения</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты будут связаны ограничением. Можно установить расстояние между компонентами.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (392, 'ru', 'SpringLayout-мастер: установи ограничение',
        'Установи ограничение через putConstraint(WEST, component2, 10, EAST, component1)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (394, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 12: Создание пружины в SpringLayout</h2>
<p class="intro">Пружина определяет упругость ограничения. Можно создать пружину с нужными параметрами, улучшить компоновку. Без пружины ограничение будет жёстким.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>Spring</code> — пружина</li>
  <li>Метод <code>Spring.constant()</code> — создание константной пружины</li>
  <li>Создание пружин для ограничений</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Пружина необходима для создания упругих ограничений.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай пружину: <code>Spring spring = Spring.constant(100);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>Spring.constant()</code> для создания</li>
  <li><strong>✅ Отлично:</strong> Использовать для ограничений, использовать для компоновки, улучшать расположение</li>
  <li><strong>⚠️ Избегай:</strong> Создавать слишком жёсткие пружины</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Пружина будет создана. Можно использовать для ограничений.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (394, 'ru', 'SpringLayout-мастер: создай пружину', 'Создай пружину 100 через Spring.constant(100)')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (395, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 13: Получение ограничения в SpringLayout</h2>
<p class="intro">Ограничение определяет позицию. Можно получить ограничение компонента, изменить его, улучшить функциональность. Без получения нельзя изменить ограничение.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getConstraint()</code> — получение ограничения</li>
  <li>Доступ к ограничениям компонента</li>
  <li>Улучшение функциональности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Получение ограничения необходимо для изменения позиции компонента.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи ограничение: <code>SpringLayout.Constraints constraints = layout.getConstraints(component);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getConstraints()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для доступа к ограничениям, использовать для изменения, улучшать функциональность</li>
  <li><strong>⚠️ Избегай:</strong> Изменять без необходимости</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить ограничение компонента. Можно изменить позицию.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (395, 'ru', 'SpringLayout-мастер: получи ограничение', 'Получи ограничение через getConstraints(component)')
ON CONFLICT (task_id, language_code) DO NOTHING;
