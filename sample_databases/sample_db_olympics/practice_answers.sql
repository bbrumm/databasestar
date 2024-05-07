/*
Answers to the practice questions for the Olympics database
*/

/*
Question 1
*/

SELECT
p.id,
p.full_name,
COUNT(*) AS medal_count
FROM person p
INNER JOIN games_competitor gc ON p.id = gc.person_id
INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN medal m ON ce.medal_id = m.id
WHERE medal_name = 'Gold'
GROUP BY p.id, p.full_name
ORDER BY COUNT(*) DESC;

/*
Question 2
*/

SELECT
p.id AS person_id,
p.full_name,
g.games_year,
g.season,
COUNT(*) AS medal_count
FROM person p
INNER JOIN games_competitor gc ON p.id = gc.person_id
INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN games g ON gc.games_id = g.id
INNER JOIN medal m ON ce.medal_id = m.id
WHERE medal_name != 'NA'
GROUP BY p.id, p.full_name, g.games_year, g.season
ORDER BY COUNT(*) DESC;


/*
Question 3
*/

SELECT
n.id,
n.noc,
n.region_name,
COUNT(*) AS medal_count
FROM person p
INNER JOIN games_competitor gc ON p.id = gc.person_id
INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN games g ON gc.games_id = g.id
INNER JOIN medal m ON ce.medal_id = m.id
INNER JOIN person_region pr ON pr.person_id = p.id
INNER JOIN noc_region n ON n.id = pr.region_id
WHERE medal_name != 'NA'
GROUP BY n.id, n.noc, n.region_name
ORDER BY COUNT(*) DESC;


/*
Question 4
*/

SELECT
n.id,
n.noc,
n.region_name,
g.games_year,
g.season,
COUNT(*) AS medal_count
FROM person p
INNER JOIN games_competitor gc ON p.id = gc.person_id
INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN games g ON gc.games_id = g.id
INNER JOIN medal m ON ce.medal_id = m.id
INNER JOIN person_region pr ON pr.person_id = p.id
INNER JOIN noc_region n ON n.id = pr.region_id
WHERE medal_name != 'NA'
GROUP BY n.id, n.noc, n.region_name, g.games_year, g.season
ORDER BY COUNT(*) DESC;

/*
Question 5
*/


SELECT DISTINCT
e.id,
e.event_name,
COUNT(DISTINCT g.id) AS appearances
FROM event e
INNER JOIN competitor_event ce ON e.id = ce.event_id
INNER JOIN games_competitor gc ON ce.competitor_id = gc.id
INNER JOIN games g ON gc.games_id = g.id
GROUP BY e.id, e.event_name
ORDER BY appearances DESC;

/*
Question 6
*/

#Find competitors with a medal
SELECT
p.id,
p.full_name
FROM person p
INNER JOIN games_competitor gc ON p.id = gc.person_id
INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN medal m ON ce.medal_id = m.id
WHERE medal_name IN ('Gold', 'Silver', 'Bronze')
ORDER BY p.id ASC;

#Find competitors not in this list.
SELECT
pe.id,
pe.full_name
FROM person pe
WHERE pe.id NOT IN (
	SELECT
	p.id
	FROM person p
	INNER JOIN games_competitor gc ON p.id = gc.person_id
	INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
	INNER JOIN medal m ON ce.medal_id = m.id
	WHERE medal_name IN ('Gold', 'Silver', 'Bronze')
);


/*
Question 7
*/

#Find competitors with a medal and their region
SELECT
s.person_id,
s.full_name,
COUNT(*) AS region_count
FROM (
	SELECT DISTINCT
	p.id AS person_id,
	p.full_name,
	n.region_name
	FROM person p
	INNER JOIN games_competitor gc ON p.id = gc.person_id
	INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
	INNER JOIN medal m ON ce.medal_id = m.id
	INNER JOIN person_region pr ON p.id = pr.person_id
	INNER JOIN noc_region n ON pr.region_id = n.id
	WHERE medal_name IN ('Gold', 'Silver', 'Bronze')
) s
GROUP BY s.person_id, s.full_name
ORDER BY COUNT(*) DESC;

#Find distinct
SELECT DISTINCT
p.id AS person_id,
p.full_name,
n.region_name
FROM person p
INNER JOIN games_competitor gc ON p.id = gc.person_id
INNER JOIN competitor_event ce ON gc.id = ce.competitor_id
INNER JOIN medal m ON ce.medal_id = m.id
INNER JOIN person_region pr ON p.id = pr.person_id
INNER JOIN noc_region n ON pr.region_id = n.id
WHERE medal_name IN ('Gold', 'Silver', 'Bronze')
AND p.id = 111969;

/*
Question 8
*/

SELECT
s.id,
s.sport_name,
COUNT(*) AS medal_count
FROM sport s
INNER JOIN event e ON s.id = e.sport_id
INNER JOIN competitor_event ce ON e.id = ce.event_id
INNER JOIN medal m ON ce.medal_id = m.id
WHERE m.medal_name != 'NA'
GROUP BY s.id, s.sport_name
ORDER BY COUNT(*) DESC;

/*
Question 9
*/

#A query that works

SELECT 
n.region_name,
MIN(g.games_year) AS first_year
FROM noc_region n
INNER JOIN person_region pr ON pr.region_id = n.id
INNER JOIN person p ON pr.person_id = p.id
INNER JOIN games_competitor gc ON gc.person_id = p.id
INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
INNER JOIN medal m ON m.id = ce.medal_id
INNER JOIN games g ON gc.games_id = g.id
WHERE m.medal_name = 'Gold'
GROUP BY n.region_name
ORDER BY first_year DESC;

#Attempt at a different query

WITH region_golds AS (
	SELECT DISTINCT
    n.id AS region_id,
	n.region_name,
	g.games_year,
	g.season
	FROM noc_region n
	INNER JOIN person_region pr ON pr.region_id = n.id
	INNER JOIN person p ON pr.person_id = p.id
	INNER JOIN games_competitor gc ON gc.person_id = p.id
	INNER JOIN competitor_event ce ON ce.competitor_id = gc.id
	INNER JOIN medal m ON m.id = ce.medal_id
	INNER JOIN games g ON gc.games_id = g.id
	WHERE m.medal_name = 'Gold'
)
SELECT
n.id AS region_id,
n.region_name,
MIN(minr.games_year) AS first_year,
MAX(maxr.games_year) AS last_year
FROM noc_region n
INNER JOIN region_golds minr ON n.id = minr.region_id
INNER JOIN region_golds maxr ON n.id = maxr.region_id
GROUP BY n.id, n.region_name
ORDER BY n.id ASC;






