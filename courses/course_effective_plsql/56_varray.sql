CREATE OR REPLACE PROCEDURE PrintEmployeeStatuses
AS
  v_status_1 VARCHAR2(20) := 'Active';
  v_status_2 VARCHAR2(20) := 'Past';
  v_status_3 VARCHAR2(20) := 'Hire Pending';
  v_status_4 VARCHAR2(20) := 'Exiting';
  
  TYPE varray_emp_status IS VARRAY(4) OF VARCHAR2(20);
  v_emp_status varray_emp_status;
BEGIN
  v_emp_status := varray_emp_status('Active', 'Past', 'Hire Pending', 'Exiting');
  
  FOR i IN 1 .. v_emp_status.count LOOP
    DBMS_OUTPUT.PUT_LINE('Status is: ' || v_emp_status(i));
  END LOOP;
END;

CALL PrintEmployeeStatuses();