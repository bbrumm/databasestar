ALTER TABLE employees
ADD is_active NUMBER DEFAULT 1;

UPDATE employees
SET is_active = 1;

SELECT *
FROM employees
ORDER BY employee_id DESC;



CREATE OR REPLACE TRIGGER DeleteEmployee
INSTEAD OF DELETE ON employees
FOR EACH ROW
BEGIN
  :new.is_active := 0;
END;
