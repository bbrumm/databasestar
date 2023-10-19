SELECT DISTINCT
p.id AS person_id,
p.full_name AS full_name,
g.games_year,
e.event_name,
m.medal_name
FROM olympics.person p
INNER JOIN olympics.person_region pr ON p.id = pr.person_id
INNER JOIN olympics.noc_region r ON pr.region_id = r.id
INNER JOIN olympics.games_competitor gc ON p.id = gc.person_id
INNER JOIN olympics.games g ON gc.games_id = g.id
INNER JOIN olympics.competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN olympics.medal m ON ce.medal_id = m.id
INNER JOIN olympics.event e ON ce.event_id = e.id
INNER JOIN olympics.sport s ON e.sport_id = s.id
WHERE g.season = 'Summer'
AND s.sport_name = 'Swimming'
ORDER BY p.full_name ASC;
