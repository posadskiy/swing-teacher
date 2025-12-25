-- Flyway migration V1: initial schema for SwingTeacherDesktop (PostgreSQL)

CREATE TABLE IF NOT EXISTS task_category (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS users (
  id BIGSERIAL PRIMARY KEY,
  email VARCHAR(255),
  login VARCHAR(255),
  password VARCHAR(255),
  logins INT,
  last_login INT,
  complete_training BOOLEAN
);
CREATE INDEX IF NOT EXISTS idx_users_login ON users (login);

CREATE TABLE IF NOT EXISTS documentation (
  id BIGSERIAL PRIMARY KEY,
  text TEXT
);

CREATE TABLE IF NOT EXISTS error (
  id BIGSERIAL PRIMARY KEY,
  error_text TEXT
);

CREATE TABLE IF NOT EXISTS keyword (
  id BIGSERIAL PRIMARY KEY,
  keyword_text VARCHAR(255) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS idx_keyword_text ON keyword (keyword_text);

CREATE TABLE IF NOT EXISTS shorthand (
  id BIGSERIAL PRIMARY KEY,
  short_text VARCHAR(255) NOT NULL UNIQUE,
  full_text TEXT
);
CREATE INDEX IF NOT EXISTS idx_shorthand_short_text ON shorthand (short_text);

CREATE TABLE IF NOT EXISTS lesson (
  id BIGSERIAL PRIMARY KEY,
  lesson_number INT,
  lesson_name VARCHAR(255),
  id_task_category BIGINT REFERENCES task_category(id) ON DELETE SET NULL
);
CREATE INDEX IF NOT EXISTS idx_lesson_category ON lesson (id_task_category);

CREATE TABLE IF NOT EXISTS task (
  id BIGSERIAL PRIMARY KEY,
  id_lesson BIGINT REFERENCES lesson(id) ON DELETE SET NULL,
  task_number INT,
  title VARCHAR(255),
  question TEXT,
  answer TEXT,
  imports TEXT,
  id_documentation BIGINT REFERENCES documentation(id) ON DELETE SET NULL,
  difficult DOUBLE PRECISION,
  rating DOUBLE PRECISION
);
CREATE INDEX IF NOT EXISTS idx_task_lesson ON task (id_lesson);
CREATE INDEX IF NOT EXISTS idx_task_documentation ON task (id_documentation);

CREATE TABLE IF NOT EXISTS completed_task (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  task_id BIGINT NOT NULL REFERENCES task(id) ON DELETE CASCADE,
  CONSTRAINT uq_completed_task_user_task UNIQUE (user_id, task_id)
);
CREATE INDEX IF NOT EXISTS idx_completed_task_user ON completed_task (user_id);
CREATE INDEX IF NOT EXISTS idx_completed_task_task ON completed_task (task_id);


