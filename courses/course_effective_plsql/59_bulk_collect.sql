CREATE OR REPLACE PROCEDURE FindEmployeeName
AS
  TYPE t_employee IS TABLE OF employees%ROWTYPE;
  v_employee t_employee;
BEGIN
  SELECT *
  BULK COLLECT INTO v_employee
  FROM employees;
  
  FOR i IN 1 .. v_employee.count LOOP
    DBMS_OUTPUT.PUT_LINE('Employee is '
    || v_employee(i).first_name || ' ' 
    || v_employee(i).last_name || ' - ' 
    || v_employee(i).email);
  END LOOP;
END;


CALL FindEmployeeName();