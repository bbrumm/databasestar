/*
Lesson 07
*/

SELECT
i.id,
i.interaction_datetime,
it.interaction_name,
i.notes,
i.active
FROM interaction i
INNER JOIN interaction_type it ON i.interaction_type = i.id
WHERE i.person_id = 7
AND active = 1;


ALTER TABLE interaction
RENAME TO interactions_all;

CREATE VIEW interactions AS
SELECT id, interaction_datetime, interaction_type, person_id, notes
FROM interactions_all
WHERE active = 1;


