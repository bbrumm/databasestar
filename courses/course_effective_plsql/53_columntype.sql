CREATE OR REPLACE PROCEDURE FindEmployeeName(v_employee_id IN NUMBER)
AS
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
BEGIN
  SELECT first_name, last_name
  INTO v_first_name, v_last_name
  FROM employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_first_name || ' ' || v_last_name);
END;


CALL FindEmployeeName(100);