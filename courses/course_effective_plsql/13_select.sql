CREATE OR REPLACE PROCEDURE ShowEmployeeCount
AS
    employee_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO employee_count
    FROM employees;
    DBMS_OUTPUT.PUT_LINE(employee_count);
END;


CALL ShowEmployeeCount();