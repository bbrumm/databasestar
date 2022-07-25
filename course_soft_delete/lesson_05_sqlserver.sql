/*
Lesson 05
SQL Server
*/

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
