-- Flyway migration V1: Complete schema and seed data for SwingTeacherDesktop (PostgreSQL)
-- This migration consolidates all previous migrations (V1-V5) into a single script

-- ============================================================================
-- TABLE CREATION
-- ============================================================================

CREATE TABLE IF NOT EXISTS task_category
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS users
(
    id                BIGSERIAL PRIMARY KEY,
    email             VARCHAR(255),
    login             VARCHAR(255),
    password          VARCHAR(255),
    logins            INT,
    last_login        INT,
    complete_training BOOLEAN
);
CREATE INDEX IF NOT EXISTS idx_users_login ON users (login);

CREATE TABLE IF NOT EXISTS documentation
(
    id   BIGSERIAL PRIMARY KEY,
    text TEXT
);

CREATE TABLE IF NOT EXISTS error
(
    id         BIGSERIAL PRIMARY KEY,
    error_text TEXT
);

CREATE TABLE IF NOT EXISTS keyword
(
    id           BIGSERIAL PRIMARY KEY,
    keyword_text VARCHAR(255) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS idx_keyword_text ON keyword (keyword_text);

CREATE TABLE IF NOT EXISTS shorthand
(
    id         BIGSERIAL PRIMARY KEY,
    short_text VARCHAR(255) NOT NULL UNIQUE,
    full_text  TEXT
);
CREATE INDEX IF NOT EXISTS idx_shorthand_short_text ON shorthand (short_text);

CREATE TABLE IF NOT EXISTS lesson
(
    id               BIGSERIAL PRIMARY KEY,
    lesson_number    INT,
    lesson_name      VARCHAR(255),
    id_task_category BIGINT REFERENCES task_category (id) ON DELETE SET NULL
);
CREATE INDEX IF NOT EXISTS idx_lesson_category ON lesson (id_task_category);

CREATE TABLE IF NOT EXISTS task
(
    id               BIGSERIAL PRIMARY KEY,
    id_lesson        BIGINT REFERENCES lesson (id) ON DELETE SET NULL,
    task_number      INT,
    title            VARCHAR(255),
    question         TEXT,
    answer           TEXT,
    imports          TEXT,
    id_documentation BIGINT REFERENCES documentation (id) ON DELETE SET NULL,
    difficult        DOUBLE PRECISION,
    rating           DOUBLE PRECISION
);
CREATE INDEX IF NOT EXISTS idx_task_lesson ON task (id_lesson);
CREATE INDEX IF NOT EXISTS idx_task_documentation ON task (id_documentation);

CREATE TABLE IF NOT EXISTS completed_task
(
    id      BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    task_id BIGINT NOT NULL REFERENCES task (id) ON DELETE CASCADE,
    CONSTRAINT uq_completed_task_user_task UNIQUE (user_id, task_id)
);
CREATE INDEX IF NOT EXISTS idx_completed_task_user ON completed_task (user_id);
CREATE INDEX IF NOT EXISTS idx_completed_task_task ON completed_task (task_id);

-- ============================================================================
-- REFRESH TOKENS TABLE (from V3)
-- ============================================================================

CREATE TABLE IF NOT EXISTS refresh_tokens
(
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT       NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    token      VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP    NOT NULL,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_refresh_tokens_token ON refresh_tokens (token);
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_user_id ON refresh_tokens (user_id);
CREATE INDEX IF NOT EXISTS idx_refresh_tokens_expires_at ON refresh_tokens (expires_at);

-- ============================================================================
-- SEED DATA
-- ============================================================================

-- Task category
INSERT INTO task_category (id, name)
VALUES (1, 'Default')
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name;

-- Documentation
-- Application documentation (ID 0 is reserved for application documentation)
INSERT INTO documentation (id, text)
VALUES (0, '<h1>SwingTeacher Desktop Application</h1>
<h2>Welcome to SwingTeacher Desktop</h2>
<p>SwingTeacher Desktop is an educational application designed to help you learn Java programming through interactive tasks and lessons.</p>

<h2>Getting Started</h2>
<h3>Registration</h3>
<p>To get started, you need to create an account:</p>
<ol>
  <li>Click on the "Register" button on the login screen</li>
  <li>Enter your login, password, and email address</li>
  <li>Click "Register" to create your account</li>
  <li>You will be automatically logged in after registration</li>
</ol>

<h3>Login</h3>
<p>To access the application:</p>
<ol>
  <li>Enter your login and password</li>
  <li>Click "Login" to access the main application</li>
</ol>

<h2>Using the Application</h2>
<h3>Lessons and Tasks</h3>
<p>The main window displays:</p>
<ul>
  <li><strong>Lesson:</strong> Select a lesson from the dropdown menu</li>
  <li><strong>Task:</strong> Choose a task from the selected lesson</li>
  <li><strong>Question:</strong> Read the task question in the question panel</li>
  <li><strong>Documentation:</strong> View reference information for the current task</li>
  <li><strong>Solution:</strong> Write your Java code solution in the solution panel</li>
</ul>

<h3>Working with Tasks</h3>
<p>To complete a task:</p>
<ol>
  <li>Select a lesson and task from the dropdown menus</li>
  <li>Read the question and documentation</li>
  <li>Write your solution in the solution panel (Java code editor)</li>
  <li>Click "View" to compile and run your code</li>
  <li>Click "Check" to verify your solution</li>
</ol>

<h3>Features</h3>
<ul>
  <li><strong>Code Editor:</strong> Syntax-highlighted Java code editor with autocomplete</li>
  <li><strong>Auto-completion:</strong> Keywords and code snippets are available via autocomplete</li>
  <li><strong>Task Tracking:</strong> Completed tasks are marked with a checkmark (☑)</li>
  <li><strong>Progress Tracking:</strong> Your progress is saved automatically</li>
</ul>

<h2>Menu Options</h2>
<h3>Settings Menu</h3>
<ul>
  <li><strong>New user:</strong> Register a new account</li>
  <li><strong>Change user:</strong> Log out and switch to another account</li>
  <li><strong>Exit:</strong> Close the application</li>
</ul>

<h3>Help Menu</h3>
<ul>
  <li><strong>Documentation:</strong> View this help documentation</li>
  <li><strong>About:</strong> View application information</li>
</ul>

<h2>Tips</h2>
<ul>
  <li>Use the autocomplete feature (Ctrl+Space) to quickly insert code snippets</li>
  <li>Read the documentation panel for each task to understand the requirements</li>
  <li>Check your code with "View" before submitting with "Check"</li>
  <li>Completed tasks are marked with a checkmark for easy identification</li>
</ul>

<h2>Support</h2>
<p>If you encounter any issues or have questions, please contact the application administrator.</p>

<p><em>Happy coding!</em></p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO documentation (id, text)
VALUES (1, '<h2>Привет!</h2>

<p>Обратил(а) на меня внимание? <strong>Отлично!</strong> Предлагаю тебе пройти курс по изучению
библиотеки <strong>Java Swing</strong> и научиться создавать визуальный интерфейс любой сложности
для приложения или web-сайта. Окошки, кнопки, ползунки и многое другое — это совсем
не сложно! <em>Приступим?</em></p>

<p>Для начала нужно пройти небольшое обучение, которое поможет разобраться в моей
функциональности и поможет нам с тобой перейти на «ты». Не против? <strong>Тогда начнём!</strong></p>

<p>В этом окошке будет появляться справочная информация, необходимая для прохождения
задания. <strong>Важно читать до конца и обязательно стараться разобраться!</strong> Я со своей
стороны сделаю всё, чтобы информация воспринималась как можно легче и приятней.
Мы ведь теперь в команде, правда?</p>

<p>Слева располагается окошко с заданием. Сейчас там просьба нажать на кнопочку
<strong>«Проверить»</strong>. Если это сделать, первое задание сразу засчитается. Это небольшая
благодарность за прочтение данного текста. <em>Итак, приступай, я жду!</em></p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

-- ============================================================================
-- BUTTONS COURSE (Simple, gamefied tasks)
-- ============================================================================

INSERT INTO documentation (id, text)
VALUES (2, '<h2>Урок 1 — Кнопка-новичок</h2>
<p>Сегодня ты создаёшь свою первую кнопку в Swing — как будто призываешь героя на поле боя.</p>
<p><strong>Что изучаем:</strong> класс <code>JButton</code> и добавление компонента на форму через <code>add(...)</code>.</p>
<p><strong>Совет:</strong> в редакторе ты пишешь код <em>внутри уже созданного окна</em>, поэтому можно сразу вызывать <code>add</code>.</p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO documentation (id, text)
VALUES (3, '<h2>Урок 2 — Текстовое заклинание</h2>
<p>Кнопка умеет говорить! Ты научишься менять надпись на кнопке через <code>setText(...)</code>.</p>
<p><strong>Что изучаем:</strong> обновление текста компонента и смысловую “подсказку” игроку через понятные подписи.</p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO documentation (id, text)
VALUES (4, '<h2>Урок 3 — Скин: цвет фона</h2>
<p>Пора раскрасить кнопку, как редкий лут. Фон кнопки меняется через <code>setBackground(...)</code>.</p>
<p><strong>Что изучаем:</strong> визуальные стили в Swing и объект <code>Color</code> из AWT.</p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO documentation (id, text)
VALUES (5, '<h2>Урок 4 — Цвет текста</h2>
<p>Чтобы кнопку было легко читать, мы настраиваем цвет текста через <code>setForeground(...)</code>.</p>
<p><strong>Что изучаем:</strong> контраст, читаемость и базовые визуальные настройки компонентов.</p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO documentation (id, text)
VALUES (6, '<h2>Урок 5 — Хитбокс: размер кнопки</h2>
<p>Сделаем кнопку большой, как “НАЧАТЬ РЕЙД”. Размер задаётся через <code>setSize(width, height)</code>.</p>
<p><strong>Важно:</strong> на итоговый размер может влиять layout-менеджер, но для первых шагов это отличный старт.</p>')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

-- Error
INSERT INTO error (id, error_text)
VALUES
    (1, 'Неверное решение: не хватает нужной команды или она написана иначе.'),
    (2, 'Неверное решение: не все требуемые команды найдены.'),
    (3, 'Неверное решение: не найдено создание нужного компонента (конструктор).')
ON CONFLICT (id) DO UPDATE SET error_text = EXCLUDED.error_text;

-- Keyword
INSERT INTO keyword (id, keyword_text)
VALUES (1, 'keyword')
ON CONFLICT (id) DO UPDATE SET keyword_text = EXCLUDED.keyword_text;

-- Shorthand
INSERT INTO shorthand (id, short_text, full_text)
VALUES (1, 'psvm', 'public static void main(String[] argv) { }')
ON CONFLICT (id) DO UPDATE SET short_text = EXCLUDED.short_text,
                               full_text  = EXCLUDED.full_text;

-- Lessons
INSERT INTO lesson (id, lesson_number, lesson_name, id_task_category)
VALUES (1, 1, 'Обучение', 1)
ON CONFLICT (id) DO UPDATE SET lesson_name      = EXCLUDED.lesson_name,
                               id_task_category = EXCLUDED.id_task_category;

INSERT INTO lesson (id, lesson_number, lesson_name, id_task_category)
VALUES (2, 2, 'Swing: Кнопки (простые задания)', 1)
ON CONFLICT (id) DO UPDATE SET lesson_number    = EXCLUDED.lesson_number,
                               lesson_name      = EXCLUDED.lesson_name,
                               id_task_category = EXCLUDED.id_task_category;

-- Tasks
INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (1, 1, 0, 'Вступление', 'Нажми на кнопку "Проверить"', 
        '', '', 1, 0.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title            = EXCLUDED.title,
                               id_lesson        = EXCLUDED.id_lesson,
                               id_documentation = EXCLUDED.id_documentation;

INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (2, 2, 1, 'Кнопка-новичок: призови героя',
        'Задание:\nСоздай кнопку и добавь её на форму.\n\nРешение:\nJButton button = new JButton();\nadd(button);\n\nСложность: 12/100\n\nПодсказка: окно уже создано — работаем прямо внутри него.',
        'JButton-add',
        '', 2, 12.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title            = EXCLUDED.title,
                               question         = EXCLUDED.question,
                               answer           = EXCLUDED.answer,
                               imports          = EXCLUDED.imports,
                               id_lesson        = EXCLUDED.id_lesson,
                               task_number      = EXCLUDED.task_number,
                               id_documentation = EXCLUDED.id_documentation,
                               difficult        = EXCLUDED.difficult,
                               rating           = EXCLUDED.rating;

INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (3, 2, 2, 'Текстовое заклинание: дай кнопке имя',
        'Задание:\nСоздай кнопку, задай ей текст и добавь на форму.\n\nРешение:\nJButton button = new JButton();\nbutton.setText("Поехали!");\nadd(button);\n\nСложность: 20/100\n\nБонус-лут: попробуй любой другой текст после прохождения.',
        'JButton-setText,add',
        '', 3, 20.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title            = EXCLUDED.title,
                               question         = EXCLUDED.question,
                               answer           = EXCLUDED.answer,
                               imports          = EXCLUDED.imports,
                               id_lesson        = EXCLUDED.id_lesson,
                               task_number      = EXCLUDED.task_number,
                               id_documentation = EXCLUDED.id_documentation,
                               difficult        = EXCLUDED.difficult,
                               rating           = EXCLUDED.rating;

INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (4, 2, 3, 'Скин кнопки: золото!',
        'Задание:\nСоздай кнопку, покрась фон в жёлтый и добавь на форму.\n\nРешение:\nJButton button = new JButton();\nbutton.setBackground(Color.YELLOW);\nadd(button);\n\nСложность: 28/100\n\nЭто твоя “редкая” кнопка — берегись зависти!',
        'JButton-setBackground,add',
        '', 4, 28.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title            = EXCLUDED.title,
                               question         = EXCLUDED.question,
                               answer           = EXCLUDED.answer,
                               imports          = EXCLUDED.imports,
                               id_lesson        = EXCLUDED.id_lesson,
                               task_number      = EXCLUDED.task_number,
                               id_documentation = EXCLUDED.id_documentation,
                               difficult        = EXCLUDED.difficult,
                               rating           = EXCLUDED.rating;

INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (5, 2, 4, 'Цвет текста: читабельно и красиво',
        'Задание:\nСоздай кнопку, сделай текст белым и добавь на форму.\n\nРешение:\nJButton button = new JButton();\nbutton.setForeground(Color.WHITE);\nadd(button);\n\nСложность: 30/100\n\nЕсли фон светлый — белый текст может быть не виден. Это нормально для урока: мы тренируем команду!',
        'JButton-setForeground,add',
        '', 5, 30.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title            = EXCLUDED.title,
                               question         = EXCLUDED.question,
                               answer           = EXCLUDED.answer,
                               imports          = EXCLUDED.imports,
                               id_lesson        = EXCLUDED.id_lesson,
                               task_number      = EXCLUDED.task_number,
                               id_documentation = EXCLUDED.id_documentation,
                               difficult        = EXCLUDED.difficult,
                               rating           = EXCLUDED.rating;

INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (6, 2, 5, 'Хитбокс: сделай кнопку огромной',
        'Задание:\nСоздай кнопку, задай ей размер 320x200 и добавь на форму.\n\nРешение:\nJButton button = new JButton();\nbutton.setSize(320, 200);\nadd(button);\n\nСложность: 35/100\n\nЭто “кнопка-босс”. Осторожно: она занимает много места!',
        'JButton-setSize,add',
        '', 6, 35.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title            = EXCLUDED.title,
                               question         = EXCLUDED.question,
                               answer           = EXCLUDED.answer,
                               imports          = EXCLUDED.imports,
                               id_lesson        = EXCLUDED.id_lesson,
                               task_number      = EXCLUDED.task_number,
                               id_documentation = EXCLUDED.id_documentation,
                               difficult        = EXCLUDED.difficult,
                               rating           = EXCLUDED.rating;

-- Demo user: login=login, password=password (kept as-is, because legacy code expects md5 in some flows)
INSERT INTO users (id, email, login, password, logins, last_login, complete_training)
VALUES (1, 'test@test.com', 'login', 'password', 0, 0, false)
ON CONFLICT (id) DO UPDATE SET email    = EXCLUDED.email,
                               login    = EXCLUDED.login,
                               password = EXCLUDED.password;

-- ============================================================================
-- SEQUENCE UPDATES
-- ============================================================================

-- Ensure sequences are moved forward after explicit IDs
SELECT setval(pg_get_serial_sequence('task_category', 'id'), (SELECT COALESCE(MAX(id), 1) FROM task_category));
SELECT setval(pg_get_serial_sequence('documentation', 'id'), (SELECT COALESCE(MAX(id), 1) FROM documentation));
SELECT setval(pg_get_serial_sequence('error', 'id'), (SELECT COALESCE(MAX(id), 1) FROM error));
SELECT setval(pg_get_serial_sequence('keyword', 'id'), (SELECT COALESCE(MAX(id), 1) FROM keyword));
SELECT setval(pg_get_serial_sequence('shorthand', 'id'), (SELECT COALESCE(MAX(id), 1) FROM shorthand));
SELECT setval(pg_get_serial_sequence('lesson', 'id'), (SELECT COALESCE(MAX(id), 1) FROM lesson));
SELECT setval(pg_get_serial_sequence('task', 'id'), (SELECT COALESCE(MAX(id), 1) FROM task));
SELECT setval(pg_get_serial_sequence('users', 'id'), (SELECT COALESCE(MAX(id), 1) FROM users));
SELECT setval(pg_get_serial_sequence('refresh_tokens', 'id'), (SELECT COALESCE(MAX(id), 1) FROM refresh_tokens));
SELECT setval(pg_get_serial_sequence('completed_task', 'id'), (SELECT COALESCE(MAX(id), 1) FROM completed_task));
