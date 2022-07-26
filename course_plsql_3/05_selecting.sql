/*
Lesson 05
*/

DROP TABLE customer;
CREATE TABLE customer (
  id NUMBER(10),
  customer_name VARCHAR2(50)
);

INSERT INTO customer (id, customer_name) VALUES (1, 'Lisa');
INSERT INTO customer (id, customer_name) VALUES (2, 'Mark');
INSERT INTO customer (id, customer_name) VALUES (3, 'Matthew');
INSERT INTO customer (id, customer_name) VALUES (4, 'Sarah');
INSERT INTO customer (id, customer_name) VALUES (5, 'Mark');

SELECT id, customer_name
FROM customer;


CREATE OR REPLACE PROCEDURE select_customer
(custName VARCHAR2)
AS
BEGIN
  SELECT id
  FROM customer
  WHERE customer_name = custName;
END;



CREATE OR REPLACE PROCEDURE select_customer
(custName VARCHAR2)
AS
  custID NUMBER(10);
BEGIN
  SELECT id
  INTO custID
  FROM customer
  WHERE customer_name = custName;
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || custID);
END;



CALL select_customer('Sarah');

CALL select_customer('Mark');