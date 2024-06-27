CREATE OR REPLACE PROCEDURE LogError(
  v_procedure_name VARCHAR2
)
AS
  v_error_code NUMBER;
  v_error_message VARCHAR2(1000);
BEGIN
    v_error_code := SQLCODE;
    v_error_message := SQLERRM;
	INSERT INTO error_log(err_datetime, err_procedure, err_number, err_message)
    VALUES(SYSDATE, v_procedure_name, v_error_code, v_error_message);
END;


/*
Add proc call
*/

CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
      LogError('DivideTwoNumbers');
END;


CALL DivideTwoNumbers(5, 0);


SELECT
TO_CHAR(err_datetime, 'YYYY-MM-DD HH:MI:SS') AS err_datetime, 
err_procedure,
err_number,
err_message
FROM error_log;

/*
Add proc call
*/

CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
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
      LogError('ShowEmployeesHiredInRange');
END;



CALL ShowEmployeesHiredInRange(
  v_startdate => DATE'2008-01-01',
  v_enddate => DATE'2006-12-13'
);
