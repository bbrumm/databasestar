CREATE TABLE customer_id (
	id SERIAL NOT NULL,
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
VALUES ( RANDOM() );

/*
Run this statement many times.
It will insert 1 row, then 2, 4, 8, 16, etc.
Run this until it says 524,288 rows have been inserted,
which means the total number of rows is 1,058,476
*/
INSERT INTO random_rows (num)
SELECT num * RANDOM()
FROM random_rows; 

SELECT COUNT(*)
FROM random_rows;

/*
Insert 1m records
Time taken: 2.913 seconds
*/
INSERT INTO customer_id (name)
SELECT 'test'
FROM random_rows;

/*
Insert 1m records using UUID
Time taken: 7.140 seconds
*/
INSERT INTO customer_uuid(id, name)
SELECT gen_random_uuid(), 'test'
FROM random_rows;

/*
Select a single row
*/

/*
Index scan
Total cost = 8.44
Plan width = 9
*/

SELECT *
FROM customer_id
WHERE id = 205498;

/*
Index scan
Total cost = 8.44
Plan width = 42
Higher because the ID value is much larger
*/
SELECT *
FROM customer_uuid
WHERE id = 'd6d24673-6b2e-4d55-bcfa-cd8c956a8a01';


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
Total cost: 66,684.98
Plan width: 67
*/

SELECT
c.id,
c.name,
t.textval
FROM customer_id c
INNER JOIN table2_int t ON c.id = t.id_int;

/*
Total cost: 96,354.24
Plan width: 55
*/
SELECT
c.id,
c.name,
t.textval
FROM customer_uuid c
INNER JOIN table2_uuid t ON c.id = t.id_uuid;