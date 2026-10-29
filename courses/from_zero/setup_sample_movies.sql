CREATE TABLE movies (
  id INT PRIMARY KEY,
  title VARCHAR(100),
  genre VARCHAR(50),
  year INT,
  rating DECIMAL(3,1),
  director VARCHAR(100)
);

INSERT INTO movies (id, title, genre, year, rating, director) VALUES
(1, 'The Shawshank Redemption', 'Drama', 1994, 9.3, 'Frank Darabont'),
(2, 'The Dark Knight', 'Action', 2008, 9.0, 'Christopher Nolan'),
(3, 'Inception', 'Action', 2010, 8.8, 'Christopher Nolan'),
(4, 'Pulp Fiction', 'Crime', 1994, 8.9, 'Quentin Tarantino'),
(5, 'Forrest Gump', 'Drama', 1994, 8.8, 'Robert Zemeckis'),
(6, 'The Matrix', 'Action', 1999, 8.7, 'The Wachowskis'),
(7, 'Goodfellas', 'Crime', 1990, 8.7, 'Martin Scorsese'),
(8, 'Interstellar', 'Sci-Fi', 2014, 8.6, 'Christopher Nolan'),
(9, 'The Silence of the Lambs', 'Thriller', 1991, 8.6, 'Jonathan Demme'),
(10, 'Schindlers List', 'Drama', 1993, 8.9, 'Steven Spielberg'),
(11, 'The Lion King', 'Animation', 1994, 8.5, 'Roger Allers'),
(12, 'Jurassic Park', 'Sci-Fi', 1993, 8.1, 'Steven Spielberg'),
(13, 'Titanic', 'Romance', 1997, 7.9, 'James Cameron'),
(14, 'The Avengers', 'Action', 2012, 8.0, 'Joss Whedon'),
(15, 'La La Land', 'Romance', 2016, 8.0, 'Damien Chazelle');