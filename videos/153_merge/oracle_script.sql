/*
Merge in Oracle
*/

DROP TABLE customer;
DROP TABLE customer_import;

DELETE FROM customer;
DELETE FROM customer_import;

CREATE TABLE customer (
  customer_id NUMBER,
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  email_address VARCHAR2(350),
  is_active NUMBER
);


CREATE TABLE customer_import (
  customer_id NUMBER,
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  email_address VARCHAR2(350)
);

INSERT INTO customer (customer_id, first_name, last_name, email_address, is_active)
VALUES (1, 'John', 'Smith', 'johnsmith@abc.com', 1);
INSERT INTO customer (customer_id, first_name, last_name, email_address, is_active)
VALUES (2, 'Sarah', 'Jones', 'sj@test.com', 1);
INSERT INTO customer (customer_id, first_name, last_name, email_address, is_active)
VALUES (3, 'Michael', 'Crawford', 'mcrawford@apple.com', 0);
INSERT INTO customer (customer_id, first_name, last_name, email_address, is_active)
VALUES (4, 'Claire', 'Johnson', 'c.johnson@someplace.co.uk', 1);
INSERT INTO customer (customer_id, first_name, last_name, email_address, is_active)
VALUES (5, 'Steve', 'Jones', 'steve.jones@abc.com.au', 0);
INSERT INTO customer (customer_id, first_name, last_name, email_address, is_active)
VALUES (6, 'John', 'McDonald', 'mcdonald.john@abc.com', 1);

INSERT INTO customer_import (customer_id, first_name, last_name, email_address)
VALUES (1, 'John', 'Smith', 'jsmith@samsung.com');
INSERT INTO customer_import (customer_id, first_name, last_name, email_address)
VALUES (5, 'Josh', 'Amber', 'josh@xyz.com');
INSERT INTO customer_import (customer_id, first_name, last_name, email_address)
VALUES (4, 'Claire', 'Jones', 'c.johnson@someplace.co.uk');
INSERT INTO customer_import (customer_id, first_name, last_name, email_address)
VALUES (9, 'Andrew', 'Brown', 'andrew.brown.2@grand.com');
INSERT INTO customer_import (customer_id, first_name, last_name, email_address)
VALUES (15, 'Frances', 'McDonald', 'fmcd@amazing.com');


SELECT * FROM customer;
SELECT * FROM customer_import;

/*
Merge statement
*/

MERGE INTO customer c
USING customer_import i
ON (c.customer_id = i.customer_id)
WHEN MATCHED THEN
  UPDATE SET c.first_name = i.first_name,
  c.last_name = i.last_name,
  c.email_address = i.email_address
WHEN NOT MATCHED THEN
  INSERT (customer_id, first_name, last_name, email_address, is_active)
  VALUES (i.customer_id, i.first_name, i.last_name, i.email_address, 1);


/*
Match on first name as well
*/

MERGE INTO customer c
USING customer_import i
ON c.customer_id = i.customer_id AND c.first_name = i.first_name
WHEN MATCHED THEN
  UPDATE SET first_name = i.first_name,
  last_name = i.last_name,
  email_address = i.email_address
WHEN NOT MATCHED THEN
  INSERT (customer_id, first_name, last_name, email_address, is_active)
  VALUES (i.customer_id, i.first_name, i.last_name, i.email_address, 1);
