-- Flyway migration V2: Add solution column to task table
-- This column stores the full solution code that users can view if they get stuck

ALTER TABLE task ADD COLUMN IF NOT EXISTS solution TEXT;

-- Update existing tasks with solution examples
UPDATE task SET solution = 'JButton button = new JButton();
add(button);' WHERE id = 2;

UPDATE task SET solution = 'JButton button = new JButton();
button.setText("Поехали!");
add(button);' WHERE id = 3;

UPDATE task SET solution = 'JButton button = new JButton();
button.setBackground(Color.YELLOW);
add(button);' WHERE id = 4;

UPDATE task SET solution = 'JButton button = new JButton();
button.setForeground(Color.WHITE);
add(button);' WHERE id = 5;

UPDATE task SET solution = 'JButton button = new JButton();
button.setSize(320, 200);
add(button);' WHERE id = 6;

