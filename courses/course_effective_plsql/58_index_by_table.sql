CREATE OR REPLACE PROCEDURE FindEmployeeName(
  v_employee_id IN NUMBER
)
AS
  TYPE array_employee IS TABLE OF employees%ROWTYPE INDEX BY PLS_INTEGER;
  v_employee array_employee;
BEGIN

  SELECT *
  INTO v_employee(v_employee_id)
  FROM employees
  WHERE employee_id = v_employee_id;
    
    DBMS_OUTPUT.PUT_LINE('Employee is '
    || v_employee(v_employee_id).first_name || ' ' 
    || v_employee(v_employee_id).last_name
    || ' - ' || v_employee(v_employee_id).email);
    
END;


CALL FindEmployeeName(105);