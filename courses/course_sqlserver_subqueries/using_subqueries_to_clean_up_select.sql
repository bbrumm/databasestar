--Using subqueries to clean up SELECT

--Medal count per country
SELECT
n.noc,
n.region_name,
COUNT(DISTINCT p.id) AS person_count,
COUNT(ce.medal_id) AS medal_count
FROM noc_region n
INNER JOIN person_region pr ON pr.region_id = n.id
INNER JOIN person p ON p.id = pr.person_id
INNER JOIN games_competitor gc ON gc.person_id = p.id
INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
INNER JOIN medal m ON m.id = ce.medal_id
WHERE m.medal_name IN ('Gold', 'Silver', 'Bronze')
GROUP BY n.noc, n.region_name;

--Inside subquery
SELECT
noc,
region_name,
person_count,
medal_count,
ROUND(medal_count / person_count, 2) AS mpp2
FROM (
	SELECT
	n.noc,
	n.region_name,
	CAST(COUNT(DISTINCT p.id) AS DECIMAL(10,0)) AS person_count,
	CAST(COUNT(ce.medal_id) AS DECIMAL(10,0)) AS medal_count
	FROM noc_region n
	INNER JOIN person_region pr ON pr.region_id = n.id
	INNER JOIN person p ON p.id = pr.person_id
	INNER JOIN games_competitor gc ON gc.person_id = p.id
	INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
	INNER JOIN medal m ON m.id = ce.medal_id
	WHERE m.medal_name IN ('Gold', 'Silver', 'Bronze')
	GROUP BY n.noc, n.region_name
) sub;


--CAST(medal_count / person_count AS NUMERIC(10,2)) AS mpp,
--ROUND(CAST(medal_count AS NUMERIC(6,2)) / CAST(person_count AS NUMERIC(6,2)), 2) AS medals_per_person,
--CAST(medal_count AS NUMERIC(10,2)) / CAST(person_count AS NUMERIC(10,2)) AS medals_per_person2
--medal_count / person_count AS mpp,
