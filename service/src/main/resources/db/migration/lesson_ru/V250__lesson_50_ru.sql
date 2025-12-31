-- Flyway migration V57: Lesson 49
-- This migration contains lesson, tasks, and documentation for lesson 50

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (441, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 1: Переопределение paintComponent для кастомной отрисовки</h2>
<p class="intro">Кастомная отрисовка позволяет создавать уникальную графику. Графики, диаграммы, игры, анимации — всё это требует кастомной отрисовки. Без неё можно использовать только стандартные компоненты.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>paintComponent(Graphics)</code> — кастомная отрисовка</li>
  <li>Переопределение метода в JComponent</li>
  <li>Создание кастомной графики</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Кастомная отрисовка необходима для создания уникальной графики.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай класс, расширяющий JComponent: <code>class MyComponent extends JComponent {<br>
&nbsp;&nbsp;@Override<br>
&nbsp;&nbsp;protected void paintComponent(Graphics g) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;super.paintComponent(g);<br>
&nbsp;&nbsp;&nbsp;&nbsp;g.drawString("Привет!", 10, 20);<br>
&nbsp;&nbsp;}<br>
}</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Всегда вызывать <code>super.paintComponent(g)</code></li>
  <li><strong>✅ Отлично:</strong> Использовать Graphics2D для улучшенной графики, использовать для кастомной графики, использовать для анимаций</li>
  <li><strong>⚠️ Избегай:</strong> Не вызывать super.paintComponent() — может быть проблема с фоном</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компонент будет отрисовываться кастомно. Можно создать уникальную графику.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (441, 'ru', 'Кастомная отрисовка-новичок: переопредели paintComponent',
        'Создай класс, расширяющий JComponent, переопредели paintComponent(), вызови super.paintComponent(g), нарисуй строку через drawString()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (442, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 2: Использование Graphics2D для улучшенной графики</h2>
<p class="intro">Graphics2D предоставляет улучшенные возможности. Антиалиасинг, градиенты, трансформации, улучшенные фигуры. Без Graphics2D графика будет базовой.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>Graphics2D</code> — улучшенная графика</li>
  <li>Приведение Graphics к Graphics2D</li>
  <li>Использование улучшенных возможностей</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Graphics2D необходим для создания улучшенной графики с дополнительными возможностями.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Приведи Graphics к Graphics2D: <code>Graphics2D g2d = (Graphics2D) g;</code></li>
  <li>Включи антиалиасинг: <code>g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> Graphics2D для улучшенной графики</li>
  <li><strong>✅ Отлично:</strong> Включать антиалиасинг для плавных линий, использовать для градиентов, использовать для трансформаций</li>
  <li><strong>⚠️ Избегай:</strong> Использовать Graphics вместо Graphics2D</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Графика будет улучшенной. Линии будут плавными, градиенты красивыми.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (442, 'ru', 'Кастомная отрисовка-мастер: используй Graphics2D',
        'Переопредели paintComponent(), приведи Graphics к Graphics2D, включи антиалиасинг через setRenderingHint()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (443, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 3: Рисование фигур с Graphics2D</h2>
<p class="intro">Фигуры — основа графики. Можно рисовать прямоугольники, овалы, линии, создавать сложные изображения. Без фигур нельзя создать графику.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Методы <code>drawRect()</code>, <code>fillRect()</code> — прямоугольники</li>
  <li>Методы <code>drawOval()</code>, <code>fillOval()</code> — овалы</li>
  <li>Методы <code>drawLine()</code> — линии</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Рисование фигур необходимо для создания графики.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Нарисуй прямоугольник: <code>g2d.drawRect(10, 10, 100, 50);</code></li>
  <li>Или закрашенный: <code>g2d.fillRect(10, 10, 100, 50);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>drawRect()</code> для контура</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>fillRect()</code> для закрашенного, использовать <code>drawOval()</code> и <code>fillOval()</code> для овалов, использовать <code>drawLine()</code> для линий</li>
  <li><strong>⚠️ Избегай:</strong> Рисовать вне границ компонента</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>На компоненте появятся фигуры. Можно рисовать прямоугольники, овалы, линии.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (443, 'ru', 'Кастомная отрисовка-мастер: рисуй фигуры',
        'Переопредели paintComponent(), нарисуй закрашенный прямоугольник через fillRect(10, 10, 100, 50)')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (444, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 4: Использование цветов в Graphics2D</h2>
<p class="intro">Цвета делают графику яркой. Можно установить цвет для рисования, создавать цветные изображения, улучшать визуальный вид. Без цветов графика будет чёрно-белой.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>setColor(Color)</code> — установка цвета</li>
  <li>Использование стандартных и кастомных цветов</li>
  <li>Создание цветной графики</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Цвета необходимы для создания цветной графики.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Установи цвет: <code>g2d.setColor(Color.RED);</code></li>
  <li>Или кастомный: <code>g2d.setColor(new Color(255, 0, 0));</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>setColor()</code> для установки</li>
  <li><strong>✅ Отлично:</strong> Использовать стандартные цвета Color.*, использовать <code>new Color(r, g, b)</code> для кастомных, использовать для цветной графики</li>
  <li><strong>⚠️ Избегай:</strong> Использовать слишком яркие цвета</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Графика будет цветной. Можно использовать разные цвета для рисования.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (444, 'ru', 'Кастомная отрисовка-мастер: используй цвета',
        'Переопредели paintComponent(), установи цвет Color.RED через setColor(), нарисуй прямоугольник')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (445, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 5: Использование градиентов в Graphics2D</h2>
<p class="intro">Градиенты создают плавные переходы. Можно создать красивый градиент от одного цвета к другому, улучшить визуальный вид. Без градиентов переходы будут резкими.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Класс <code>GradientPaint</code> — градиент</li>
  <li>Метод <code>setPaint(Paint)</code> — установка градиента</li>
  <li>Создание плавных переходов</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Градиенты необходимы для создания плавных переходов цветов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Создай градиент: <code>GradientPaint gradient = new GradientPaint(0, 0, Color.RED, 100, 0, Color.BLUE);</code></li>
  <li>Установи градиент: <code>g2d.setPaint(gradient);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> GradientPaint для создания</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>setPaint()</code> для установки, использовать для плавных переходов, улучшать визуальный вид</li>
  <li><strong>⚠️ Избегай:</strong> Использовать слишком контрастные цвета</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Графика будет с градиентом. Можно создать плавный переход от одного цвета к другому.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (445, 'ru', 'Кастомная отрисовка-мастер: используй градиенты',
        'Переопредели paintComponent(), создай градиент new GradientPaint(0, 0, Color.RED, 100, 0, Color.BLUE), установи через setPaint(), нарисуй прямоугольник')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (446, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 6: Рисование изображений с Graphics2D</h2>
<p class="intro">Изображения делают графику богаче. Можно отображать картинки, иконки, фотографии, создавать визуально привлекательные интерфейсы. Без изображений графика будет только векторной.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>drawImage(Image, int, int, ImageObserver)</code> — рисование изображения</li>
  <li>Загрузка изображений</li>
  <li>Отображение изображений на компоненте</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Изображения необходимы для создания визуально привлекательных интерфейсов.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Загрузи изображение: <code>Image image = Toolkit.getDefaultToolkit().getImage("image.png");</code></li>
  <li>Нарисуй изображение: <code>g2d.drawImage(image, 10, 10, this);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>drawImage()</code> для рисования</li>
  <li><strong>✅ Отлично:</strong> Использовать ImageIO.read() для загрузки, использовать для отображения картинок, масштабировать изображения</li>
  <li><strong>⚠️ Избегай:</strong> Использовать слишком большие изображения</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>На компоненте появится изображение. Можно отображать картинки, иконки, фотографии.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (446, 'ru', 'Кастомная отрисовка-мастер: рисуй изображения',
        'Переопредели paintComponent(), загрузи изображение через ImageIO.read(), нарисуй через drawImage()')
ON CONFLICT (task_id, language_code) DO NOTHING;

INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (447, 'ru', '<div class="lesson-header">
<h2>🎮 Урок 7: Обновление отрисовки с repaint()</h2>
<p class="intro">Обновление отрисовки необходимо для анимаций. Можно обновить компонент после изменения, создать анимации, обновить графику. Без обновления изменения не будут видны.</p>
</div>

<section class="learning-objectives">
<h3>📚 Изучаем:</h3>
<ul>
  <li>Метод <code>repaint()</code> — обновление отрисовки</li>
  <li>Метод <code>repaint(int, int, int, int)</code> — обновление области</li>
  <li>Управление обновлением компонента</li>
</ul>
</section>

<section class="importance">
<h3>💎 Зачем это нужно:</h3>
<p>Обновление отрисовки необходимо для отображения изменений и создания анимаций.</p>
</section>

<section class="implementation">
<h3>⚔️ Реализация:</h3>
<ol>
  <li>Обнови весь компонент: <code>component.repaint();</code></li>
  <li>Или область: <code>component.repaint(x, y, width, height);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Рекомендации:</h3>
<ul>
  <li><strong>✅ Используй:</strong> <code>repaint()</code> для обновления</li>
  <li><strong>✅ Отлично:</strong> Использовать <code>repaint(x, y, w, h)</code> для области, использовать для анимаций, обновлять после изменений</li>
  <li><strong>⚠️ Избегай:</strong> Вызывать слишком часто — может быть медленно</li>
</ul>
</section>

<section class="result">
<h3>👀 Результат:</h3>
<p>Компонент обновится. Можно создать анимации, обновить графику.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (447, 'ru', 'Кастомная отрисовка-мастер: обновляй отрисовку',
        'Создай компонент с paintComponent(), вызови repaint() для обновления')
ON CONFLICT (task_id, language_code) DO NOTHING;

