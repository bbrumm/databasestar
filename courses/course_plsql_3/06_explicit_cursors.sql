/*
Lesson 06
*/


CREATE OR REPLACE PROCEDURE select_customer
(custName VARCHAR2)
AS
  custID NUMBER(10);
  CURSOR c_customer IS
  SELECT id FROM customer WHERE customer_name = custName;
BEGIN
  OPEN c_customer;
  FETCH c_customer INTO custID;
  CLOSE c_customer;
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || custID);
END;


CALL select_customer('Lisa');