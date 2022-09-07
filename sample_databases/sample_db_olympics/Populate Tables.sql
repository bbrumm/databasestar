#CREATE DATABASE olympics;
#USE olympics;

#SELECT * FROM athlete_events;

#Populate sport table
INSERT INTO sport (sport_name)
SELECT
TRIM(SUBSTRING(event, 1, INSTR(event, ' Men')))
FROM athlete_events
WHERE event LIKE '% Men%'
UNION
SELECT
TRIM(SUBSTRING(event, 1, INSTR(event, ' Women')))
FROM athlete_events
WHERE event LIKE '% Women%'
UNION
SELECT
TRIM(SUBSTRING(event, 1, INSTR(event, ' Mixed')))
FROM athlete_events
WHERE event LIKE '% Mixed%'
ORDER BY 1 ASC;

#ALTER TABLE athlete_events ADD COLUMN sport_name VARCHAR(200);

#UPDATE athlete_events SET sport_name = TRIM(SUBSTRING(event, 1, INSTR(event, ' Men'))) WHERE event LIKE '% Men%';
#UPDATE athlete_events SET sport_name = TRIM(SUBSTRING(event, 1, INSTR(event, ' Women'))) WHERE event LIKE '% Women%';
#UPDATE athlete_events SET sport_name = TRIM(SUBSTRING(event, 1, INSTR(event, ' Mixed'))) WHERE event LIKE '% Mixed%';

#Populate event table
INSERT INTO event (sport_id, event_name)
SELECT DISTINCT s.id, e.event
FROM athlete_events e
INNER JOIN sport s ON e.sport_name = s.sport_name;


#Populate city
INSERT INTO city (city_name)
SELECT DISTINCT city
FROM athlete_events;

#Populate games
INSERT INTO games (games_year, games_name, season)
SELECT DISTINCT e.year, 
e.games, 
e.season
FROM athlete_events e;


#Populate games_city
INSERT INTO games_city (games_id, city_id)
SELECT DISTINCT g.id,
c.id
FROM athlete_events e
INNER JOIN games g ON e.games = g.games_name
INNER JOIN city c ON e.city = c.city_name;



#Populate noc_region
INSERT INTO noc_region (noc, region_name)
SELECT noc,
CASE WHEN notes = '' THEN region ELSE notes END AS region_name
FROM noc_regions;

UPDATE noc_region SET region_name = 'West Germany' WHERE noc = 'FRG';
UPDATE noc_region SET region_name = 'East Germany' WHERE noc = 'GDR';
UPDATE noc_region SET region_name = 'Saar' WHERE noc = 'SAA';
UPDATE noc_region SET region_name = 'Unified Team' WHERE noc = 'EUN';
UPDATE noc_region SET region_name = 'Soviet Union' WHERE noc = 'URS';
UPDATE noc_region SET region_name = 'Czechoslovakia' WHERE noc = 'TCH';
UPDATE noc_region SET region_name = 'Vietnam (pre)' WHERE noc = 'VNM';
UPDATE noc_region SET region_name = 'Zimbabwe (Rhodesia)' WHERE noc = 'RHO';
UPDATE noc_region SET region_name = 'Malaya' WHERE noc = 'MAL';

INSERT INTO noc_region (noc, region_name) VALUES ('SGP', 'Singapore');

#Populate medal
INSERT INTO medal (id, medal_name) VALUES
(1, 'Gold'), (2, 'Silver'), (3, 'Bronze'), (4, 'NA');


#Populate person
#Question: what unit is height and weight in? KG and CM
#Question: does height and weight change between each olympic games for the same person? If so, they may need to be moved to the games_competitor table. 
#Answer: no, it is unique for each person.
#Note: we are inserting the ID in this query, because the source data uses it as a person identifier
#A person may have one or two NOCs, meaning they changed the country they competed for.
INSERT INTO person (id, full_name, gender, height, weight)
SELECT DISTINCT
e.id,
TRIM(e.name),
e.sex,
CASE WHEN e.height = 'NA' THEN 0 ELSE e.height END AS height,
CASE WHEN e.weight = 'NA' THEN 0 ELSE e.weight END AS weight
FROM athlete_events e
INNER JOIN noc_region r ON e.noc = r.noc;

#Populate person_region
INSERT INTO person_region (person_id, region_id)
SELECT DISTINCT
e.id,
r.id
FROM athlete_events e
INNER JOIN noc_region r ON e.noc = r.noc;


#Populate games_competitor
INSERT INTO games_competitor (games_id, person_id, age)
SELECT DISTINCT
g.id AS games_id,
e.id AS person_id,
e.age
FROM athlete_events e
INNER JOIN games g ON e.games = g.games_name;


#Populate competitor_event
INSERT INTO competitor_event (event_id, competitor_id, medal_id)
SELECT
e.id AS event_id,
gc.id AS competitor_id,
m.id AS medal_id
FROM athlete_events ae
INNER JOIN event e ON ae.event = e.event_name
INNER JOIN games g ON g.games_year = ae.year AND g.games_name = ae.games
INNER JOIN person p ON ae.id = p.id
INNER JOIN games_competitor gc ON p.id = gc.person_id AND g.id = gc.games_id
INNER JOIN medal m ON m.medal_name = ae.medal;

COMMIT;

