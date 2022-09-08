--Create proc
CREATE PROCEDURE emp_count_dept (@dept AS INT)
AS
BEGIN
    SELECT COUNT(*) AS num_rows
    FROM employee
    WHERE dept_id = @dept;
END;
GO

EXEC emp_count_dept 3;
GO

--Add output param
ALTER PROCEDURE emp_count_dept (@dept AS INT, @emp_count INT OUTPUT)
AS
BEGIN
    SELECT @emp_count = COUNT(*)
    FROM employee
    WHERE dept_id = @dept;

END;
GO

--Try to exec
EXEC emp_count_dept 3;
GO

--T-SQL block
DECLARE @count INT;

EXEC emp_count_dept 3, @count;

SELECT @count AS emp_count_for_dept;

GO

--T-SQL block with OUTPUT
DECLARE @count INT;

EXEC emp_count_dept 3, @count OUTPUT;

SELECT @count AS emp_count_for_dept;

GO

--Specify names
DECLARE @count INT;

EXEC emp_count_dept 
    @dept = 3, 
    @emp_count = @count OUTPUT;

SELECT @count AS emp_count_for_dept;

GO