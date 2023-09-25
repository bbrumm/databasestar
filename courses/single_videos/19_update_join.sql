/*
Create test data
*/
DROP TABLE tableup1;
DROP TABLE tableup2;

CREATE TABLE tableup1 (
id NUMBER,
amount NUMBER,
category VARCHAR2(2)
);

CREATE TABLE tableup2 (
id NUMBER,
amount NUMBER,
category VARCHAR2(2),
code NUMBER
);

DELETE FROM tableup1;
DELETE FROM tableup2;


INSERT INTO tableup1(id, amount, category) VALUES (1, 855, 'L');
INSERT INTO tableup1(id, amount, category) VALUES (2, 317, 'M');
INSERT INTO tableup1(id, amount, category) VALUES (3, 276, 'R');
INSERT INTO tableup1(id, amount, category) VALUES (4, 727, 'L');
INSERT INTO tableup1(id, amount, category) VALUES (5, 761, 'M');
INSERT INTO tableup1(id, amount, category) VALUES (6, 765, 'R');
INSERT INTO tableup1(id, amount, category) VALUES (7, 141, 'E');
INSERT INTO tableup1(id, amount, category) VALUES (8, 566, 'L');
INSERT INTO tableup1(id, amount, category) VALUES (9, 417, 'L');
INSERT INTO tableup1(id, amount, category) VALUES (10, 345, 'R');


INSERT INTO tableup2(id, amount, category, code) VALUES (1, 1000, 'R', 1);
INSERT INTO tableup2(id, amount, category, code) VALUES (2, 2000, 'L', 3);
INSERT INTO tableup2(id, amount, category, code) VALUES (3, 3000, 'M', 2);
INSERT INTO tableup2(id, amount, category, code) VALUES (4, 4000, 'E', 1);
INSERT INTO tableup2(id, amount, category, code) VALUES (5, 5000, 'S', 2);
INSERT INTO tableup2(id, amount, category, code) VALUES (6, 6000, 'T', 3);

SELECT * FROM tableup1;
SELECT * FROM tableup2;

--Error with query:
UPDATE tableup1
INNER JOIN tableup2 ON tableup1.category = tableup2.category
SET tableup1.amount = tableup2.amount
WHERE tableup1.category='L';

--Solution 1
            
UPDATE tableup1
SET tableup1.amount = (
    SELECT tableup2.amount
    FROM tableup2 
    WHERE tableup1.category = tableup2.category)
WHERE tableup1.category='L'
AND EXISTS (
    SELECT tableup2.amount
    FROM tableup2 
    WHERE tableup1.category = tableup2.category);


SELECT *
FROM tableup1;


--Solution 2

UPDATE 
(SELECT 
tableup1.amount as OLD,
tableup2.amount as NEW
 FROM tableup1
 INNER JOIN tableup2
 ON tableup1.category = tableup2.category
 WHERE tableup1.category='L'
) t
SET t.OLD = t.NEW;

--ORA-01779, because the view is not updateable

--You can see what the updates will be by using the SELECT
SELECT 
tableup1.amount as OLD,
tableup2.amount as NEW
 FROM tableup1
 INNER JOIN tableup2
 ON tableup1.category = tableup2.category
 WHERE tableup1.category='L';


SELECT *
FROM tableup1;

