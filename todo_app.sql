DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id            SERIAL PRIMARY KEY NOT NULL,
  title         varchar(255) NOT NULL,
  description   text         NULL,
  created_at    timestamp    NOT NULL DEFAULT now(),
  updated_at    timestamp    NULL,
  completed     boolean      NOT NULL DEFAULT false
);

ALTER TABLE tasks
  DROP COLUMN IF EXISTS completed;

ALTER TABLE tasks
  ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

