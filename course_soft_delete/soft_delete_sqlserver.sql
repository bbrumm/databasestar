--Create

CREATE TABLE interaction_type (
  id INT,
  interaction_name VARCHAR(100),
  CONSTRAINT pk_interactiontype PRIMARY KEY (id)
);

CREATE TABLE interaction (
  id INT,
  interaction_datetime DATE,
  interaction_type INT,
  person_id INT,
  notes VARCHAR(500),
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
ADD active INT(1);

--Update
UPDATE interaction
SET active = 1;

--Trigger
CREATE OR ALTER TRIGGER soft_delete_interactions ON interactions
  INSTEAD OF DELETE AS
BEGIN
  SET NOCOUNT ON;
  UPDATE interactions
  SET active = 0
  WHERE id IN (
    SELECT id FROM deleted
  );
END
GO

--Procedure

CREATE PROCEDURE delete_interactions
@idToDelete INT
AS
  UPDATE interactions
  SET active = 0
  WHERE id = @idToDelete;
