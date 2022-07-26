--Subqueries in Having
SELECT s.sport_name,
COUNT(e.id)
FROM sport s
INNER JOIN event e ON e.sport_id = s.id
GROUP BY s.sport_name
ORDER BY COUNT(e.id);

SELECT AVG(sub.sport_count)
FROM (
	SELECT s.sport_name,
	COUNT(e.id) AS sport_count
	FROM sport s
	INNER JOIN event e ON e.sport_id = s.id
	GROUP BY s.sport_name
) sub;

SELECT s.sport_name,
COUNT(e.id)
FROM sport s
INNER JOIN event e ON e.sport_id = s.id
GROUP BY s.sport_name
HAVING COUNT(e.id) > (
	SELECT AVG(sub.sport_count)
	FROM (
		SELECT s.sport_name,
		COUNT(e.id) AS sport_count
		FROM sport s
		INNER JOIN event e ON e.sport_id = s.id
		GROUP BY s.sport_name
	) sub
);
