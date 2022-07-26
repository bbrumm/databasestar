--Indexed views

CREATE VIEW games_info WITH SCHEMABINDING AS
SELECT
g.id,
c.city_name,
g.games_year,
g.season
FROM city c
INNER JOIN games_city gc ON c.id = gc.city_id
INNER JOIN games g ON gc.games_id = g.id;

CREATE UNIQUE CLUSTERED INDEX idx_gi_id
ON games_info(id);

SELECT * FROM games_info;

--Second example with more data

--No index
CREATE VIEW person_with_region AS
SELECT
p.id AS person_id,
p.full_name,
p.gender,
r.noc,
r.region_name
FROM person p
INNER JOIN person_region pr ON p.id = pr.person_id
INNER JOIN noc_region r ON pr.region_id = r.id;

--With INDEX
CREATE VIEW person_with_region_index WITH SCHEMABINDING AS
SELECT
p.id AS person_id,
p.full_name,
p.gender,
r.noc,
r.region_name
FROM person p
INNER JOIN person_region pr ON p.id = pr.person_id
INNER JOIN noc_region r ON pr.region_id = r.id;

CREATE UNIQUE CLUSTERED INDEX idx_gi_id
ON person_with_region_index(person_id);

SELECT * FROM person_with_region;
SELECT * FROM person_with_region_index;
