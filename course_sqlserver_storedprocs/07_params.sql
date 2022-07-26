--Create proc
CREATE PROCEDURE show_dept_employees AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee
    WHERE dept_id = 2;
END;
GO

EXEC show_dept_employees;
GO
--Alter to add parameter
ALTER PROCEDURE show_dept_employees (@dept AS INT) AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee
    WHERE dept_id = @dept;
END;
GO

EXEC show_dept_employees;

EXEC show_dept_employees 2;

EXEC show_dept_employees 3;

GO

--Multiple params
ALTER PROCEDURE show_dept_employees (@dept AS INT, @emp AS INT) AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee
    WHERE dept_id = @dept
    AND emp_id >= @emp
END;
GO

EXEC show_dept_employees 3, 5;

EXEC show_dept_employees 3, 10;

--Named params
EXEC show_dept_employees @dept=3, @emp=5;

EXEC show_dept_employees
    @dept = 3,
    @emp = 5;
