--Deleting data

SELECT *
FROM games_list
ORDER BY games_year;

BEGIN TRANSACTION;

--Delete all games that have a duplicate summer year, regardless of their season
DELETE FROM games_list
WHERE games_year IN (
	SELECT games_year
	FROM games_list
	WHERE season = 'Summer'
	GROUP BY games_year
	HAVING COUNT(*) > 1
);

ROLLBACK;


SELECT games_year
FROM games_list
WHERE season = 'Summer'
GROUP BY games_year
HAVING COUNT(*) > 1