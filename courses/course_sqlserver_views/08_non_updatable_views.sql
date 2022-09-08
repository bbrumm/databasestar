--Non Updatable Views

--Earlier view:
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

--OK, one table. 0 rows because of where clause
UPDATE person_with_region
SET gender = 'F'
WHERE person_id = 200000;

--Not updatable
UPDATE person_with_region
SET gender = 'F',
noc = 'USA'
WHERE person_id = 200000;

--Aggregate function view
CREATE VIEW region_person_count AS
SELECT
r.region_name,
COUNT(p.id) AS person_count
FROM person p
INNER JOIN person_region pr ON p.id = pr.person_id
INNER JOIN noc_region r ON pr.region_id = r.id
GROUP BY r.region_name;

--Should show error
UPDATE region_person_count
SET region_name = 'France'
WHERE id = 200000;
