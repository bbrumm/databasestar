--Create proc
CREATE PROCEDURE name_length AS
BEGIN
    SELECT LEN(first_name) AS name_length
    FROM employee
    WHERE first_name = 'Michael';
END;

GO

EXEC name_length;
GO

--Use a parameter
ALTER PROCEDURE name_length (@fname AS VARCHAR(100)) AS
BEGIN
    SELECT first_name, LEN(first_name) AS name_length
    FROM employee
    WHERE first_name = @fname;
END;

GO

EXEC name_length;

EXEC name_length 'Michael';

EXEC name_length 'Stephanie';

