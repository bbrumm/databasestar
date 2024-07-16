SELECT COUNT(*) AS person_count
FROM olympics.person;

SELECT COUNT(*) AS person_region_count
FROM olympics.person_region;

SELECT COUNT(*) As noc_region_count
FROM olympics.noc_region;

/*
Query 1
*/

SELECT
p.id AS person_id,
p.full_name,
p.gender,
r.noc,
r.region_name
FROM olympics.person p
INNER JOIN olympics.person_region pr ON p.id = pr.person_id
INNER JOIN olympics.noc_region r ON pr.region_id = r.id
WHERE r.noc = 'ITA';

CREATE TABLE olympics.combined_person_region AS
SELECT
p.id AS person_id,
p.full_name,
p.gender,
r.noc,
r.region_name
FROM olympics.person p
INNER JOIN olympics.person_region pr ON p.id = pr.person_id
INNER JOIN olympics.noc_region r ON pr.region_id = r.id;


SELECT
person_id,
full_name,
gender,
noc,
region_name
FROM olympics.combined_person_region
WHERE noc = 'ITA';

/*
Create indexes
*/

CREATE INDEX idx_pr_person ON olympics.person_region (person_id);
CREATE INDEX idx_pr_region ON olympics.person_region (region_id);
CREATE INDEX idx_region_noc ON olympics.noc_region (noc);

CREATE INDEX idx_comb_noc ON olympics.combined_person_region (noc);