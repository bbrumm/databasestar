CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
  invalid_date_range EXCEPTION;
  PRAGMA EXCEPTION_INIT(invalid_date_range, -20000);
BEGIN
  DBMS_OUTPUT.PUT_LINE(1);
  IF v_startdate > v_enddate THEN
    DBMS_OUTPUT.PUT_LINE(2);
    RAISE_APPLICATION_ERROR(-20000, 'Invalid entry: the start date is after the end date.');
  ELSE
      DBMS_OUTPUT.PUT_LINE(3);
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
  DBMS_OUTPUT.PUT_LINE(4);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(5);
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;


CALL ShowEmployeesHiredInRange(
  v_startdate => DATE'2005-01-01',
  v_enddate => DATE'2006-12-13'
);