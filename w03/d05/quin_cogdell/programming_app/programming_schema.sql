#DROP TABLE programmers;

CREATE TABLE programmers (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  twitter_pic VARCHAR,
  twitter_username VARCHAR,
  github_username VARCHAR
);
