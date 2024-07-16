SELECT *
FROM employees;


CREATE OR REPLACE PROCEDURE FindEmployeeName
AS
  v_employee_id NUMBER;
  v_first_name VARCHAR2(100);
  v_last_name VARCHAR2(100);
BEGIN
  SELECT employee_id, first_name, last_name
  INTO v_employee_id, v_first_name, v_last_name
  FROM employees
  WHERE employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE(v_employee_id);
  DBMS_OUTPUT.PUT_LINE(v_first_name);
  DBMS_OUTPUT.PUT_LINE(v_last_name);
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
  || ' is ' || v_first_name || ' ' || v_last_name);
END;


CALL FindEmployeeName();