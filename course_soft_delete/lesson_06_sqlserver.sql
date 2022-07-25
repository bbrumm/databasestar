/*
Lesson 06
SQL Server
*/

CREATE PROCEDURE delete_interaction
@idToDelete INT
AS
BEGIN
  UPDATE interaction
  SET active = 0
  WHERE id = @idToDelete;
END;
