CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

ALTER TABLE kittens ADD COLUMN owner_id VARCHAR;