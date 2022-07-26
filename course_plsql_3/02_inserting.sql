/*
Lesson 02
*/

CREATE TABLE customer (
  customer_name VARCHAR2(50)
);



CREATE OR REPLACE PROCEDURE insert_customer
(newCustName VARCHAR2)
AS
BEGIN
  INSERT INTO customer (customer_name)
  VALUES (newCustName);
END;


CALL insert_customer('David');

SELECT customer_name
FROM customer;


CREATE OR REPLACE PROCEDURE insert_customer
(newCustName VARCHAR2)
AS
BEGIN
  INSERT INTO customer (customer_name)
  VALUES (newCustName);
  DBMS_OUTPUT.PUT_LINE('Rows inserted: ' || sql%rowcount);
END;


CALL insert_customer('Lisa');

SELECT customer_name
FROM customer;
