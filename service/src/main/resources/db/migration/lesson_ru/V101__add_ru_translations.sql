-- Flyway migration: Add Russian translations for all existing lessons and tasks
-- This migration ensures all existing Russian data is in translation tables
-- It's safe to run multiple times due to ON CONFLICT clauses

-- ============================================================================
-- TASK TRANSLATIONS (Russian)
-- ============================================================================

-- Insert all task titles and questions into translation table
INSERT INTO task_translation (task_id, language_code, title, question)
SELECT id, 'ru', title, question
FROM task
WHERE (title IS NOT NULL OR question IS NOT NULL)
  AND NOT EXISTS (SELECT 1
                  FROM task_translation
                  WHERE task_translation.task_id = task.id
                    AND task_translation.language_code = 'ru')
ON CONFLICT (task_id, language_code) DO NOTHING;
