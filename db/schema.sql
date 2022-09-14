CREATE DATABASE d_and_e_db;
\c d_and_e_db

CREATE TABLE toons(
  id SERIAL PRIMARY KEY,
  name TEXT,
  d_or_e TEXT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

UNIQUE (user_id, toon_id);