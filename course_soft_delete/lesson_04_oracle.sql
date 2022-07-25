/*
Lesson 04
Oracle
*/

ALTER TABLE interaction
ADD active NUMBER(1) DEFAULT 1;

UPDATE interaction
SET active = 1;