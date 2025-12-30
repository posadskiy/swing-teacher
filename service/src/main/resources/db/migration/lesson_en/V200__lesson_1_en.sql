-- Flyway migration: Lesson 1 English translations
-- This migration contains English translations for lesson 1

-- ============================================================================
-- LESSON TRANSLATION
-- ============================================================================

INSERT INTO lesson_translation (lesson_id, language_code, lesson_name)
VALUES (1, 'en', 'Training')
ON CONFLICT (lesson_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS
-- ============================================================================

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (1, 'en', 'Introduction', '<p>Click the <strong>"Check"</strong> button</p>')
ON CONFLICT (task_id, language_code) DO NOTHING;
