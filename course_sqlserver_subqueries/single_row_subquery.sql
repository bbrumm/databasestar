--Single row subquery

SELECT * FROM sport;

SELECT id, event_name
FROM event
WHERE sport_id = (
	SELECT id
	FROM sport
	WHERE sport_name = 'Gymnastics'
);

--No rows
SELECT id, event_name
FROM event
WHERE sport_id = (
	SELECT id
	FROM sport
	WHERE sport_name = 'Gym'
);

