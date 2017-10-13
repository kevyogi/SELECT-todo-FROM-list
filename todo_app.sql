-- 1
DROP DATABASE IF EXISTS todo_app;
-- 2
DROP USER IF EXISTS michael;
-- 3
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
-- 4
CREATE DATABASE todo_app;
-- 5
\c todo_app;
-- 6, 7
CREATE TABLE tasks (
  id            SERIAL PRIMARY KEY NOT NULL,
  title         varchar(255)       NOT NULL,
  description   text               NULL,
  created_at    timestamp          NOT NULL   DEFAULT now(),
  updated_at    timestamp          NULL,
  completed     boolean            NOT NULL   DEFAULT false
);
-- 9
ALTER TABLE tasks
  DROP COLUMN IF EXISTS completed;
-- 10
ALTER TABLE tasks
  ADD COLUMN completed_at timestamp NULL DEFAULT NULL;
-- 11
ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT now();
-- 12
INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
  VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);
-- 13
INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');
-- 14
SELECT title
FROM tasks
WHERE completed_at IS NULL;
--15
UPDATE tasks
SET completed_at = now()
WHERE id = 1;
-- 16
SELECT title, description
FROM tasks
WHERE completed_at IS NULL;
-- 17
SELECT *
FROM tasks
ORDER BY created_at DESC;
--18
INSERT INTO tasks (title, description)
  VALUES ('mistake 1', 'a test entry');
--19
INSERT INTO tasks (title, description)
  VALUES ('mistake 2', 'another test entry');
--20
INSERT INTO tasks (title, description)
  VALUES ('third mistake', 'another test entry');
--21
SELECT title
FROM tasks
WHERE title LIKE '%mistake%';
--22
DELETE
FROM tasks
WHERE title = 'mistake 1';
--23
SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';
--24
DELETE
FROM tasks
WHERE title LIKE '%mistake%';
--25
SELECT *
FROM tasks
ORDER BY title;

\c kevinyogi