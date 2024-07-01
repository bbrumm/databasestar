CREATE OR REPLACE PROCEDURE FindEmployeeName(v_employee_id IN NUMBER)
AS
  v_first_name employees.first_name%TYPE;
  v_last_name employees.last_name%TYPE;
  v_email employees.email%TYPE;
  v_phone_number employees.phone_number%TYPE;
BEGIN
  SELECT first_name, last_name
  INTO v_first_name, v_last_name
  FROM employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_first_name || ' ' || v_last_name);
END;


/*
Add rowtype variable
*/

CREATE OR REPLACE PROCEDURE FindEmployeeName(v_employee_id IN NUMBER)
AS
  v_employee employees%ROWTYPE;
BEGIN
  SELECT first_name, last_name
  INTO v_employee.first_name, v_employee.last_name
  FROM employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_employee.first_name || ' ' || v_employee.last_name);
END;


CREATE OR REPLACE PROCEDURE FindEmployeeName(v_employee_id IN NUMBER)
AS
  v_employee employees%ROWTYPE;
BEGIN
  SELECT first_name, last_name, email
  INTO v_employee.first_name, v_employee.last_name, v_employee.email
  FROM employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_employee.first_name || ' ' || v_employee.last_name
    || ' - ' || v_employee.email);
END;


CALL FindEmployeeName(100);