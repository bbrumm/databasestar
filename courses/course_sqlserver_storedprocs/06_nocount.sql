--Set nocount on
ALTER PROCEDURE show_employees AS
SET NOCOUNT ON;
BEGIN
    SELECT first_name, title, dept_id
    FROM employee;
END;

GO

EXEC show_employees;

--Set nocount off, which is default
ALTER PROCEDURE show_employees AS
SET NOCOUNT OFF;
BEGIN
    SELECT first_name, title, dept_id
    FROM employee;
END;

GO

EXEC show_employees;