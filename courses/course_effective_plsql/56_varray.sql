CREATE OR REPLACE PROCEDURE PrintEmployeeStatuses
AS
  TYPE varray_emp_status IS VARRAY(4) OF VARCHAR2(20);
  v_emp_status varray_emp_status;
BEGIN
  v_emp_status := varray_emp_status('Active', 'Past', 'Hire Pending', 'Exiting');
  
  FOR i IN 1 .. v_emp_status.count LOOP
    DBMS_OUTPUT.PUT_LINE('Status is: ' || v_emp_status(i));
  END LOOP;
END;

CALL PrintEmployeeStatuses();