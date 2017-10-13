DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id            SERIAL PRIMARY KEY NOT NULL,
  title         varchar(255)       NOT NULL,
  description   text               NULL,
  created_at    timestamp          NOT NULL   DEFAULT now(),
  updated_at    timestamp          NULL,
  completed     boolean            NOT NULL   DEFAULT false
);

ALTER TABLE tasks
  DROP COLUMN IF EXISTS completed;

ALTER TABLE tasks
  ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
  VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT *
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE id = 1;

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

-- SELECT *
-- FROM tasks;

\c kevinyogi