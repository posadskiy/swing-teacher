-- Flyway migration: All lessons English translations
-- This migration contains corrected English translations for all lessons
-- Based on actual Russian lesson names from lesson_ru migrations

-- ============================================================================
-- LESSON TRANSLATIONS
-- ============================================================================

INSERT INTO lesson_translation (lesson_id, language_code, lesson_name)
VALUES (1, 'en', 'Training'),
       (2, 'en', 'Buttons (JButton)'),
       (3, 'en', 'Labels (JLabel)'),
       (4, 'en', 'Text Fields (JTextField)'),
       (5, 'en', 'Text Areas (JTextArea)'),
       (6, 'en', 'Password Fields (JPasswordField)'),
       (7, 'en', 'Checkboxes (JCheckBox)'),
       (8, 'en', 'Radio Buttons (JRadioButton)'),
       (9, 'en', 'Toggle Buttons (JToggleButton)'),
       (10, 'en', 'Combo Boxes (JComboBox)'),
       (11, 'en', 'Lists (JList)'),
       (12, 'en', 'Sliders (JSlider)'),
       (13, 'en', 'Spinners (JSpinner)'),
       (14, 'en', 'Progress Bars (JProgressBar)'),
       (15, 'en', 'Scroll Bars (JScrollBar)'),
       (16, 'en', 'Panels (JPanel)'),
       (17, 'en', 'Frames (JFrame)'),
       (18, 'en', 'Dialogs (JDialog)'),
       (19, 'en', 'Windows (JWindow)'),
       (20, 'en', 'Scroll Panes (JScrollPane)'),
       (21, 'en', 'Split Panes (JSplitPane)'),
       (22, 'en', 'Tabbed Panes (JTabbedPane)'),
       (23, 'en', 'Toolbars (JToolBar)'),
       (24, 'en', 'Menu Bars (JMenuBar)'),
       (25, 'en', 'Menus (JMenu)'),
       (26, 'en', 'Menu Items (JMenuItem)'),
       (27, 'en', 'Checkbox Menu Items (JCheckBoxMenuItem)'),
       (28, 'en', 'Radio Button Menu Items (JRadioButtonMenuItem)'),
       (29, 'en', 'Popup Menus (JPopupMenu)'),
       (30, 'en', 'Tables (JTable)'),
       (31, 'en', 'Trees (JTree)'),
       (32, 'en', 'HTML/RTF Editor (JEditorPane)'),
       (33, 'en', 'Text Pane (JTextPane)'),
       (34, 'en', 'Option Panes (JOptionPane)'),
       (35, 'en', 'File Choosers (JFileChooser)'),
       (36, 'en', 'Color Choosers (JColorChooser)'),
       (37, 'en', 'BorderLayout - Edge Layout'),
       (38, 'en', 'FlowLayout - Row Layout'),
       (39, 'en', 'GridLayout - Grid Layout'),
       (40, 'en', 'GridBagLayout - Flexible Grid'),
       (41, 'en', 'BoxLayout - Vertical/Horizontal Layout'),
       (42, 'en', 'CardLayout - Panel Switching'),
       (43, 'en', 'GroupLayout - Group Layout'),
       (44, 'en', 'SpringLayout - Spring Layout'),
       (45, 'en', 'ActionListener - Action Handling'),
       (46, 'en', 'MouseListener - Mouse Event Handling'),
       (47, 'en', 'KeyListener - Keyboard Handling'),
       (48, 'en', 'FocusListener - Focus Handling'),
       (49, 'en', 'ItemListener and ChangeListener'),
       (50, 'en', 'Custom Rendering (paintComponent)'),
       (51, 'en', 'Custom Components'),
       (52, 'en', 'Look and Feel'),
       (53, 'en', 'Timers')
ON CONFLICT (lesson_id, language_code) DO NOTHING;

-- ============================================================================
-- TASK TRANSLATIONS (Basic translations for common tasks)
-- ============================================================================

-- Note: Individual task translations should be added in lesson-specific files
-- This file provides lesson name translations only
