--Declare and set
ALTER PROCEDURE name_length AS
DECLARE @fname VARCHAR(100);
SET @fname = 'Sarah';
BEGIN
    SELECT first_name, LEN(first_name) AS name_length
    FROM employee
    WHERE first_name = @fname;
END;

GO

EXEC name_length;
GO

--Two variables
ALTER PROCEDURE name_length AS
DECLARE @fname VARCHAR(100),
    @emp_id INT;
SET @fname = 'Sarah';
SET @emp_id = 2;
BEGIN
    SELECT first_name, LEN(first_name) AS name_length
    FROM employee
    WHERE first_name = @fname
    AND emp_id >= @emp_id;
END;

GO

EXEC name_length;
GO
