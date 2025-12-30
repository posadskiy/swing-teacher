-- Flyway migration: Lesson 2 English translations
-- This migration contains English translations for lesson 2

-- ============================================================================
-- LESSON TRANSLATION
-- ============================================================================

INSERT INTO lesson_translation (lesson_id, language_code, lesson_name)
VALUES (2, 'en', 'Buttons (JButton)')
ON CONFLICT (lesson_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS
-- ============================================================================

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (2, 'en', 'Button Beginner: Summon the Hero', 'Create a button and add it to the form'),
       (3, 'en', 'Text Spell: Give the Button a Voice', 'Create a button, set its text and add it to the form'),
       (4, 'en', 'Button Skin: Gold!', 'Create a button, paint the background yellow and add it to the form'),
       (5, 'en', 'Text Color: Readable and Beautiful', 'Create a button, make the text white and add it to the form!'),
       (6, 'en', 'Hitbox: Make the Button Huge', 'Create a button, set its size to 320x200 and add it to the form.'),
       (7, 'en', 'Button Master: Add Hot Key',
        'Set mnemonic VK_O via setMnemonic(), underline the letter in text via HTML'),
       (8, 'en', 'Button Master: Add Icon with Text',
        'Set icon via setIcon(), set text via setText(), set gap 5 via setIconTextGap()'),
       (9, 'en', 'Button Master: Add Mnemonic', 'Set mnemonic VK_S via setMnemonic(), add &S to button text'),
       (10, 'en', 'Button Master: Add Hover Icon',
        'Set normal icon via setIcon(), set hover icon via setRolloverIcon()'),
       (11, 'en', 'Button Master: Add Disabled Icon',
        'Set normal icon via setIcon(), set disabled icon via setDisabledIcon(), disable button'),
       (12, 'en', 'Button Master: Add Pressed Icon',
        'Set normal icon via setIcon(), set pressed icon via setPressedIcon()'),
       (13, 'en', 'Button Master: Add Rollover Icon',
        'Set normal icon via setIcon(), set rollover icon via setRolloverIcon()'),
       (14, 'en', 'Button Master: Add Selected Icon',
        'Set normal icon via setIcon(), set selected icon via setSelectedIcon()'),
       (15, 'en', 'Button Master: Add Disabled Icon',
        'Set normal icon via setIcon(), set disabled icon via setDisabledIcon()')
ON CONFLICT (task_id, language_code) DO NOTHING;
