/*
Lesson 06
MySQL
*/

DELIMITER $$
CREATE PROCEDURE delete_interaction
(idToDelete INT)
BEGIN
  UPDATE interaction
  SET active = 0
  WHERE id = idToDelete;
END;
DELIMITER ;
