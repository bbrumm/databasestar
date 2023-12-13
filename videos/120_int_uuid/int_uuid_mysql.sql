/*
Performance test of using GUID vs INT for a PK
Try this on all four database vendors
*/

/*
MySQL
Create table
*/

CREATE TABLE customer_id (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE customer_uuid (
	id VARCHAR(36) NOT NULL,
	name VARCHAR(50),
	PRIMARY KEY (id)
);

/*
Insert the seed records
*/

CREATE TABLE random_rows (
    num INT
);

INSERT INTO random_rows (num)
VALUES ( rand()  );

/*
Run this statement many times.
It will insert 1 row, then 2, 4, 8, 16, etc.
Up to about 1058476
*/
INSERT INTO random_rows (num)
SELECT num * rand()
FROM random_rows; 

SELECT COUNT(*)
FROM random_rows;

/*
Create another table with many more rows
*/

CREATE TABLE random_rows_large (
    num INT
);

INSERT INTO random_rows_large (num)
SELECT num * rand()
FROM random_rows; 

INSERT INTO random_rows_large (num)
SELECT num * rand()
FROM random_rows_large; 

SELECT COUNT(*)
FROM random_rows_large;

/*
Insert 1m records
Time taken: 4.309 seconds
*/
INSERT INTO customer_id (name)
SELECT 'test'
FROM random_rows;

/*
Insert 1m records using UUID
Time taken: 7.671 seconds
*/
INSERT INTO customer_uuid(id, name)
SELECT UUID(), 'test'
FROM random_rows;

/*
Both methods using 8.3m rows
Time taken:
INT: 38.8 seconds
UUID: 57.7 seconds
*/
DELETE FROM customer_id;
DELETE FROM customer_uuid;

INSERT INTO customer_id (name)
SELECT 'test'
FROM random_rows_large;

INSERT INTO customer_uuid(id, name)
SELECT UUID(), 'test'
FROM random_rows_large;



/*
Select a single row
*/

/*
Index scan
Total cost = 1
*/

SELECT *
FROM customer_id
WHERE id = 205498;

/*
Index scan
Total cost = 1

*/
SELECT *
FROM customer_uuid
WHERE id = 'ddc0e0a4-8f07-11ee-b72a-635684945c0f';


/*
What about joins and FKs?
*/

CREATE TABLE table2_int (
	id_int INT,
	textval VARCHAR(20),
	CONSTRAINT fk_t2_int FOREIGN KEY (id_int) REFERENCES customer_id (id)
);

CREATE TABLE table2_uuid (
	id_uuid VARCHAR(36),
	textval VARCHAR(20),
	CONSTRAINT fk_t2_uuid FOREIGN KEY (id_uuid) REFERENCES customer_uuid (id)
);

CREATE INDEX idx_t2_int ON table2_int (id_int);
CREATE INDEX idx_t2_uuid ON table2_uuid (id_uuid);

INSERT INTO table2_int (id_int, textval)
SELECT
id, 'second table'
FROM customer_id;

INSERT INTO table2_uuid (id_uuid, textval)
SELECT
id, 'second table'
FROM customer_uuid;

/*
Test a join
Total cost: 1,249,438
*/

SELECT
c.name,
t.textval
FROM customer_id c
INNER JOIN table2_int t ON c.id = t.id_int;

/*
Total cost: 1,208,072
*/
SELECT
c.id,
c.name,
t.textval
FROM customer_uuid c
INNER JOIN table2_uuid t ON c.id = t.id_uuid;
