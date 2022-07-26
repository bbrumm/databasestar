--Create View with Multiple Tables

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

--Example 2
CREATE VIEW sport_details AS
SELECT
s.id AS sport_id,
e.id AS event_id,
s.sport_name,
e.event_name
FROM event e
INNER JOIN sport s ON e.sport_id = s.id;
