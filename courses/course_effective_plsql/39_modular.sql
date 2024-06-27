CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
  v_error_code NUMBER;
  v_error_message VARCHAR2(1000);
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
      v_error_code := SQLCODE;
      v_error_message := SQLERRM;
      INSERT INTO error_log(err_datetime, err_procedure, err_number, err_message)
      VALUES(SYSDATE, 'DivideTwoNumbers', v_error_code, v_error_message);
END;


CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
  invalid_date_range EXCEPTION;
  PRAGMA EXCEPTION_INIT(invalid_date_range, -20000);
BEGIN
  IF v_startdate > v_enddate THEN
    RAISE_APPLICATION_ERROR(-20000, 'Invalid entry: the start date is after the end date.');
  ELSE
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;


/*
Add insert
*/

CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
  invalid_date_range EXCEPTION;
  PRAGMA EXCEPTION_INIT(invalid_date_range, -20000);
BEGIN
  IF v_startdate > v_enddate THEN
    RAISE_APPLICATION_ERROR(-20000, 'Invalid entry: the start date is after the end date.');
  ELSE
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
EXCEPTION
    WHEN OTHERS THEN
      v_error_code := SQLCODE;
      v_error_message := SQLERRM;
      INSERT INTO error_log(err_datetime, err_procedure, err_number, err_message)
      VALUES(SYSDATE, 'ShowEmployeesHiredInRange', v_error_code, v_error_message);
END;

