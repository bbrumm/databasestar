/*
Setup for Adjacency List model
*/

DROP TABLE emp_hierarchy;
DROP TABLE emp_nested;

CREATE TABLE emp_hierarchy (
id NUMBER(5),
first_name VARCHAR2(100),
manager_id NUMBER(5)
);

INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (1, 'John', 3);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (2, 'Sally', 4);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (3, 'Mark', 12);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (4, 'Michelle', 8);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (5, 'Peter', 4);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (6, 'Leanne', 4);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (7, 'Steve', 3);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (8, 'Ian', null);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (9, 'Paula', 8);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (10, 'Ryan', 8);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (11, 'Edward', 9);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (12, 'Andrea', 9);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (13, 'Vivian', 6);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (14, 'Charles', 6);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (15, 'Mary', 5);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (16, 'James', 8);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (17, 'Luke', 6);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (18, 'Brad', 10);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (19, 'David', 10);
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (20, 'Gina', 12);

/*
Select the entire tree
How can I show the parent's first_name?
*/
SELECT
id,
first_name,
manager_id
FROM emp_hierarchy
START WITH manager_id IS NULL
CONNECT BY PRIOR id = manager_id;


/*
Find all children of a node
*/
SELECT id,
first_name,
manager_id
FROM emp_hierarchy
CONNECT BY PRIOR id = manager_id
START WITH id = 9;

/*
Find the path to the root node
*/
SELECT id,
first_name,
manager_id,
SYS_CONNECT_BY_PATH(first_name, '/') AS rootpath
FROM emp_hierarchy
START WITH manager_id IS NULL
CONNECT BY PRIOR id = manager_id;



/*
Find the level of all nodes
*/
SELECT
id,
first_name,
manager_id,
LEVEL
FROM emp_hierarchy
START WITH manager_id IS NULL
CONNECT BY PRIOR id = manager_id;

/*
Format output
*/
SELECT
id,
LPAD(' ', LEVEL * 2)||first_name AS first_name,
manager_id,
LEVEL
FROM emp_hierarchy
START WITH manager_id IS NULL
CONNECT BY PRIOR id = manager_id;

/*
Add a node
*/
INSERT INTO emp_hierarchy (id, first_name, manager_id) VALUES (21, 'Stephen', 5);


/*
Delete a node
*/


--Find the manager for the deleted record
SELECT
id,
first_name,
manager_id
FROM emp_hierarchy
WHERE id = 6;

--Find all people with the manager_id of the record to delete

SELECT
id,
first_name,
manager_id
FROM emp_hierarchy
WHERE manager_id = 6;

--Update those records
UPDATE emp_hierarchy
SET manager_id = 4
WHERE manager_id = 6;

--Delete the record
DELETE FROM emp_hierarchy
WHERE id = 6;


/*
Update a node
*/
UPDATE emp_hierarchy
SET manager_id = 2
WHERE id = 13;


/*
Setup for Nested Sets model
*/
CREATE TABLE emp_nested (
id NUMBER(5),
first_name VARCHAR2(100),
set_left NUMBER(10),
set_right NUMBER(10)
);


INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (1, 'John', 23, 24);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (2, 'Sally', 3, 4);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (3, 'Mark', 22, 27);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (4, 'Michelle', 2, 17);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (5, 'Peter', 5, 8);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (6, 'Leanne', 9, 16);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (7, 'Steve', 25, 26);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (8, 'Ian', 1, 40);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (9, 'Paula', 18, 31);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (10, 'Ryan', 32, 37);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (11, 'Edward', 19, 20);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (12, 'Andrea', 21, 39);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (13, 'Vivian', 10, 11);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (14, 'Charles', 12, 13);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (15, 'Mary', 6, 7);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (16, 'James', 38, 39);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (17, 'Luke', 14, 15);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (18, 'Brad', 33, 34);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (19, 'David', 35, 36);
INSERT INTO emp_nested (id, first_name, set_left, set_right) VALUES (20, 'Gina', 28, 29);

/*
Select the entire tree
*/


SELECT
emp.id,
emp.first_name
FROM emp_nested emp
INNER JOIN emp_nested mgr 
	ON emp.set_left BETWEEN mgr.set_left AND mgr.set_right
WHERE mgr.first_name = 'Ian'
;



/*
Find all children of a node
*/


SELECT
emp.id,
emp.first_name,
emp.set_left
FROM emp_nested emp
INNER JOIN emp_nested mgr 
	ON emp.set_left BETWEEN mgr.set_left AND mgr.set_right
WHERE mgr.id = 9
ORDER BY mgr.set_left;



/*
Find the level of all nodes
*/



SELECT
emp.set_left,
emp.first_name,
(COUNT(mgr.id) - 1) AS depth
FROM emp_nested emp
INNER JOIN emp_nested mgr 
	ON emp.set_left BETWEEN mgr.set_left AND mgr.set_right
GROUP BY emp.set_left, emp.first_name
ORDER BY emp.set_left, emp.first_name;

/*
Adding a node
*/
SELECT set_right
FROM emp_nested
WHERE id = 15;

UPDATE emp_nested
SET set_right = set_right + 2
WHERE set_right > 7;

UPDATE emp_nested
SET set_left = set_left + 2
WHERE set_left > 7;

INSERT INTO emp_nested(id, first_name, set_left, set_right)
VALUES (21, 'Stephen', 8, 9);


/*
Delete a node
*/

SELECT
set_left,
set_right
FROM emp_nested
WHERE id = 6;

DELETE FROM emp_nested
WHERE id = 6;

UPDATE emp_nested
SET set_right = set_right - (19-6+1)
WHERE set_right > 19;

UPDATE emp_nested
SET set_left = set_left - (19-6+1)
WHERE set_left > 19;


/*
Update a node
*/
SELECT set_left
FROM emp_nested
WHERE id = 2;

UPDATE emp_nested
SET set_left = 2 + 1,
set_right = 2 + 2
WHERE id = 13;

UPDATE emp_nested
SET set_right = set_right + 2
WHERE set_right > 5;

UPDATE emp_nested
SET set_left = set_left + 2
WHERE set_left > 5;




