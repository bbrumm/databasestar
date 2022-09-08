--Before Update Trigger
ALTER TABLE customer ADD updated_date DATE;

SELECT * FROM customer;


CREATE OR REPLACE TRIGGER cust_before_update
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    :new.updated_date := SYSDATE;
END;
/

UPDATE customer
SET customer_type = 'Personal'
WHERE customer_id = 4;

SELECT * FROM customer;

--Example 2

CREATE OR REPLACE TRIGGER cust_before_update
BEFORE UPDATE ON customer
DECLARE
  not_on_weekends   EXCEPTION;
  nonworking_hours  EXCEPTION;
  PRAGMA EXCEPTION_INIT (not_on_weekends, -4097);
  PRAGMA EXCEPTION_INIT (nonworking_hours, -4099);
BEGIN
   IF (TO_CHAR(SYSDATE, 'DAY') = 'SAT' OR
     TO_CHAR(SYSDATE, 'DAY') = 'SUN') THEN
       RAISE not_on_weekends;
   END IF;
 
  IF (TO_CHAR(SYSDATE, 'HH24') < 8 OR
    TO_CHAR(SYSDATE, 'HH24') > 18) THEN
      RAISE nonworking_hours;
  END IF;
 
EXCEPTION
  WHEN not_on_weekends THEN
    Raise_application_error(-20324,
    	'Employee table cannot be changed during the weekend');
  WHEN nonworking_hours THEN
    Raise_application_error(-20326,
    	'Employee table cannot be changed during nonworking hours');
END;
/

UPDATE customer
SET customer_type = 'Business'
WHERE customer_id = 2;

SELECT * FROM customer;
