/*
Lesson 08
*/

CREATE OR REPLACE PROCEDURE select_customer
(custNameInput VARCHAR2)
AS
  custID NUMBER(10);
  custName VARCHAR2(50);
BEGIN
  SELECT id, customer_name
  INTO custID, custName
  FROM customer
  WHERE customer_name = custNameInput;
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || custID || ', Name: ' || custName);
END;


CALL select_customer('Lisa');


CREATE OR REPLACE PROCEDURE select_customer
(custNameInput VARCHAR2)
AS
  custID NUMBER(10);
  custName VARCHAR2(50);
  CURSOR c_customer IS
  SELECT id, customer_name FROM customer
  WHERE customer_name = custNameInput;
BEGIN
  OPEN c_customer;
  FETCH c_customer INTO custID, custName;
  CLOSE c_customer;
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || custID || ', Name: ' || custName);
END;


CALL select_customer('Matthew');


CREATE OR REPLACE PROCEDURE select_customer
(custNameInput VARCHAR2)
AS
  custID NUMBER(10);
  custName VARCHAR2(50);
  CURSOR c_customer IS
  SELECT id, customer_name FROM customer
  WHERE customer_name = custNameInput;
BEGIN
  OPEN c_customer;
  LOOP
    FETCH c_customer INTO custID, custName;
    EXIT WHEN c_customer%notfound;
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || custID || ', Name: ' || custName);
  END LOOP;
END;


CALL select_customer('Mark');