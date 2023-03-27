/*
Lesson 05
Oracle
*/

CREATE VIEW interaction_view AS
SELECT id, interaction_datetime, interaction_type, person_id, notes, active
FROM interaction;

CREATE OR REPLACE TRIGGER soft_delete_interaction
INSTEAD OF DELETE ON interaction_view
FOR EACH ROW
BEGIN
	UPDATE interaction SET active = 0 WHERE id = :old.id;
END;
/

