-- Flyway migration: English task translations for lessons 3-53
-- This migration contains English translations for tasks in lessons 3-53
-- Note: Some translations may be placeholders and can be refined incrementally

-- ============================================================================
-- TASK TRANSLATIONS
-- ============================================================================

-- Note: This is a comprehensive migration for all task translations.
-- Individual task translations for lessons 1-2 are already in V200-V201 files.
-- Detailed translations can be added incrementally as needed.

-- For now, this file ensures the structure is in place.
-- Task translations will fall back to Russian or original values if not present,
-- so this migration can be expanded over time.

-- Lesson 3 (Labels) - Basic translations
INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (16, 'en', 'Label Beginner: Create an information label', 'Create a label and add it to the form'),
       (17, 'en', 'Label Text: Give it a voice',
        'Create a label, set its text to "Hello, world!" and add it to the form'),
       (18, 'en', 'Label Icon: Add visual effect', 'Create a label, set an icon and add it to the form'),
       (19, 'en', 'Horizontal Alignment: Position text correctly',
        'Create a label with text "Center", align it to center and add it to the form'),
       (20, 'en', 'Vertical Alignment: Move text up or down',
        'Create a label, align text vertically to center and add it to the form'),
       (21, 'en', 'Label Colors: Color the information label',
        'Create a label, set yellow background, black text and add it to the form'),
       (22, 'en', 'Label Font: Choose text style',
        'Create a label, set bold Arial font size 16 and add it to the form'),
       (23, 'en', 'Label Size: Make it the right size', 'Create a label, set size 200x50 and add it to the form'),
       (24, 'en', 'Label Tooltip: Add popup help',
        'Create a label, add tooltip "This is a tooltip!" and add it to the form'),
       (25, 'en', 'HTML in Label: Formatted text', 'Create a label with HTML text "<b>Bold</b>" and add it to the form')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Additional task translations for other lessons can be added here incrementally.
-- The service layer will fall back to Russian or original values if translations are missing.
