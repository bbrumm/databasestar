CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_empid NUMBER;
  v_firstname VARCHAR2(100);
  v_lastname VARCHAR2(100);
  v_hiredate DATE;
BEGIN
  SELECT employee_id, first_name, last_name, hire_date
  INTO v_empid, v_firstname, v_lastname, v_hiredate
  FROM employees
  WHERE hire_date BETWEEN v_startdate AND v_enddate
  FETCH FIRST 1 ROWS ONLY;
  
  DBMS_OUTPUT.PUT_LINE('Employee ' || v_empid || ' ' ||
    v_firstname || ' ' || v_lastname || ' was hired on ' ||
    v_hiredate);
END;


CALL ShowEmployeesHiredInRange(
  v_startdate => DATE'2005-01-01',
  v_enddate => DATE'2006-12-13'
);


/*
Add IF
*/

CREATE OR REPLACE PROCEDURE ShowEmployeesHiredInRange(
  v_startdate IN DATE,
  v_enddate IN DATE
)
AS
  v_empid NUMBER;
  v_firstname VARCHAR2(100);
  v_lastname VARCHAR2(100);
  v_hiredate DATE;
BEGIN
  IF v_startdate > v_enddate THEN
    DBMS_OUTPUT.PUT_LINE('Invalid entry: the start date is after the end date.');
  ELSE
      SELECT employee_id, first_name, last_name, hire_date
      INTO v_empid, v_firstname, v_lastname, v_hiredate
      FROM employees
      WHERE hire_date BETWEEN v_startdate AND v_enddate
      FETCH FIRST 1 ROWS ONLY;
      
      DBMS_OUTPUT.PUT_LINE('Employee ' || v_empid || ' ' ||
        v_firstname || ' ' || v_lastname || ' was hired on ' ||
        v_hiredate);
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