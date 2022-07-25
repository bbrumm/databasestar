/*
Lesson 05
Oracle
*/

CREATE VIEW interactions_view AS
SELECT id, interaction_datetime, interaction_type, person_id, notes, active
FROM interaction;

CREATE OR REPLACE TRIGGER soft_delete_interactions
INSTEAD OF DELETE ON interactions_view
FOR EACH ROW
BEGIN
	UPDATE interactions SET active = 0 WHERE id = :old.id;
END;
/

