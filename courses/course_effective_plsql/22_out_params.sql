CREATE OR REPLACE PROCEDURE FindEmployeeName(
    v_employee_id IN NUMBER,
    v_first_name OUT VARCHAR
)
AS
BEGIN
  SELECT first_name
  INTO v_first_name
  FROM employees
  WHERE employee_id = v_employee_id;

END;

