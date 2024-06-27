CREATE TABLE employee_activity (
  employee_id NUMBER,
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  action_datetime DATE,
  action_performed VARCHAR2(20)
);


CREATE OR REPLACE TRIGGER DeleteEmployee
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO employee_activity
  (employee_id, first_name, last_name, action_datetime, action_performed)
  VALUES
  (:old.employee_id, :old.first_name, :old.last_name,
  SYSDATE, 'Deleted');
END;


SELECT *
FROM employee_activity;


SELECT *
FROM employees
ORDER BY employee_id DESC;

DELETE FROM employees
WHERE employee_id = 206;