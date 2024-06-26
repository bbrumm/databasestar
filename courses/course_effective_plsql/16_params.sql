CREATE OR REPLACE PROCEDURE FindEmployeeName
AS
  v_employee_id NUMBER;
  v_first_name VARCHAR2(100);
  v_last_name VARCHAR2(100);
BEGIN
  SELECT employee_id, first_name, last_name
  INTO v_employee_id, v_first_name, v_last_name
  FROM employees
  WHERE employee_id = 101;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_first_name || ' ' || v_last_name);
END;


CALL FindEmployeeName();


CREATE OR REPLACE PROCEDURE FindEmployeeName
AS
  v_employee_id NUMBER := 108;
  v_first_name VARCHAR2(100);
  v_last_name VARCHAR2(100);
BEGIN
  SELECT first_name, last_name
  INTO v_first_name, v_last_name
  FROM employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_first_name || ' ' || v_last_name);
END;


CALL FindEmployeeName();

/*
Add parameter
*/

CREATE OR REPLACE PROCEDURE FindEmployeeName(v_employee_id IN NUMBER)
AS
  v_first_name VARCHAR2(100);
  v_last_name VARCHAR2(100);
BEGIN
  SELECT first_name, last_name
  INTO v_first_name, v_last_name
  FROM employees
  WHERE employee_id = v_employee_id;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_first_name || ' ' || v_last_name);
END;

CALL FindEmployeeName();
CALL FindEmployeeName(100);
CALL FindEmployeeName(108);

