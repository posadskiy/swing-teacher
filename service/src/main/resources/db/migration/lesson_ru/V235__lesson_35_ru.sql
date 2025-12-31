-- Flyway migration V3: Lesson 36
-- This migration contains lesson, tasks, and documentation for lesson 36

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (291, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Открытие диалога выбора файла</h2>
<p class="intro">JFileChooser — стандартный способ работы с файлами. Открыть документ, сохранить проект, выбрать изображение — всё это требует выбора файла. Без него пользователь не сможет работать с файлами.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>JFileChooser</code> — диалог выбора файлов</li>
  <li>Создание диалога открытия/сохранения файла</li>
  <li>Получение выбранного файла</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>JFileChooser необходим для стандартной работы с файлами в приложении.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай диалог выбора файла: <code>JFileChooser fileChooser = new JFileChooser();</code></li>
  <li>Покажи диалог открытия: <code>int result = fileChooser.showOpenDialog(frame);</code></li>
  <li>Обработай результат: <code>if (result == JFileChooser.APPROVE_OPTION) {<br>
&nbsp;&nbsp;File selectedFile = fileChooser.getSelectedFile();<br>
&nbsp;&nbsp;label.setText("Выбран: " + selectedFile.getName());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять результат перед использованием файла</li>
  <li><strong>✅ Отлично:</strong> Установить начальную директорию, добавить фильтр файлов</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать результат — может быть null</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог выбора файла. Это стандартное окно проводника файлов. Можно выбрать файл и нажать "Открыть" или "Сохранить". После выбора получишь объект File.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (291, 'ru', 'Выбор файла-новичок: открой диалог выбора файла',
        'Создай JFileChooser, покажи диалог открытия и обработай результат')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (292, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Создание диалога сохранения</h2>
<p class="intro">Диалог сохранения позволяет выбрать место для файла. Сохранение документа, экспорт данных, создание резервной копии — всё это требует выбора места сохранения. Без него файл сохранится в непредсказуемое место.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>showSaveDialog()</code> — диалог сохранения</li>
  <li>Обработка результата сохранения</li>
  <li>Получение выбранного файла для сохранения</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Диалог сохранения необходим для выбора места и имени файла при сохранении.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Покажи диалог сохранения: <code>int result = fileChooser.showSaveDialog(frame);</code></li>
  <li>Обработай результат: <code>if (result == JFileChooser.APPROVE_OPTION) {<br>
&nbsp;&nbsp;File file = fileChooser.getSelectedFile();<br>
&nbsp;&nbsp;label.setText("Сохранить в: " + file.getPath());<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Проверять результат перед сохранением</li>
  <li><strong>✅ Отлично:</strong> Устанавливать предложенное имя файла, проверять существование файла перед перезаписью</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать результат — файл не сохранится</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Появится диалог сохранения файла. Можно выбрать место и имя файла. После выбора получишь объект File для сохранения.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (292, 'ru', 'Выбор файла-мастер: создай диалог сохранения',
        'Покажи диалог сохранения, обработай результат и получи выбранный файл')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (293, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Добавление фильтра файлов</h2>
<p class="intro">Фильтры файлов упрощают выбор. Можно показывать только изображения, только документы, только текстовые файлы. Без фильтров пользователю придётся искать нужный тип файла среди всех.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>FileNameExtensionFilter</code> — фильтр по расширению</li>
  <li>Метод <code>setFileFilter()</code> — установка фильтра</li>
  <li>Создание фильтров файлов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Фильтры файлов необходимы для упрощения выбора нужных типов файлов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай фильтр: <code>FileNameExtensionFilter filter = new FileNameExtensionFilter(<br>
&nbsp;&nbsp;"Текстовые файлы",<br>
&nbsp;&nbsp;"txt", "text"<br>
);</code></li>
  <li>Установи фильтр: <code>fileChooser.setFileFilter(filter);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> FileNameExtensionFilter для расширений</li>
  <li><strong>✅ Отлично:</strong> Добавлять несколько расширений в один фильтр, добавлять несколько фильтров через <code>addChoosableFileFilter()</code>, использовать <code>setAcceptAllFileFilterUsed(false)</code> для скрытия "Все файлы"</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много фильтров — может быть сложно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В диалоге будут показываться только файлы с нужными расширениями. Можно выбрать тип файлов из выпадающего списка.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (293, 'ru', 'Выбор файла-мастер: добавь фильтр файлов',
        'Создай FileNameExtensionFilter для "txt" и "text", установи фильтр в fileChooser')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (294, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Разрешение множественного выбора файлов</h2>
<p class="intro">Множественный выбор ускоряет работу. Можно выбрать несколько файлов за раз, не открывая диалог несколько раз. Без этого придётся выбирать файлы по одному.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setMultiSelectionEnabled()</code> — разрешение множественного выбора</li>
  <li>Получение нескольких выбранных файлов</li>
  <li>Обработка множественного выбора</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Множественный выбор необходим для ускорения работы с несколькими файлами одновременно.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Разреши множественный выбор: <code>fileChooser.setMultiSelectionEnabled(true);</code></li>
  <li>Обработай результат: <code>if (result == JFileChooser.APPROVE_OPTION) {<br>
&nbsp;&nbsp;File[] files = fileChooser.getSelectedFiles();<br>
&nbsp;&nbsp;for (File file : files) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Выбран: " + file.getName());<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setMultiSelectionEnabled(true)</code></li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getSelectedFiles()</code> для получения массива, обрабатывать все выбранные файлы</li>
  <li><strong>⚠️ Избегай:</strong> Множественный выбор там, где нужен одиночный</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Можно будет выбрать несколько файлов. При множественном выборе можно выбрать несколько файлов одновременно.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (294, 'ru', 'Выбор файла-мастер: разреши множественный выбор',
        'Разреши множественный выбор через setMultiSelectionEnabled(true), получи файлы через getSelectedFiles()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (295, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Добавление фильтра файлов (расширенный)</h2>
<p class="intro">Фильтр ограничивает выбор. Можно показывать только нужные типы файлов, упростить выбор. Без фильтра будут видны все файлы.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>FileFilter</code> — фильтр файлов</li>
  <li>Метод <code>addChoosableFileFilter()</code> — добавление фильтра</li>
  <li>Ограничение выбора файлов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Фильтры необходимы для ограничения выбора нужных типов файлов и упрощения навигации.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай фильтр: <code>FileFilter filter = new FileNameExtensionFilter("Текстовые файлы", "txt");</code></li>
  <li>Добавь фильтр: <code>fileChooser.addChoosableFileFilter(filter);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> FileNameExtensionFilter для расширений</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>addChoosableFileFilter()</code> для добавления, использовать <code>setFileFilter()</code> для установки по умолчанию, создавать кастомные фильтры</li>
  <li><strong>⚠️ Избегай:</strong> Слишком много фильтров — может быть перегружено</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>В диалоге появится фильтр. Можно выбрать тип файлов. Будут видны только нужные файлы.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (295, 'ru', 'Выбор файла-мастер: добавь фильтр',
        'Создай FileNameExtensionFilter для "txt", добавь через addChoosableFileFilter()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (296, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Установка текущей директории</h2>
<p class="intro">Текущая директория определяет начальную папку. Можно открыть диалог в нужной папке, улучшить навигацию. Без настройки будет стандартная папка.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setCurrentDirectory()</code> — установка директории</li>
  <li>Класс <code>File</code> — файл/директория</li>
  <li>Улучшение пользовательского опыта</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Установка текущей директории необходима для улучшения навигации и пользовательского опыта.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай директорию: <code>File dir = new File("/path/to/directory");</code></li>
  <li>Установи директорию: <code>fileChooser.setCurrentDirectory(dir);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setCurrentDirectory()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать File для директории, использовать для улучшения навигации, адаптировать под контекст</li>
  <li><strong>⚠️ Избегай:</strong> Устанавливать несуществующую директорию</li>
</ul>
<p><strong>Важно:</strong> Проверять существование директории.</p>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Диалог откроется в указанной директории. Можно начать навигацию с нужной папки.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (296, 'ru', 'Выбор файла-мастер: установи текущую директорию',
        'Создай File для директории, установи через setCurrentDirectory()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (297, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Установка заголовка диалога</h2>
<p class="intro">Заголовок делает диалог информативным. Можно указать назначение диалога, улучшить понимание. Без заголовка диалог будет без названия.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setDialogTitle()</code> — установка заголовка</li>
  <li>Создание информативного диалога</li>
  <li>Улучшение пользовательского опыта</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Заголовок необходим для информативности диалога и улучшения пользовательского опыта.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи заголовок: <code>fileChooser.setDialogTitle("Выбери файл");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setDialogTitle()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать понятные заголовки, использовать для информативности, адаптировать под контекст</li>
  <li><strong>⚠️ Избегай:</strong> Слишком длинных заголовков</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>У диалога появится заголовок. Заголовок будет виден в заголовке окна.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (297, 'ru', 'Выбор файла-мастер: установи заголовок диалога',
        'Установи заголовок "Выбери файл" через setDialogTitle()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (298, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 8: Добавление слушателя ссылок</h2>
<p class="intro">Слушатель ссылок позволяет обрабатывать клики. Можно открыть ссылку, выполнить действие, улучшить функциональность. Без слушателя ссылки не будут работать.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>HyperlinkListener</code> — слушатель ссылок</li>
  <li>Метод <code>addHyperlinkListener()</code> — добавление слушателя</li>
  <li>Обработка кликов по ссылкам</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Слушатель ссылок необходим для обработки кликов по ссылкам в JEditorPane.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>editorPane.addHyperlinkListener(e -> {<br>
&nbsp;&nbsp;if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Ссылка: " + e.getURL());<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addHyperlinkListener()</code> для добавления</li>
  <li><strong>✅ Отлично:</strong> Проверять EventType.ACTIVATED, использовать <code>getURL()</code> для получения URL, обрабатывать клики</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать события</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При клике на ссылку будет срабатывать обработчик. Можно обработать ссылку, открыть URL.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (298, 'ru', 'Редактор-мастер: добавь слушатель ссылок',
        'Добавь HyperlinkListener, проверь EventType.ACTIVATED, выведи URL через getURL()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (299, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 9: Установка типа контента</h2>
<p class="intro">Тип контента определяет формат. Можно установить HTML, RTF, plain text, улучшить отображение. Без типа контент будет plain text.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setContentType()</code> — установка типа контента</li>
  <li>Типы: text/html, text/plain, text/rtf</li>
  <li>Управление форматом контента</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Тип контента необходим для правильного отображения форматированного контента в JEditorPane.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи тип: <code>editorPane.setContentType("text/html");</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setContentType()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать "text/html" для HTML, использовать "text/plain" для текста, использовать "text/rtf" для RTF</li>
  <li><strong>⚠️ Избегай:</strong> Использовать неподдерживаемый тип</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Контент будет отображаться в указанном формате. Можно использовать HTML, RTF.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (299, 'ru', 'Редактор-мастер: установи тип контента', 'Установи тип контента "text/html" через setContentType()')
ON CONFLICT (task_id, language_code) DO NOTHING;
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (300, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 10: Создание редактора только для чтения</h2>
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
  <li>Отключи редактирование: <code>editorPane.setEditable(false);</code></li>
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
<p>Редактор будет только для чтения. Нельзя будет изменить контент.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (300, 'ru', 'Редактор-мастер: сделай только для чтения', 'Отключи редактирование через setEditable(false)')
ON CONFLICT (task_id, language_code) DO NOTHING;
