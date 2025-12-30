-- Flyway migration: Lesson 3 English translations
-- This migration contains English translations for lesson 3

-- ============================================================================
-- LESSON TRANSLATION
-- ============================================================================

INSERT INTO lesson_translation (lesson_id, language_code, lesson_name)
VALUES (3, 'en', 'Labels (JLabel)')
ON CONFLICT (lesson_id, language_code) DO NOTHING;
