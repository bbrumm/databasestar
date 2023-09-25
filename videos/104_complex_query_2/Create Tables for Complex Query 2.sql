CREATE TABLE students (
	id INT,
	name VARCHAR(100)
);

CREATE TABLE friends (
	id INT,
	friend_id INT
);

CREATE TABLE packages (
	id INT,
	salary FLOAT
);

INSERT INTO students (id, name) VALUES
(1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julia'),
(4, 'Scarlet');

INSERT INTO friends (id, friend_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 1);

INSERT INTO packages (id, salary) VALUES
(1, 15.20),
(2, 10.06),
(3, 11.55),
(4, 12.12);

SELECT * FROM packages;
SELECT * FROM friends;
SELECT * FROM students;
