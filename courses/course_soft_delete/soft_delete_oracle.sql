--Create

CREATE TABLE interaction_type (
  id NUMBER,
  interaction_name VARCHAR2(100),
  CONSTRAINT pk_interactiontype PRIMARY KEY (id)
);

CREATE TABLE interaction (
  id NUMBER,
  interaction_datetime DATE,
  interaction_type NUMBER,
  person_id NUMBER,
  notes VARCHAR2(500),
  CONSTRAINT pk_interaction PRIMARY KEY (id),
  CONSTRAINT fk_int_inttype FOREIGN KEY (interaction_type) REFERENCES interaction_type (id)
);


--Insert
INSERT INTO interaction_type (id, interaction_name)
VALUES (1, 'Phone call');
INSERT INTO interaction_type (id, interaction_name)
VALUES (2, 'Meeting');
INSERT INTO interaction_type (id, interaction_name)
VALUES (3, 'Email');

INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (1, TO_DATE('2021-03-18', 'YYYY-MM-DD'), 1, 1, 'First contact');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (2, TO_DATE('2021-03-19', 'YYYY-MM-DD'), 2, 1, 'Met with the person');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (3, TO_DATE('2021-03-25', 'YYYY-MM-DD'), 2, 2, 'Quick meeting');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (4, TO_DATE('2021-03-28', 'YYYY-MM-DD'), 3, 1, 'Email received');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (5, TO_DATE('2021-03-29', 'YYYY-MM-DD'), 3, 2, 'Email sent to them');


--Alter
ALTER TABLE interaction
ADD active NUMBER(1);

--Update
UPDATE interaction
SET active = 1;

--Trigger
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


--Procedure
CREATE PROCEDURE delete_interaction
(idToDelete NUMBER) IS
BEGIN
  UPDATE interaction
  SET active = 0
  WHERE id = idToDelete;
END;
