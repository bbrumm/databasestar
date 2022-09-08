--Correlated subquery
SELECT gender, AVG(height)
FROM person
GROUP BY gender;

SELECT p.id, p.full_name, p.gender, p.height, p.weight
FROM person p
WHERE p.height > (
	SELECT AVG(s.height)
	FROM person s
	WHERE s.gender = p.gender
);



--Demo 2
--Games that had the oldest competitor for the season
SELECT games_id, COUNT(*)
FROM games_competitor
GROUP BY games_id;

SELECT
g.games_year,
g.season,
gc.age,
p.full_name
FROM games_competitor gc
INNER JOIN games g ON gc.games_id = g.id
INNER JOIN person p ON gc.person_id = p.id
WHERE gc.age = (
	SELECT
	MAX(gcs.age)
	FROM games gs
	INNER JOIN games_competitor gcs ON gs.id = gcs.games_id
	WHERE gs.season = g.season
	GROUP BY gs.season
);
