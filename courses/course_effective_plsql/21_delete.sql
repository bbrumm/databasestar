CREATE OR REPLACE PROCEDURE DeleteEmployee(
  v_empid IN NUMBER
)
AS
BEGIN
    DELETE FROM employees
    WHERE employee_id = v_empid;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_empid || ' deleted.');
END;

CALL DeleteEmployee(207);