/*
Lesson 06
Oracle
*/

CREATE PROCEDURE delete_interaction
(idToDelete NUMBER) IS
BEGIN
  UPDATE interaction
  SET active = 0
  WHERE id = idToDelete;
END;
