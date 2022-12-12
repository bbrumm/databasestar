/*
Test script for MySQL Stored Proc video
*/
DROP TABLE person;

CREATE TABLE person (
	id INT,
	name VARCHAR(100),
	is_active INT
);

INSERT INTO person (id, name, is_active) VALUES
(1, 'John', 1),
(2, 'Marcia', 1),
(5, 'Richard', 0),
(7, 'Debra', 1),
(12, 'Colin', 1);