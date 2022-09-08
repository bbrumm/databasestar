--Inserting data

CREATE TABLE games_list (
	city_name VARCHAR(200),
	games_year INT,
	season VARCHAR(100)
);

INSERT INTO games_list (city_name, games_year, season)
SELECT
c.city_name,
g.games_year,
g.season
FROM city c
INNER JOIN games_city gc ON gc.city_id = c.id
INNER JOIN games g ON gc.games_id = g.id;

SELECT city_name, games_year, season
FROM games_list;

