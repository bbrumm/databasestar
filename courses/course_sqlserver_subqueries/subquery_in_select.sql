SELECT
no.noc,
no.region_name,
	(SELECT
	COUNT(ce.medal_id) AS medal_count
	FROM noc_region n
	INNER JOIN person_region pr ON pr.region_id = n.id
	INNER JOIN person p ON p.id = pr.person_id
	INNER JOIN games_competitor gc ON gc.person_id = p.id
	INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
	INNER JOIN medal m ON m.id = ce.medal_id
	WHERE m.medal_name = 'Gold'
	AND n.id = no.id) AS gold_medals,

	(SELECT
	COUNT(ce.medal_id) AS medal_count
	FROM noc_region n
	INNER JOIN person_region pr ON pr.region_id = n.id
	INNER JOIN person p ON p.id = pr.person_id
	INNER JOIN games_competitor gc ON gc.person_id = p.id
	INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
	INNER JOIN medal m ON m.id = ce.medal_id
	WHERE m.medal_name = 'Silver'
	AND n.id = no.id) AS silver_medals,

	(SELECT
	COUNT(ce.medal_id) AS medal_count
	FROM noc_region n
	INNER JOIN person_region pr ON pr.region_id = n.id
	INNER JOIN person p ON p.id = pr.person_id
	INNER JOIN games_competitor gc ON gc.person_id = p.id
	INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
	INNER JOIN medal m ON m.id = ce.medal_id
	WHERE m.medal_name = 'Bronze'
	AND n.id = no.id) AS bronze_medals
FROM noc_region no
ORDER BY gold_medals DESC, silver_medals DESC, bronze_medals DESC;
;
