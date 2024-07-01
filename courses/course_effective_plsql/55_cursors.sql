
CREATE OR REPLACE PROCEDURE FindEmployeeName(v_employee_id IN NUMBER)
AS
  v_employee employees%ROWTYPE;
  CURSOR c_employee IS
  SELECT first_name, last_name, email
  FROM employees
  WHERE employee_id = v_employee_id;
BEGIN
  OPEN c_employee;
  FETCH c_employee
  INTO v_employee.first_name, v_employee.last_name, v_employee.email;
  CLOSE c_employee;
  
  DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_employee_id 
    || ' is ' || v_employee.first_name || ' ' || v_employee.last_name
    || ' - ' || v_employee.email);
END;


CALL FindEmployeeName(100);


/*
Multiple rows
*/

CREATE OR REPLACE PROCEDURE FindEmployeeName
AS
  v_employee employees%ROWTYPE;
  CURSOR c_employee IS
  SELECT first_name, last_name, email
  FROM employees;
BEGIN
  OPEN c_employee;
  FETCH c_employee
  INTO v_employee.first_name, v_employee.last_name, v_employee.email;
  CLOSE c_employee;
  
  DBMS_OUTPUT.PUT_LINE('Employee is '
  || v_employee.first_name || ' ' || v_employee.last_name
    || ' - ' || v_employee.email);
END;




CREATE OR REPLACE PROCEDURE FindEmployeeName
AS
  v_employee employees%ROWTYPE;
  CURSOR c_employee IS
  SELECT first_name, last_name, email
  FROM employees;
BEGIN
  OPEN c_employee;
  LOOP
    FETCH c_employee
    INTO v_employee.first_name, v_employee.last_name, v_employee.email;
    EXIT WHEN c_employee%notfound;
    
    DBMS_OUTPUT.PUT_LINE('Employee is '
    || v_employee.first_name || ' ' || v_employee.last_name
    || ' - ' || v_employee.email);
    
  END LOOP;
  CLOSE c_employee;
  
END;


CALL FindEmployeeName();