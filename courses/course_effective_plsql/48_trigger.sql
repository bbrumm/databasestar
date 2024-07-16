SELECT *
FROM employees;

UPDATE employees
SET commission_pct = 0.30
WHERE employee_id = 105;


SELECT *
FROM employees
WHERE employee_id = 105;

ALTER TABLE employees
ADD updated_when DATE;

/*
Create a trigger
*/

CREATE OR REPLACE TRIGGER UpdateEmployee
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    :new.updated_when := SYSDATE;
END;