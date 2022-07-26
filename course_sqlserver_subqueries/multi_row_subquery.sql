--Multi row subquery

SELECT *
FROM sport
WHERE sport_name LIKE '%ski%';

--Shows error
SELECT id, event_name
FROM event
WHERE sport_id = (
	SELECT id
	FROM sport
	WHERE sport_name LIKE '%ski%'
);

--Try again with IN
SELECT id, event_name
FROM event
WHERE sport_id IN (
	SELECT id
	FROM sport
	WHERE sport_name LIKE '%ski%'
);

--Example 2
SELECT *
FROM games
WHERE games_year BETWEEN 2000 AND 2009;

SELECT c.city_name
FROM city c
INNER JOIN games_city gc ON c.id = gc.city_id
WHERE games_id IN (
	SELECT id
	FROM games
	WHERE games_year BETWEEN 2000 AND 2009
);