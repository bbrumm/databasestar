/*
Lesson 03
*/

CREATE OR REPLACE PROCEDURE update_customer
(oldCustName VARCHAR2, newCustName VARCHAR2)
AS
BEGIN
  UPDATE customer
  SET customer_name = newCustName
  WHERE customer_name = oldCustName;
END;


CALL update_customer('David', 'Tom');


SELECT customer_name
FROM customer;


CREATE OR REPLACE PROCEDURE update_customer
(oldCustName VARCHAR2, newCustName VARCHAR2)
AS
BEGIN
  UPDATE customer
  SET customer_name = newCustName
  WHERE customer_name = oldCustName;
  DBMS_OUTPUT.PUT_LINE('Rows updated: ' || sql%rowcount);
END;


CALL update_customer('Tom', 'Stephen');


SELECT customer_name
FROM customer;


INSERT INTO customer (customer_name)
VALUES ('Stephen');

CALL update_customer('Stephen', 'Mark');


CALL update_customer('Sam', 'Mark');


CREATE OR REPLACE PROCEDURE update_customer
(oldCustName VARCHAR2, newCustName VARCHAR2)
AS
BEGIN
  UPDATE customer
  SET customer_name = newCustName
  WHERE customer_name = oldCustName;
  IF (sql%found) THEN
    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || sql%rowcount);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No rows updated');
  END IF;
END;


CALL update_customer('Stephen', 'Mark');