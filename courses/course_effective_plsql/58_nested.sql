CREATE OR REPLACE PROCEDURE PrintEmployeeStatuses
AS
  TYPE array_emp_status IS TABLE OF VARCHAR2(20);
  v_emp_status array_emp_status := array_emp_status();
BEGIN

  v_emp_status.extend(4);
  v_emp_status(1) := 'Active';
  v_emp_status(2) := 'Past';
  v_emp_status(3) := 'Hire Pending';
  v_emp_status(4) := 'Exiting';
  
  FOR i IN 1 .. v_emp_status.count LOOP
    DBMS_OUTPUT.PUT_LINE('Status is: ' || v_emp_status(i));
  END LOOP;
END;

CALL PrintEmployeeStatuses();