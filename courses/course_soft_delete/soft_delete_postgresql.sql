--Create

CREATE TABLE interaction_type (
  id INTEGER,
  interaction_name CHARACTER VARYING(100),
  CONSTRAINT pk_interactiontype PRIMARY KEY (id)
);

CREATE TABLE interaction (
  id INTEGER,
  interaction_datetime DATE,
  interaction_type INTEGER,
  person_id INTEGER,
  notes CHARACTER VARYING(500),
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
VALUES (1, '2021-03-18', 1, 1, 'First contact');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (2, '2021-03-19', 2, 1, 'Met with the person');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (3, '2021-03-25', 2, 2, 'Quick meeting');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (4, '2021-03-28', 3, 1, 'Email received');
INSERT INTO interaction (id, interaction_datetime, interaction_type, person_id, notes)
VALUES (5, '2021-03-29', 3, 2, 'Email sent to them');


--Alter
ALTER TABLE interaction
ADD active INTEGER(1);

--Update
UPDATE interaction
SET active = 1;

--Trigger
CREATE OR REPLACE RULE delete_interactions AS
  ON DELETE TO interactions
  DO INSTEAD
    UPDATE interactions
    SET active = 0
    WHERE interactions.id = old.id;


--Procedure
CREATE FUNCTION delete_interactions
(idToDelete INT)
RETURNS void AS $$
BEGIN
  UPDATE interactions
  SET active = 0
  WHERE id = idToDelete
END
$$ LANGUAGE plpgsql;
