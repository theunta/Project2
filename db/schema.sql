CREATE DATABASE d_and_e_db;
\c d_and_e_db

CREATE TABLE toons(
  id SERIAL PRIMARY KEY,
  name TEXT,
  image_url TEXT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  toon_id INTEGER
);

ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE (user_id, toon_id);