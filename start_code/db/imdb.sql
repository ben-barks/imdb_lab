DROP TABLE castings;
DROP TABLE movies;
DROP TABLE performers;

CREATE TABLE movies(
  id SERIAL2 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE performers(
  id SERIAL2 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE castings(
  id SERIAL2 PRIMARY KEY,
  movie_id INT2 REFERENCES movies(id) ON DELETE CASCADE,
  performer_id INT2 REFERENCES performers(id) ON DELETE CASCADE,
  fee INT4
);
