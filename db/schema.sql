CREATE DATABASE d_and_e_db;
\c d_and_e_db

CREATE TABLE npc(
  id SERIAL PRIMARY KEY,
  choice TEXT,
  typeof TEXT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  d_or_e TEXT,
  profession TEXT,
  wins INTEGER,
  losses INTEGER,
  draws INTEGER
);

CREATE TABLE review(
  id SERIAL PRIMARY KEY,
  username TEXT,
  contents TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

UNIQUE (user_id);