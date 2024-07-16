CREATE OR REPLACE TRIGGER InsertEmployee
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO employee_activity
  (employee_id, first_name, last_name, action_datetime, action_performed)
  VALUES
  (:new.employee_id, :new.first_name, :new.last_name,
  SYSDATE, 'Inserted');
END;

SELECT *
FROM employees
ORDER BY employee_id DESC;


INSERT INTO employees
(employee_id, first_name, last_name, email, phone_number,
hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
(employees_seq.nextval, 'John', 'Smith', 'JSMITH', NULL,
SYSDATE, 'SH_CLERK', 5000, NULL, NULL, 50);

SELECT *
FROM employee_activity;