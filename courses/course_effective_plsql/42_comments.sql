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
