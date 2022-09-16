/*
Sample data and scripts for the "How to Update from Select in SQL" post.
*/

/*
Oracle
*/
CREATE TABLE person (
  person_id NUMBER,
  first_name VARCHAR2(100),
  account_number NUMBER
);

CREATE TABLE account (
  account_id NUMBER,
  account_number NUMBER,
  person_id NUMBER
);

INSERT INTO person (person_id, first_name)
VALUES (1, 'John');
INSERT INTO person (person_id, first_name)
VALUES (2, 'Sarah');
INSERT INTO person (person_id, first_name)
VALUES (3, 'Mark');
INSERT INTO account (account_id, account_number, person_id)
VALUES (1, 100298, 2);
INSERT INTO account (account_id, account_number, person_id)
VALUES (2, 103557, 3);
INSERT INTO account (account_id, account_number, person_id)
VALUES (3, 108956, 1);
INSERT INTO account (account_id, account_number, person_id)
VALUES (4, 109703, 4);

/*
SQL Server, MySQL
*/

CREATE TABLE person (
  person_id INT,
  first_name VARCHAR(100),
  account_number INT
);

CREATE TABLE account (
  account_id INT,
  account_number INT,
  person_id INT
);

INSERT INTO person (person_id, first_name) VALUES
(1, 'John'),
(2, 'Sarah'),
(3, 'Mark');
INSERT INTO account (account_id, account_number, person_id) VALUES
(1, 100298, 2),
(2, 103557, 3),
(3, 108956, 1),
(4, 109703, 4);

/*
Postgres
*/

CREATE TABLE person (
  person_id INTEGER,
  first_name CHARACTER VARYING(100),
  account_number INTEGER
);

CREATE TABLE account (
  account_id INTEGER,
  account_number INTEGER,
  person_id INTEGER
);

INSERT INTO person (person_id, first_name) VALUES
(1, 'John'),
(2, 'Sarah'),
(3, 'Mark');
INSERT INTO account (account_id, account_number, person_id) VALUES
(1, 100298, 2),
(2, 103557, 3),
(3, 108956, 1),
(4, 109703, 4);


/*
1 - Update with From Join
*/

UPDATE p
SET p.account_number = a.account_number
FROM person p
INNER JOIN account a
ON p.person_id = a.person_id;

/*
2 - Update with From Second Table
*/

UPDATE person
SET account_number = account.account_number
FROM account
WHERE person.person_id = account.person_id;

/*
3 – Update with Join in Update Clause
*/

UPDATE person
INNER JOIN account
ON person.person_id = account.person_id
SET person.account_number = account.account_number;

/*
4 – Update with Inline View
*/

UPDATE (
  SELECT
  p.person_id,
  p.account_number AS person_account_number,
  a.account_number
  FROM person p
  INNER JOIN account a ON p.person_id = a.person_id
) sub
SET sub.person_account_number = sub.account_number;

/*
5 – Update with Subquery
*/

UPDATE person
SET account_number = (
  SELECT account_number
  FROM account
  WHERE account.person_id = person.person_id
);

/*
6 – Update using WITH Clause
*/
WITH subquery AS (
  SELECT
  account_id,
  account_number,
  person_id
  FROM account
)
UPDATE person
SET account_number = subquery.account_number
FROM subquery
WHERE person.person_id = subquery.person_id;

/*
7 – Merge Statement
*/

MERGE INTO person p
USING account a
ON (p.person_id = a.person_id)
WHEN MATCHED THEN
  UPDATE SET p.account_number = a.account_number;