/*
Sample scripts used in my SQL Wildcard post.
Post here: https://www.databasestar.com/sql-wildcards/
*/

CREATE TABLE customer (
  id INT,
  name VARCHAR(50),
  limit INT
);

INSERT INTO customer (id, name, limit)
VALUES (1, 'Smith', 2000);
INSERT INTO customer (id, name, limit)
VALUES (2, 'Johnson', 4000);
INSERT INTO customer (id, name, limit)
VALUES (3, 'Anderson', 5000);
INSERT INTO customer (id, name, limit)
VALUES (4, 'Wallace', 1500);
INSERT INTO customer (id, name, limit)
VALUES (5, 'Soren', 800);

