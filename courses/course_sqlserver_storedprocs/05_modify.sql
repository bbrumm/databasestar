--Recreate procedure
CREATE PROCEDURE show_employees AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee;
END;

GO

--Change it
ALTER PROCEDURE show_employees AS
BEGIN
    SELECT first_name, title, dept_id
    FROM employee;
END;

GO

EXEC show_employees;
