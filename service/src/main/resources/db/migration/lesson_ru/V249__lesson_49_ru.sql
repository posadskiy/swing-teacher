-- Flyway migration V56: Lesson 48
-- This migration contains lesson, tasks, and documentation for lesson 49

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (437, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Обработка выбора элементов с ItemListener</h2>
<p class="intro">ItemListener позволяет реагировать на выбор. Можно обработать выбор в чекбоксе, радиокнопке, комбобоксе, обновить другие компоненты. Без обработки выбор не будет иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>ItemListener</code> — слушатель выбора</li>
  <li>Метод <code>itemStateChanged(ItemEvent)</code> — обработка изменения</li>
  <li>Использование с JCheckBox, JRadioButton, JComboBox</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>ItemListener необходим для обработки выбора элементов и обновления других компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>checkBox.addItemListener(e -> {<br>
&nbsp;&nbsp;if (e.getStateChange() == ItemEvent.SELECTED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Выбрано!");<br>
&nbsp;&nbsp;} else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Снято!");<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addItemListener()</code> для обработки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getStateChange()</code> для проверки, использовать ItemEvent.SELECTED и DESELECTED, обновлять другие компоненты</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать состояние</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При изменении выбора будет срабатывать обработчик. Можно обработать выбор и обновить другие компоненты.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (437, 'ru', 'ItemListener-новичок: обрабатывай выбор элементов',
        'Создай чекбокс, добавь ItemListener, проверь getStateChange() == ItemEvent.SELECTED, выведи сообщение')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (438, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Обработка изменений с ChangeListener</h2>
<p class="intro">ChangeListener позволяет реагировать на изменения. Можно обработать изменение слайдера, спиннера, прогресс-бара, обновить другие компоненты. Без обработки изменения не будут иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Интерфейс <code>ChangeListener</code> — слушатель изменений</li>
  <li>Метод <code>stateChanged(ChangeEvent)</code> — обработка изменения</li>
  <li>Использование с JSlider, JSpinner, JProgressBar</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>ChangeListener необходим для обработки изменений значений и обновления других компонентов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>slider.addChangeListener(e -> {<br>
&nbsp;&nbsp;int value = slider.getValue();<br>
&nbsp;&nbsp;label.setText("Значение: " + value);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addChangeListener()</code> для обработки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getValue()</code> для получения значения, обновлять другие компоненты, выполнять действия при изменении</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать изменения</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При изменении значения будет срабатывать обработчик. Можно обработать изменение и обновить другие компоненты.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (438, 'ru', 'ChangeListener-новичок: обрабатывай изменения',
        'Создай слайдер, добавь ChangeListener, получи значение через getValue(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (439, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Обработка выбора в комбобоксе с ItemListener</h2>
<p class="intro">Обработка выбора позволяет реагировать на выбор элемента. Можно обновить другие компоненты, загрузить данные, выполнить действия. Без обработки выбор не будет иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Обработка выбора в JComboBox</li>
  <li>Получение выбранного элемента</li>
  <li>Реагирование на изменение выбора</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка выбора необходима для реагирования на выбор элемента в комбобоксе.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>comboBox.addItemListener(e -> {<br>
&nbsp;&nbsp;if (e.getStateChange() == ItemEvent.SELECTED) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;Object item = e.getItem();<br>
&nbsp;&nbsp;&nbsp;&nbsp;label.setText("Выбрано: " + item);<br>
&nbsp;&nbsp;}<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addItemListener()</code> для обработки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getItem()</code> для получения элемента, обновлять другие компоненты, загружать данные при выборе</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать выбор</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При выборе элемента будет срабатывать обработчик. Можно обработать выбор и обновить другие компоненты.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (439, 'ru', 'ItemListener-мастер: обрабатывай выбор в комбобоксе',
        'Создай комбобокс с элементами, добавь ItemListener, получи элемент через getItem(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (440, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Обработка изменений в спиннере с ChangeListener</h2>
<p class="intro">Обработка изменений позволяет реагировать на изменение значения. Можно обновить другие компоненты, выполнить валидацию, выполнить действия. Без обработки изменение не будет иметь эффекта.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Обработка изменений в JSpinner</li>
  <li>Получение значения спиннера</li>
  <li>Реагирование на изменение значения</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обработка изменений необходима для реагирования на изменение значения в спиннере.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Добавь слушатель: <code>spinner.addChangeListener(e -> {<br>
&nbsp;&nbsp;Object value = spinner.getValue();<br>
&nbsp;&nbsp;label.setText("Значение: " + value);<br>
});</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>addChangeListener()</code> для обработки</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>getValue()</code> для получения значения, обновлять другие компоненты, выполнять валидацию</li>
  <li><strong>⚠️ Избегай:</strong> Игнорировать изменения</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>При изменении значения будет срабатывать обработчик. Можно обработать изменение и обновить другие компоненты.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (440, 'ru', 'ChangeListener-мастер: обрабатывай изменения в спиннере',
        'Создай спиннер, добавь ChangeListener, получи значение через getValue(), выведи его')
ON CONFLICT (task_id, language_code) DO NOTHING;

