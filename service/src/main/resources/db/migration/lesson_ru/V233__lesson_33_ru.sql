-- Flyway migration V3: Lesson 33
-- This migration contains lesson, tasks, and documentation for lesson 33

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (278, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Создание расширенного редактора</h2>
<p class="intro">JTextPane позволяет применять стили к тексту. Жирный, курсив, цвет, размер шрифта — всё это можно применить к разным частям текста. Без него нельзя создать богатый текстовый редактор.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>JTextPane</code> — расширенный редактор</li>
  <li>Класс <code>StyledDocument</code> — документ со стилями</li>
  <li>Применение стилей к тексту</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>JTextPane необходим для создания текстовых редакторов с поддержкой форматирования.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай редактор: <code>JTextPane textPane = new JTextPane();</code></li>
  <li>Получи документ: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
  <li>Создай стиль и примени: <code>Style style = textPane.addStyle("bold", null);</code>, <code>StyleConstants.setBold(style, true);</code>, <code>doc.insertString(0, "Жирный текст", style);</code></li>
  <li>Добавь на форму: <code>add(textPane);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> StyleConstants для установки свойств стиля</li>
  <li><strong>✅ Отлично:</strong> Применять стили к выделенному тексту, комбинировать несколько стилей</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много стилей — сложно управлять</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится редактор с поддержкой стилей. Можно применять жирный, курсив, цвет к тексту.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (278, 'ru', 'JTextPane-новичок: создай расширенный редактор',
        'Создай JTextPane, создай стиль "bold", установи жирный шрифт, вставь текст со стилем и добавь на форму')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (279, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Выделение и стилизация текста</h2>
<p class="intro">Применение стилей к выделенному тексту делает редактор функциональным. Можно выделить текст и сделать его жирным, курсивом, изменить цвет. Без этого придётся применять стили ко всему тексту.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setCharacterAttributes()</code> — применение стилей</li>
  <li>Получение выделенного текста</li>
  <li>Применение стилей к выделению</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Применение стилей к выделенному тексту необходимо для создания функциональных текстовых редакторов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи выделение: <code>int start = textPane.getSelectionStart();</code> и <code>int end = textPane.getSelectionEnd();</code></li>
  <li>Создай стиль: <code>Style style = textPane.addStyle("bold", null);</code> и <code>StyleConstants.setBold(style, true);</code></li>
  <li>Примени стиль: <code>StyledDocument doc = textPane.getStyledDocument();</code> и <code>doc.setCharacterAttributes(start, end - start, style, false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять наличие выделения перед применением</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>setCharacterAttributes()</code> для применения стилей, комбинировать несколько стилей</li>
  <li><strong>⚠️ Избегай:</strong> Применять стили без проверки выделения — может быть ошибка</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Выделенный текст будет стилизован. Можно выделить текст и применить к нему жирный, курсив, цвет.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (279, 'ru', 'JTextPane-мастер: выделяй и стилизуй текст',
        'Получи начало и конец выделения, создай стиль "bold", примени стиль к выделенному тексту')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (280, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Настройка шрифта</h2>
<p class="intro">Настройка шрифта делает текст читаемым. Можно установить размер, стиль, семейство шрифта. Без настройки будет стандартный шрифт.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setFont()</code> — установка шрифта</li>
  <li>Настройка шрифта через стили</li>
  <li>Создание форматированного текста</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Настройка шрифта необходима для улучшения читаемости и визуального представления текста.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи шрифт: <code>textPane.setFont(new Font("Arial", Font.BOLD, 14));</code></li>
  <li>Или через стиль: <code>Style style = textPane.addStyle("bold", null);</code>, <code>StyleConstants.setFontFamily(style, "Arial");</code>, <code>StyleConstants.setFontSize(style, 14);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setFont()</code> для всего текста</li>
  <li><strong>✅ Отлично:</strong> Использовать стили для частей текста, комбинировать разные шрифты, использовать StyleConstants для настройки</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много разных шрифтов — может быть неаккуратно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Текст будет отображаться с указанным шрифтом. Можно установить размер, стиль, семейство.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (280, 'ru', 'JTextPane-мастер: настрой шрифт', 'Установи шрифт через setFont() с Arial, BOLD, размер 14')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (281, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Вставка строки</h2>
<p class="intro">Вставка строки позволяет добавлять текст. Можно вставить текст в нужную позицию, с форматированием. Без вставки придётся заменять весь текст.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>insertString()</code> — вставка строки</li>
  <li>Вставка текста в позицию</li>
  <li>Создание форматированного текста</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Вставка строки необходима для программного добавления текста в нужную позицию.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи документ: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
  <li>Вставь строку: <code>doc.insertString(0, "Текст", null);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>insertString()</code> для вставки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getStyledDocument()</code> для получения, использовать стили для форматирования, использовать позицию для точной вставки</li>
  <li><strong>⚠️ Избегай:</strong> Вставлять за пределами — может быть ошибка</li>
</ul>
<p><strong>Важно:</strong> Проверять позицию перед вставкой. Обрабатывать BadLocationException.</p>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Текст будет вставлен в указанную позицию. Можно вставить текст с форматированием.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (281, 'ru', 'JTextPane-мастер: вставь строку',
        'Получи документ через getStyledDocument(), вставь строку в позицию 0 через insertString()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (282, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Применение стиля</h2>
<p class="intro">Стиль создаёт форматирование. Можно применить жирный, курсив, цвет, размер к тексту. Без стиля текст будет простым.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>Style</code> — стиль текста</li>
  <li>Метод <code>setCharacterAttributes()</code> — применение стиля</li>
  <li>Создание форматированного текста</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Стили необходимы для создания форматированного текста с различными визуальными эффектами.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи документ: <code>StyledDocument doc = textPane.getStyledDocument();</code></li>
  <li>Создай стиль: <code>Style style = doc.addStyle("bold", null);</code> и <code>StyleConstants.setBold(style, true);</code></li>
  <li>Примени стиль: <code>doc.setCharacterAttributes(0, 5, style, false);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addStyle()</code> для создания</li>
  <li><strong>✅ Отлично:</strong> Использовать StyleConstants для настройки, использовать <code>setCharacterAttributes()</code> для применения, комбинировать разные стили</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много стилей — может быть сложно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Текст будет отформатирован стилем. Можно применить жирный, курсив, цвет.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (282, 'ru', 'JTextPane-мастер: примени стиль',
        'Получи документ, создай стиль через addStyle(), установи жирный через StyleConstants.setBold(), примени через setCharacterAttributes()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (283, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Получение текста</h2>
<p class="intro">Получение текста позволяет работать с содержимым. Можно извлечь текст, обработать его, сохранить. Без получения нельзя работать с содержимым.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getText()</code> — получение текста</li>
  <li>Извлечение текстового контента</li>
  <li>Работа с содержимым</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Получение текста необходимо для работы с содержимым редактора (обработка, сохранение).</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи текст: <code>String text = textPane.getText();</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getText()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для обработки, использовать для сохранения, обрабатывать полученный текст</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать полученный текст</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить текст. Можно извлечь и обработать содержимое.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (283, 'ru', 'JTextPane-мастер: получи текст', 'Получи текст через getText(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (284, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Определение кнопки мыши</h2>
<p class="intro">Определение кнопки улучшает функциональность. Можно обработать левую, правую, среднюю кнопки по-разному, улучшить интерактивность. Без определения все кнопки одинаковы.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getButton()</code> — получение кнопки</li>
  <li>Константы <code>MouseEvent.BUTTON1</code>, <code>BUTTON2</code>, <code>BUTTON3</code></li>
  <li>Обработка разных кнопок мыши</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Определение кнопки необходимо для создания интерактивных интерфейсов с разной реакцией на разные кнопки мыши.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Определи кнопку: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (e.getButton() == MouseEvent.BUTTON1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Левая кнопка");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getButton()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать BUTTON1, BUTTON2, BUTTON3, обрабатывать разные кнопки, улучшать интерактивность</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать кнопки</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет определить, какая кнопка нажата. Можно обработать левую, правую, среднюю кнопки по-разному.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (284, 'ru', 'MouseListener-мастер: определи кнопку мыши',
        'Добавь MouseListener, проверь getButton() == BUTTON1, выведи "Левая кнопка"')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (285, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Получение координат мыши</h2>
<p class="intro">Координаты мыши важны для позиционирования. Можно получить позицию клика, обработать по координатам, улучшить функциональность. Без координат нельзя определить позицию.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getX()</code> — получение X координаты</li>
  <li>Метод <code>getY()</code> — получение Y координаты</li>
  <li>Получение позиции мыши</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Координаты мыши необходимы для позиционирования элементов и обработки событий по позиции.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи координаты: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int x = e.getX();<br>
&nbsp;&nbsp;&nbsp;&nbsp;int y = e.getY();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Координаты: " + x + ", " + y);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getX()</code> для X координаты</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getY()</code> для Y координаты, использовать для позиционирования, улучшать функциональность</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать координаты</li>
</ul>
<p><strong>Важно:</strong> Учитывать относительные координаты.</p>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить координаты клика. Можно обработать по позиции.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (285, 'ru', 'MouseListener-мастер: получи координаты мыши',
        'Добавь MouseListener, переопредели mouseClicked(), получи X и Y через getX(), getY(), выведи')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (286, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Получение количества кликов</h2>
<p class="intro">Количество кликов важно для обработки. Можно обработать одиночный, двойной клик, улучшить функциональность. Без получения нельзя различить клики.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getClickCount()</code> — получение количества кликов</li>
  <li>Обработка одиночных и двойных кликов</li>
  <li>Улучшение функциональности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Получение количества кликов необходимо для различения одиночных и двойных кликов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи количество: <code>component.addMouseListener(new MouseAdapter() {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;public void mouseClicked(MouseEvent e) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;int count = e.getClickCount();<br>
&nbsp;&nbsp;&nbsp;&nbsp;if (count == 2) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Двойной клик");<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getClickCount()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для обработки двойных кликов, использовать для улучшения функциональности, улучшать пользовательский опыт</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать количество</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить количество кликов. Можно обработать двойной клик.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (286, 'ru', 'MouseListener-мастер: получи количество кликов',
        'Добавь MouseListener, переопредели mouseClicked(), получи количество через getClickCount(), проверь на 2')
ON CONFLICT (task_id, language_code) DO NOTHING;
