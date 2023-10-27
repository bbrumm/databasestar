/*
Original query
*/
SELECT
games_year,
region_name,
SUM(gold) AS gold_medals,
SUM(silver) AS silver_medals,
SUM(bronze) AS bronze_medals
FROM (
	SELECT
	g.games_year,
	r.region_name,
	CASE WHEN m.medal_name = 'Gold' THEN 1 ELSE 0 END AS gold,
	CASE WHEN m.medal_name = 'Silver' THEN 1 ELSE 0 END AS silver,
	CASE WHEN m.medal_name = 'Bronze' THEN 1 ELSE 0 END AS bronze
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
) AS sub
GROUP BY games_year, region_name;

/*
Step 1: create table
*/
CREATE TABLE medal_summary (
	games_year INTEGER,
	region_name VARCHAR(200),
	gold_medals INTEGER,
	silver_medals INTEGER,
	bronze_medals INTEGER
);

/*
Step 2: populate table
*/
INSERT INTO medal_summary
(games_year, region_name, gold_medals, silver_medals, bronze_medals)
SELECT
games_year,
region_name,
SUM(gold) AS gold_medals,
SUM(silver) AS silver_medals,
SUM(bronze) AS bronze_medals
FROM (
	SELECT
	g.games_year,
	r.region_name,
	CASE WHEN m.medal_name = 'Gold' THEN 1 ELSE 0 END AS gold,
	CASE WHEN m.medal_name = 'Silver' THEN 1 ELSE 0 END AS silver,
	CASE WHEN m.medal_name = 'Bronze' THEN 1 ELSE 0 END AS bronze
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
) AS sub
GROUP BY games_year, region_name;

/*
Step 3: new query
*/
SELECT
games_year,
region_name,
gold_medals,
silver_medals,
bronze_medals
FROM medal_summary;

