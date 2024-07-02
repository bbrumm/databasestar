CREATE PACKAGE EmployeeDetails AS
  PROCEDURE FindEmployee(v_employee_id IN NUMBER);
END;



CREATE PACKAGE BODY EmployeeDetails AS
  PROCEDURE FindEmployee(v_employee_id IN NUMBER)
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
END;