-- Flyway migration V3: Lesson 48
-- This migration contains lesson, tasks, and documentation for lesson 48

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (429, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Отслеживание фокуса компонента с FocusListener</h2>
<p class="intro">FocusListener позволяет реагировать на фокус. Валидация ввода, подсказки, визуальная обратная связь — всё это требует обработки фокуса. Без него нельзя отследить, какой компонент активен.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>FocusListener</code> — обработка фокуса</li>
  <li>Методы <code>focusGained()</code> и <code>focusLost()</code></li>
  <li>Обработка изменения фокуса</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>FocusListener необходим для отслеживания активного компонента и обработки фокуса.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай слушатель: <code>FocusListener listener = new FocusListener() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void focusGained(FocusEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Компонент получил фокус!");<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void focusLost(FocusEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Компонент потерял фокус!");<br>
&nbsp;&nbsp;}<br>
};</code></li>
  <li>Добавь слушатель: <code>textField.addFocusListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Валидировать данные при потере фокуса</li>
  <li><strong>✅ Отлично:</strong> Показывать подсказки при получении фокуса, менять визуальный стиль при фокусе</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много обработчиков — может быть медленно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При клике на компонент он получит фокус. При клике на другой компонент первый потеряет фокус. Можно отслеживать все изменения фокуса.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (429, 'ru', 'FocusListener-новичок: отслеживай фокус компонента',
        'Создай FocusListener, обработай получение и потерю фокуса, добавь к текстовому полю')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (430, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Валидация при потере фокуса с FocusListener</h2>
<p class="intro">Валидация при потере фокуса улучшает пользовательский опыт. Можно проверить email, число, дату сразу после ввода. Без этого ошибки будут обнаружены только при отправке формы.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Валидация данных в <code>focusLost()</code></li>
  <li>Проверка корректности ввода</li>
  <li>Отображение ошибок валидации</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Валидация при потере фокуса необходима для улучшения пользовательского опыта.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>В focusLost получи текст: <code>String text = textField.getText();</code></li>
  <li>Проверь корректность: <code>if (text.isEmpty()) {<br>
&nbsp;&nbsp;textField.setBackground(Color.RED);<br>
&nbsp;&nbsp;label.setText("Поле не может быть пустым!");<br>
} else {<br>
&nbsp;&nbsp;textField.setBackground(Color.WHITE);<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Валидировать в <code>focusLost()</code></li>
  <li><strong>✅ Отлично:</strong> Показывать визуальную обратную связь (цвет фона), показывать сообщение об ошибке, восстанавливать фокус при ошибке: <code>requestFocus()</code></li>
  <li><strong>⚠️ Избегай:</strong> Валидировать в focusGained — слишком рано</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При потере фокуса будет выполняться валидация. Если данные некорректны, поле подсветится красным. Можно вернуть фокус для исправления.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (430, 'ru', 'FocusListener-мастер: валидируй при потере фокуса',
        'В focusLost получи текст поля, проверь на пустоту, установи красный фон при ошибке')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (432, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Навигация по картам в CardLayout</h2>
<p class="intro">Навигация позволяет переключаться между картами. Можно показать нужную карту, перейти к следующей или предыдущей. Без навигации будет видна только первая карта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>show()</code> — показ карты по имени</li>
  <li>Метод <code>next()</code> — следующая карта</li>
  <li>Метод <code>previous()</code> — предыдущая карта</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Навигация необходима для переключения между картами в CardLayout.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи менеджер: <code>CardLayout layout = (CardLayout) panel.getLayout();</code></li>
  <li>Покажи карту: <code>layout.show(panel, "card1");</code></li>
  <li>Или переключись: <code>layout.next(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>show()</code> для показа по имени</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>next()</code> для следующей карты, использовать <code>previous()</code> для предыдущей, использовать <code>first()</code> и <code>last()</code> для крайних</li>
  <li><strong>⚠️ Избегай:</strong> Переключаться без проверки — может быть неожиданно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Карты будут переключаться. При вызове метода покажется нужная карта. Можно навигировать между картами.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (432, 'ru', 'CardLayout-мастер: навигируй по картам',
        'Получи CardLayout, покажи карту "card1" через show(), затем переключись на следующую через next()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (431, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Управление навигацией фокуса с FocusListener</h2>
<p class="intro">Управление навигацией фокуса делает интерфейс удобным. Можно настроить порядок перехода между полями, скрыть ненужные компоненты из навигации. Без этого фокус будет переходить в непредсказуемом порядке.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setFocusable()</code> — разрешение фокуса</li>
  <li>Метод <code>setFocusTraversalKeysEnabled()</code> — управление навигацией</li>
  <li>Настройка порядка фокуса</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Управление навигацией фокуса необходимо для создания удобного интерфейса.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Разреши фокус: <code>component.setFocusable(true);</code></li>
  <li>Настрой навигацию: <code>component.setFocusTraversalKeysEnabled(true);</code></li>
  <li>Запроси фокус: <code>component.requestFocus();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setFocusable()</code> для управления фокусом</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>setFocusTraversalKeysEnabled()</code> для навигации, использовать <code>requestFocus()</code> для программного фокуса, настраивать порядок через FocusTraversalPolicy</li>
  <li><strong>⚠️ Избегай:</strong> Делать все компоненты не фокусируемыми — потеря функциональности</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Фокус будет переходить в нужном порядке. Можно управлять, какие компоненты получают фокус.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (431, 'ru', 'FocusListener-мастер: управляй навигацией фокуса',
        'Установи setFocusable(true), установи setFocusTraversalKeysEnabled(true), запроси фокус через requestFocus()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (433, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Переключение на первую и последнюю карту в CardLayout</h2>
<p class="intro">Переключение к крайним картам ускоряет навигацию. Можно быстро перейти к первой или последней карте. Без этого придётся переключаться по одной.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>first()</code> — первая карта</li>
  <li>Метод <code>last()</code> — последняя карта</li>
  <li>Навигация к крайним картам</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Переключение к крайним картам необходимо для быстрой навигации.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи менеджер: <code>CardLayout layout = (CardLayout) panel.getLayout();</code></li>
  <li>Переключись на первую: <code>layout.first(panel);</code></li>
  <li>Или на последнюю: <code>layout.last(panel);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>first()</code> для первой карты</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>last()</code> для последней, использовать для быстрой навигации, комбинировать с <code>next()</code> и <code>previous()</code></li>
  <li><strong>⚠️ Избегай:</strong> Переключаться без проверки</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Карта переключится на первую или последнюю. Можно быстро перейти к крайним картам.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (433, 'ru', 'CardLayout-мастер: переключись на первую и последнюю',
        'Получи CardLayout, переключись на первую через first(), затем на последнюю через last()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (434, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Получение количества карт в CardLayout</h2>
<p class="intro">Количество карт позволяет управлять навигацией. Можно узнать, сколько карт есть, создать цикличную навигацию. Без подсчёта нельзя управлять навигацией.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getComponentCount()</code> — количество компонентов</li>
  <li>Подсчёт карт в контейнере</li>
  <li>Улучшение навигации</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Количество карт необходимо для управления навигацией.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи количество: <code>int count = panel.getComponentCount();</code></li>
  <li>Используй количество: <code>JLabel label = new JLabel("Карт: " + count);<br>
add(label);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getComponentCount()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для навигации, использовать для цикличной навигации, проверять перед навигацией</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать количество</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить количество карт. Можно использовать для навигации.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (434, 'ru', 'CardLayout-мастер: получи количество карт',
        'Получи количество компонентов через getComponentCount(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (435, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Показ карты по имени в CardLayout</h2>
<p class="intro">Показ по имени упрощает навигацию. Можно переключиться на карту по имени, не зная её позиции. Без имени придётся знать позицию.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>show()</code> — показ карты по имени</li>
  <li>Навигация по имени карты</li>
  <li>Улучшение управления картами</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Показ по имени необходим для упрощения навигации.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи менеджер: <code>CardLayout layout = (CardLayout) panel.getLayout();</code></li>
  <li>Покажи карту: <code>layout.show(panel, "cardName");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>show()</code> для показа</li>
  <li><strong>✅ Отлично:</strong> Использовать понятные имена, использовать для навигации, комбинировать с другими методами</li>
  <li><strong>⚠️ Избегай:</strong> Использовать несуществующие имена</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Карта переключится по имени. Можно переключиться на нужную карту.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (435, 'ru', 'CardLayout-мастер: покажи карту по имени',
        'Получи CardLayout, покажи карту "cardName" через show()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (436, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Установка ориентации компонента в FlowLayout</h2>
<p class="intro">Ориентация компонента важна для RTL языков. Можно изменить направление для арабского, иврита, улучшить поддержку. Без ориентации layout будет только LTR.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setComponentOrientation()</code> — установка ориентации</li>
  <li>Поддержка RTL языков</li>
  <li>Улучшение интернационализации</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Ориентация компонента необходима для поддержки RTL языков.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи ориентацию: <code>flowLayout.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setComponentOrientation()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать RIGHT_TO_LEFT для RTL, использовать LEFT_TO_RIGHT для LTR, улучшать интернационализацию</li>
  <li><strong>⚠️ Избегай:</strong> Использовать неправильную ориентацию</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компоненты будут располагаться в указанной ориентации. Можно поддержать RTL языки.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (436, 'ru', 'FlowLayout-мастер: установи ориентацию компонента',
        'Установи ориентацию RIGHT_TO_LEFT через setComponentOrientation()')
ON CONFLICT (task_id, language_code) DO NOTHING;
