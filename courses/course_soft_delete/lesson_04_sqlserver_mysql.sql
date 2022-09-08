/*
Lesson 04
SQL Server and MySQL
*/

ALTER TABLE interaction
ADD active INT(1) DEFAULT 1;

UPDATE interaction
SET active = 1;