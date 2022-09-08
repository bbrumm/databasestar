/*
Lesson 05
MySQL
*/

DELIMITER $$
CREATE TRIGGER soft_delete_interactions
BEFORE DELETE ON interaction
FOR EACH ROW
BEGIN
    UPDATE interaction SET active = 0 WHERE id = OLD.id;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Record not deleted';
END
$$
DELIMITER ;
