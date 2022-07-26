--Both params
EXEC show_dept_employees 3, 5;

--Only one
EXEC show_dept_employees 3;
GO

ALTER PROCEDURE show_dept_employees (@dept AS INT, @emp AS INT = 1) AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee
    WHERE dept_id = @dept
    AND emp_id >= @emp
END;
GO

EXEC show_dept_employees 3;

EXEC show_dept_employees 3, 5;

EXEC show_dept_employees
    @dept=3,
    @emp=5;

GO

--First param optional
ALTER PROCEDURE show_dept_employees (@dept AS INT = 2, @emp AS INT) AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee
    WHERE dept_id = @dept
    AND emp_id >= @emp
END;
GO

EXEC show_dept_employees 3;

EXEC show_dept_employees 5;

EXEC show_dept_employees 3, 5;

EXEC show_dept_employees
    @dept=3,
    @emp=5;

EXEC show_dept_employees
    @emp = 5;