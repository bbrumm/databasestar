CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
BEGIN
  IF v_startdate > v_enddate THEN
    DBMS_OUTPUT.PUT_LINE('Invalid entry: the start date is after the end date.');
  ELSE
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
END;


CALL ShowEmployeesHiredInRange(
  v_startdate => DATE'2005-01-01',
  v_enddate => DATE'2006-12-13'
);



CALL ShowEmployeesHiredInRange(
  v_startdate => DATE'2008-01-01',
  v_enddate => DATE'2006-12-13'
);

/*
Add exception
*/

CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
  invalid_date_range EXCEPTION;
BEGIN
  IF v_startdate > v_enddate THEN
    DBMS_OUTPUT.PUT_LINE('Invalid entry: the start date is after the end date.');
    RAISE invalid_date_range;
  ELSE
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
END;

/*
Add exception block
*/

CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_employee_count NUMBER;
  invalid_date_range EXCEPTION;
BEGIN
  IF v_startdate > v_enddate THEN
    RAISE invalid_date_range;
  ELSE
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
EXCEPTION
    WHEN invalid_date_range THEN
      DBMS_OUTPUT.PUT_LINE('Invalid entry: the start date is after the end date.');
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;



/*
Add exception init
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
    RAISE invalid_date_range;
  ELSE
      SELECT COUNT(*)
      INTO v_employee_count
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate;
      
      DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
  END IF;
EXCEPTION
    WHEN invalid_date_range THEN
      DBMS_OUTPUT.PUT_LINE('Invalid entry: the start date is after the end date.');
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;


CALL ShowEmployeesHiredInRange(
  v_startdate => DATE'2008-01-01',
  v_enddate => DATE'2006-12-13'
);




/*
Add raise_application_error
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
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;