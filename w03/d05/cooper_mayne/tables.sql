CREATE TABLE programmers (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  twitter_pic TEXT,
  twitter_username VARCHAR
);

ALTER TABLE programmers ADD COLUMN github_username VARCHAR;