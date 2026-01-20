-- Flyway migration V1: Complete schema and seed data for SwingTeacherDesktop (PostgreSQL)
-- This migration consolidates all previous migrations (V1-V5) and V2 into a single script

-- ============================================================================
-- TABLE CREATION
-- ============================================================================

CREATE TABLE IF NOT EXISTS task_category
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS documentation
(
    id BIGSERIAL PRIMARY KEY
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
    answer           TEXT,
    imports          TEXT,
    id_documentation BIGINT REFERENCES documentation (id) ON DELETE SET NULL,
    difficult        DOUBLE PRECISION,
    rating           DOUBLE PRECISION,
    solution         TEXT
);
CREATE INDEX IF NOT EXISTS idx_task_lesson ON task (id_lesson);
CREATE INDEX IF NOT EXISTS idx_task_documentation ON task (id_documentation);

CREATE TABLE IF NOT EXISTS completed_task
(
    id      BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    task_id BIGINT NOT NULL REFERENCES task (id) ON DELETE CASCADE,
    CONSTRAINT uq_completed_task_user_task UNIQUE (user_id, task_id)
);
-- Note: user_id references external user-service user IDs, no FK constraint
CREATE INDEX IF NOT EXISTS idx_completed_task_user ON completed_task (user_id);
CREATE INDEX IF NOT EXISTS idx_completed_task_task ON completed_task (task_id);

-- ============================================================================
-- SEED DATA
-- ============================================================================

-- Task category
INSERT INTO task_category (id, name)
VALUES (1, 'Default');

-- Documentation
-- Application documentation (ID 0 is reserved for application documentation)
INSERT INTO documentation (id)
VALUES (0);

-- Error
INSERT INTO error (id, error_text)
VALUES
    (1, 'Неверное решение: не хватает нужной команды или она написана иначе.'),
    (2, 'Неверное решение: не все требуемые команды найдены.'),
    (3, 'Неверное решение: не найдено создание нужного компонента (конструктор).');

-- Keyword
INSERT INTO keyword (id, keyword_text)
VALUES (1, 'keyword');

-- Shorthand
INSERT INTO shorthand (id, short_text, full_text)
VALUES (1, 'psvm', 'public static void main(String[] argv) { }');

-- ============================================================================
-- SEQUENCE UPDATES
-- ============================================================================

-- Ensure sequences are moved forward after explicit IDs
SELECT setval(pg_get_serial_sequence('task_category', 'id'),
              GREATEST((SELECT COALESCE(MAX(id), 0) FROM task_category), 1));
SELECT setval(pg_get_serial_sequence('documentation', 'id'),
              GREATEST((SELECT COALESCE(MAX(id), 0) FROM documentation), 1));
SELECT setval(pg_get_serial_sequence('error', 'id'), GREATEST((SELECT COALESCE(MAX(id), 0) FROM error), 1));
SELECT setval(pg_get_serial_sequence('keyword', 'id'), GREATEST((SELECT COALESCE(MAX(id), 0) FROM keyword), 1));
SELECT setval(pg_get_serial_sequence('shorthand', 'id'), GREATEST((SELECT COALESCE(MAX(id), 0) FROM shorthand), 1));
SELECT setval(pg_get_serial_sequence('lesson', 'id'), GREATEST((SELECT COALESCE(MAX(id), 0) FROM lesson), 1));
SELECT setval(pg_get_serial_sequence('task', 'id'), GREATEST((SELECT COALESCE(MAX(id), 0) FROM task), 1));
SELECT setval(pg_get_serial_sequence('completed_task', 'id'), (SELECT COALESCE(MAX(id), 1) FROM completed_task));


CREATE TABLE IF NOT EXISTS language
(
    id   BIGSERIAL PRIMARY KEY,
    code VARCHAR(10)  NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_language_code ON language (code);

-- Insert supported languages
INSERT INTO language (id, code, name)
VALUES (1, 'ru', 'Russian'),
       (2, 'en', 'English'),
       (3, 'it', 'Italian'),
       (4, 'es', 'Spanish')
ON CONFLICT (code) DO NOTHING;

-- ============================================================================
-- LESSON TRANSLATION TABLE
-- ============================================================================

CREATE TABLE IF NOT EXISTS lesson_translation
(
    id            BIGSERIAL PRIMARY KEY,
    lesson_id     BIGINT      NOT NULL REFERENCES lesson (id) ON DELETE CASCADE,
    language_code VARCHAR(10) NOT NULL REFERENCES language (code),
    lesson_name   VARCHAR(255),
    CONSTRAINT uq_lesson_translation UNIQUE (lesson_id, language_code)
);

CREATE INDEX IF NOT EXISTS idx_lesson_translation_lesson ON lesson_translation (lesson_id);
CREATE INDEX IF NOT EXISTS idx_lesson_translation_language ON lesson_translation (language_code);

-- ============================================================================
-- TASK TRANSLATION TABLE
-- ============================================================================

CREATE TABLE IF NOT EXISTS task_translation
(
    id            BIGSERIAL PRIMARY KEY,
    task_id       BIGINT      NOT NULL REFERENCES task (id) ON DELETE CASCADE,
    language_code VARCHAR(10) NOT NULL REFERENCES language (code),
    title         VARCHAR(255),
    question      TEXT,
    CONSTRAINT uq_task_translation UNIQUE (task_id, language_code)
);

CREATE INDEX IF NOT EXISTS idx_task_translation_task ON task_translation (task_id);
CREATE INDEX IF NOT EXISTS idx_task_translation_language ON task_translation (language_code);

-- ============================================================================
-- MIGRATE EXISTING RUSSIAN DATA TO TRANSLATION TABLES
-- ============================================================================

-- Migrate lesson names to lesson_translation (Russian)
-- Note: This only runs if lesson table has lesson_name column with data
INSERT INTO lesson_translation (lesson_id, language_code, lesson_name)
SELECT id, 'ru', lesson_name
FROM lesson
WHERE lesson_name IS NOT NULL
ON CONFLICT (lesson_id, language_code) DO NOTHING;

-- Note: Task titles and questions are not migrated here as they are stored
-- directly in task_translation table. The task table does not have title/question columns.

-- ============================================================================
-- UPDATE SEQUENCES
-- ============================================================================

SELECT setval(pg_get_serial_sequence('language', 'id'),
              GREATEST((SELECT COALESCE(MAX(id), 0) FROM language), 1));
SELECT setval(pg_get_serial_sequence('lesson_translation', 'id'),
              GREATEST((SELECT COALESCE(MAX(id), 0) FROM lesson_translation), 1));
SELECT setval(pg_get_serial_sequence('task_translation', 'id'),
              GREATEST((SELECT COALESCE(MAX(id), 0) FROM task_translation), 1));


-- ============================================================================
-- DOCUMENTATION TRANSLATION TABLE
-- ============================================================================

CREATE TABLE IF NOT EXISTS documentation_translation
(
    id               BIGSERIAL PRIMARY KEY,
    documentation_id BIGINT      NOT NULL REFERENCES documentation (id) ON DELETE CASCADE,
    language_code    VARCHAR(10) NOT NULL REFERENCES language (code),
    text             TEXT,
    CONSTRAINT uq_documentation_translation UNIQUE (documentation_id, language_code)
);

CREATE INDEX IF NOT EXISTS idx_documentation_translation_documentation ON documentation_translation (documentation_id);
CREATE INDEX IF NOT EXISTS idx_documentation_translation_language ON documentation_translation (language_code);

-- ============================================================================
-- INSERT APPLICATION DOCUMENTATION TRANSLATION
-- ============================================================================

-- Application documentation (ID 0) - English translation
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (0, 'en', '<h1>SwingTeacher Desktop Application</h1>
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
ON CONFLICT (documentation_id, language_code) DO NOTHING;

-- ============================================================================
-- UPDATE SEQUENCES
-- ============================================================================

SELECT setval(pg_get_serial_sequence('documentation_translation', 'id'),
              GREATEST((SELECT COALESCE(MAX(id), 0) FROM documentation_translation), 1));
