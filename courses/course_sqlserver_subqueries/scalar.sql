--Scalar subquery
SELECT id, games_year, games_name, season
FROM games
WHERE games_year = (
	SELECT MAX(games_year)
	FROM games
);

SELECT *
FROM person
WHERE height = (
	SELECT MIN(height)
	FROM person
	WHERE height > 0
);