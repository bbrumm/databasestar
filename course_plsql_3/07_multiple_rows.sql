/*
Lesson 07
*/

CREATE OR REPLACE PROCEDURE select_customer
(custName VARCHAR2)
AS
  custID NUMBER(10);
  CURSOR c_customer IS
  SELECT id FROM customer WHERE customer_name = custName;
BEGIN
  OPEN c_customer;
  LOOP
    FETCH c_customer INTO custID;
    EXIT WHEN c_customer%notfound;
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || custID);
  END LOOP;
  CLOSE c_customer;
END;


CALL select_customer('Mark');