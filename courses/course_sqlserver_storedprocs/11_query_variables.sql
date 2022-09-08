--In query
ALTER PROCEDURE name_length (@fname AS VARCHAR(100)) AS
DECLARE
    @length_of_name INT;
BEGIN
    SET @length_of_name = (
        SELECT LEN(first_name) AS name_length
        FROM employee
        WHERE first_name = @fname
    );

    --Can use either Select or Print
    SELECT @length_of_name; --shows in Results
    PRINT @length_of_name; --shows in Messages
END;

GO

EXEC name_length 'Sarah';
GO

--Select into variables
ALTER PROCEDURE name_length (@fname AS VARCHAR(100)) AS
DECLARE
    @length_of_name INT;
BEGIN
    SELECT 
    @length_of_name = LEN(first_name)
    FROM employee
    WHERE first_name = @fname

    SELECT @length_of_name AS name_length;

END;

GO

EXEC name_length 'Sarah';
GO

--Select into two variables
ALTER PROCEDURE name_length (@fname AS VARCHAR(100)) AS
DECLARE
    @length_of_name INT,
    @upper_name VARCHAR(100);
BEGIN
    SELECT 
    @length_of_name = LEN(first_name),
    @upper_name = UPPER(first_name)
    FROM employee
    WHERE first_name = @fname

    SELECT @upper_name AS upper_name,
    @length_of_name AS length_of_name;

END;

GO

EXEC name_length 'Sarah';
GO