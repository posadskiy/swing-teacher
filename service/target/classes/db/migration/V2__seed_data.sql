-- Flyway migration V2: minimal seed data so the UI has something to show.

INSERT INTO task_category (id, name)
VALUES (1, 'Default')
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO documentation (id, text)
VALUES (1, 'Здесь должна быть документация')
ON CONFLICT (id) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO error (id, error_text)
VALUES (1, 'Текст ошибки')
ON CONFLICT (id) DO UPDATE SET error_text = EXCLUDED.error_text;

INSERT INTO keyword (id, keyword_text)
VALUES (1, 'keyword')
ON CONFLICT (id) DO UPDATE SET keyword_text = EXCLUDED.keyword_text;

INSERT INTO shorthand (id, short_text, full_text)
VALUES (1, 'psvm', 'public static void main(String[] argv) { }')
ON CONFLICT (id) DO UPDATE SET short_text = EXCLUDED.short_text, full_text = EXCLUDED.full_text;

-- create a lesson in category 1 (Default)
INSERT INTO lesson (id, lesson_number, lesson_name, id_task_category)
VALUES (1, 1, 'Название урока', 1)
ON CONFLICT (id) DO UPDATE SET lesson_name = EXCLUDED.lesson_name, id_task_category = EXCLUDED.id_task_category;

-- create a task in the first lesson
INSERT INTO task (id, id_lesson, task_number, title, question, answer, imports, id_documentation, difficult, rating)
VALUES (1, 1, 1, 'Заголовок', 'На этом месте должен быть вопрос', '', '', 1, 0.0, 0.0)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, id_lesson = EXCLUDED.id_lesson, id_documentation = EXCLUDED.id_documentation;

-- demo user: login=login, password=password (kept as-is, because legacy code expects md5 in some flows)
INSERT INTO users (id, email, login, password, logins, last_login, complete_training)
VALUES (1, 'test@test.com', 'login', 'password', 0, 0, false)
ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email, login = EXCLUDED.login, password = EXCLUDED.password;

-- Ensure sequences are moved forward after explicit IDs
SELECT setval(pg_get_serial_sequence('task_category','id'), (SELECT COALESCE(MAX(id), 1) FROM task_category));
SELECT setval(pg_get_serial_sequence('documentation','id'), (SELECT COALESCE(MAX(id), 1) FROM documentation));
SELECT setval(pg_get_serial_sequence('error','id'), (SELECT COALESCE(MAX(id), 1) FROM error));
SELECT setval(pg_get_serial_sequence('keyword','id'), (SELECT COALESCE(MAX(id), 1) FROM keyword));
SELECT setval(pg_get_serial_sequence('shorthand','id'), (SELECT COALESCE(MAX(id), 1) FROM shorthand));
SELECT setval(pg_get_serial_sequence('lesson','id'), (SELECT COALESCE(MAX(id), 1) FROM lesson));
SELECT setval(pg_get_serial_sequence('task','id'), (SELECT COALESCE(MAX(id), 1) FROM task));
SELECT setval(pg_get_serial_sequence('users','id'), (SELECT COALESCE(MAX(id), 1) FROM users));


