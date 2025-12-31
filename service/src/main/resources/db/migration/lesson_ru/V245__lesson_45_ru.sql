-- Flyway migration V3: Lesson 45
-- This migration contains lesson, tasks, and documentation for lesson 45

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (397, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Создание редактора HTML с JEditorPane</h2>
<p class="intro">JEditorPane позволяет отображать форматированный текст. HTML, RTF, простой текст — всё это можно показать в одном компоненте. Без него придётся использовать обычный JTextArea без форматирования.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>JEditorPane</code> — редактор форматированного текста</li>
  <li>Метод <code>setContentType()</code> — установка типа контента</li>
  <li>Отображение HTML и RTF</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>JEditorPane необходим для отображения форматированного текста.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай редактор: <code>JEditorPane editor = new JEditorPane();</code></li>
  <li>Установи тип контента: <code>editor.setContentType("text/html");</code></li>
  <li>Установи текст: <code>editor.setText("&lt;html&gt;&lt;h1&gt;Привет!&lt;/h1&gt;&lt;/html&gt;");</code></li>
  <li>Добавь на форму: <code>add(editor);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Устанавливать тип контента перед установкой текста</li>
  <li><strong>✅ Отлично:</strong> Использовать "text/html" для HTML, использовать "text/rtf" для RTF, использовать "text/plain" для простого текста</li>
  <li><strong>⚠️ Избегай:</strong> Не устанавливать тип — может не работать</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится редактор с форматированным текстом. HTML будет отображаться с форматированием. Можно редактировать текст прямо в редакторе.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (397, 'ru', 'JEditorPane-новичок: создай редактор HTML',
        'Создай JEditorPane, установи тип "text/html", установи HTML текст и добавь на форму')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (398, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Загрузка HTML из URL в JEditorPane</h2>
<p class="intro">Загрузка HTML из URL позволяет отображать веб-контент. Помощь, документация, новости — всё это можно загрузить из интернета. Без этого придётся хранить весь контент локально.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setPage()</code> — загрузка страницы из URL</li>
  <li>Класс <code>URL</code> — адрес ресурса</li>
  <li>Обработка ошибок загрузки</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Загрузка HTML из URL необходима для отображения веб-контента.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи тип контента: <code>editor.setContentType("text/html");</code></li>
  <li>Загрузи страницу: <code>try {<br>
&nbsp;&nbsp;editor.setPage(new URL("https://example.com"));<br>
} catch (IOException e) {<br>
&nbsp;&nbsp;label.setText("Ошибка загрузки: " + e.getMessage());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Обрабатывать IOException при загрузке</li>
  <li><strong>✅ Отлично:</strong> Показывать индикатор загрузки, использовать <code>setPage()</code> для загрузки</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать ошибки — пользователь не узнает о проблеме</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>HTML будет загружен из URL и отображён. Веб-страница появится в редакторе. Можно просматривать контент из интернета.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (398, 'ru', 'JEditorPane-мастер: загрузи HTML из URL',
        'Установи тип "text/html", загрузи страницу из URL через setPage(), обработай IOException')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (399, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Обработка гиперссылок в JEditorPane</h2>
<p class="intro">Обработка гиперссылок делает редактор интерактивным. Можно переходить по ссылкам, открывать новые страницы, выполнять действия. Без этого ссылки будут неактивными.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>HyperlinkListener</code> — обработка ссылок</li>
  <li>Обработка кликов по гиперссылкам</li>
  <li>Навигация по ссылкам</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка гиперссылок необходима для создания интерактивного редактора.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>editor.addHyperlinkListener(e -> {<br>
&nbsp;&nbsp;if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;try {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;editor.setPage(e.getURL());<br>
&nbsp;&nbsp;&nbsp;&nbsp;} catch (IOException ex) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ex.printStackTrace();<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять тип события ACTIVATED</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getURL()</code> для получения ссылки, загружать новую страницу через <code>setPage()</code>, обрабатывать IOException при загрузке</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать ошибки — пользователь не узнает о проблеме</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Гиперссылки станут кликабельными. При клике по ссылке загрузится новая страница. Можно навигировать по ссылкам.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (399, 'ru', 'JEditorPane-мастер: обрабатывай гиперссылки',
        'Добавь HyperlinkListener, проверь ACTIVATED, получи URL через getURL(), загрузи страницу через setPage()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (400, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Установка типа контента в JEditorPane</h2>
<p class="intro">Тип контента определяет формат. Можно отображать HTML, обычный текст, RTF. Без типа контент будет интерпретирован неправильно.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setContentType()</code> — установка типа</li>
  <li>Типы контента (text/html, text/plain)</li>
  <li>Создание форматированного контента</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Тип контента необходим для правильной интерпретации контента.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи тип: <code>editor.setContentType("text/html");</code></li>
  <li>Установи текст: <code>editor.setText("&lt;html&gt;&lt;b&gt;Текст&lt;/b&gt;&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setContentType()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать "text/html" для HTML, использовать "text/plain" для текста, использовать "text/rtf" для RTF</li>
  <li><strong>⚠️ Избегай:</strong> Неправильный тип — может быть ошибка</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Контент будет отформатирован согласно типу. HTML будет отображаться как HTML.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (400, 'ru', 'JEditorPane-мастер: установи тип контента',
        'Установи тип "text/html" через setContentType(), установи HTML-текст')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (401, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Обработка гиперссылок в JEditorPane</h2>
<p class="intro">Обработка гиперссылок делает контент интерактивным. Можно обработать клик по ссылке, открыть URL, выполнить действие. Без обработки ссылки не будут работать.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>HyperlinkListener</code> — обработчик ссылок</li>
  <li>Обработка кликов по ссылкам</li>
  <li>Создание интерактивного контента</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка гиперссылок необходима для создания интерактивного контента.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>editor.addHyperlinkListener(e -> {<br>
&nbsp;&nbsp;if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Ссылка: " + e.getURL());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addHyperlinkListener()</code> для обработки</li>
  <li><strong>✅ Отлично:</strong> Проверять EventType.ACTIVATED для клика, использовать <code>getURL()</code> для получения URL, открывать URL или выполнять действие</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать ссылки</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При клике по ссылке будет срабатывать обработчик. Можно обработать клик и открыть URL.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (401, 'ru', 'JEditorPane-мастер: обрабатывай гиперссылки',
        'Добавь HyperlinkListener, проверь EventType.ACTIVATED, получи URL через getURL()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (403, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Удаление слушателя в ActionListener</h2>
<p class="intro">Удаление слушателя позволяет управлять событиями. Можно временно отключить обработку, улучшить логику. Без удаления слушатель будет работать всегда.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>removeActionListener()</code> — удаление слушателя</li>
  <li>Динамическое управление слушателями</li>
  <li>Улучшение управления событиями</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Удаление слушателя необходимо для динамического управления событиями.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Сохрани слушатель: <code>JLabel label = new JLabel();<br>
ActionListener listener = e -> label.setText("Действие");<br>
add(label);</code></li>
  <li>Добавь слушатель: <code>button.addActionListener(listener);</code></li>
  <li>Удали слушатель: <code>button.removeActionListener(listener);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>removeActionListener()</code> для удаления</li>
  <li><strong>✅ Отлично:</strong> Сохранять ссылку на слушатель, использовать для динамического управления, улучшать логику</li>
  <li><strong>⚠️ Избегай:</strong> Удалять без сохранения ссылки</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Слушатель будет удалён. Обработка событий прекратится.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (403, 'ru', 'ActionListener-мастер: удали слушатель',
        'Создай ActionListener, добавь через addActionListener(), удали через removeActionListener()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (402, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Установка текста в JEditorPane</h2>
<p class="intro">Текст создаёт контент. Можно установить HTML или простой текст, создать информативный контент. Без текста компонент будет пустым.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setText()</code> — установка текста</li>
  <li>Создание текстового контента</li>
  <li>Улучшение отображения</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Установка текста необходима для создания контента в компоненте.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи текст: <code>editor.setText("&lt;html&gt;&lt;h1&gt;Заголовок&lt;/h1&gt;&lt;/html&gt;");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setText()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать HTML для форматирования, использовать простой текст, адаптировать под тип контента</li>
  <li><strong>⚠️ Избегай:</strong> HTML без правильного формата</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В компоненте появится текст. Текст будет отформатирован согласно типу контента.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (402, 'ru', 'JEditorPane-мастер: установи текст', 'Установи HTML-текст через setText()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (404, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Добавление нескольких слушателей в ActionListener</h2>
<p class="intro">Множественные слушатели позволяют обрабатывать событие несколькими способами. Можно добавить несколько обработчиков, улучшить функциональность. Без множественных слушателей только один обработчик.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Множественные слушатели</li>
  <li>Добавление нескольких обработчиков</li>
  <li>Улучшение функциональности</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Множественные слушатели необходимы для обработки события несколькими способами.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь первый слушатель: <code>JLabel label = new JLabel();<br>
button.addActionListener(e -> label.setText("Первый"));<br>
add(label);</code></li>
  <li>Добавь второй слушатель: <code>button.addActionListener(e -> label.setText("Второй"));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addActionListener()</code> несколько раз</li>
  <li><strong>✅ Отлично:</strong> Использовать для множественной обработки, улучшать функциональность, разделять логику</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много слушателей</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При действии будут срабатывать все слушатели. Можно обработать событие несколькими способами.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (404, 'ru', 'ActionListener-мастер: добавь несколько слушателей',
        'Добавь два ActionListener через addActionListener(), каждый выводит свой текст')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (405, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Получение команды действия в ActionListener</h2>
<p class="intro">Команда действия позволяет идентифицировать источник. Можно определить, какой компонент вызвал событие, без проверки источника. Без команды придётся проверять источник.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>getActionCommand()</code> — получение команды</li>
  <li>Идентификация источника события</li>
  <li>Улучшение обработки событий</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Команда действия необходима для идентификации источника события.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Получи команду: <code>button.addActionListener(e -> {<br>
&nbsp;&nbsp;String cmd = e.getActionCommand();<br>
&nbsp;&nbsp;label.setText("Команда: " + cmd);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>getActionCommand()</code> для получения</li>
  <li><strong>✅ Отлично:</strong> Использовать для идентификации, использовать понятные команды, улучшать обработку</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать команду</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет получить команду действия. Можно идентифицировать источник.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (405, 'ru', 'ActionListener-мастер: получи команду действия',
        'Добавь ActionListener, получи команду через getActionCommand() в actionPerformed()')
ON CONFLICT (task_id, language_code) DO NOTHING;
