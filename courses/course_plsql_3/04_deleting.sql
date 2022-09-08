/*
Lesson 04
*/

CREATE OR REPLACE PROCEDURE delete_customer
(custName VARCHAR2)
AS
BEGIN
  DELETE FROM customer
  WHERE customer_name = custName;
END;


CALL delete_customer('Mark');



CREATE OR REPLACE PROCEDURE delete_customer
(custName VARCHAR2)
AS
BEGIN
  DELETE FROM customer
  WHERE customer_name = custName;
  DBMS_OUTPUT.PUT_LINE('Rows deleted: ' || sql%rowcount);
END;


CALL delete_customer('Mark');


CREATE OR REPLACE PROCEDURE delete_customer
(custName VARCHAR2)
AS
BEGIN
  DELETE FROM customer
  WHERE customer_name = custName;
  IF (sql%found) THEN
    DBMS_OUTPUT.PUT_LINE('Rows deleted: ' || sql%rowcount);
  END IF
END;


CALL delete_customer('Lisa');

CALL delete_customer('Tim');