CREATE PROCEDURE check_if_ceo (@emp_id INT) AS
DECLARE @manager_id INT;
BEGIN
    SELECT @manager_id = manager_id
    FROM employee
    WHERE emp_id = @emp_id;

    IF (@manager_id IS NULL)
    BEGIN
        PRINT 'Employee ' + CAST(@emp_id AS VARCHAR(10)) + ' is the CEO.'
    END
END;

GO

EXEC check_if_ceo 10;

EXEC check_if_ceo 7;
GO

--Add ELSE statement
ALTER PROCEDURE check_if_ceo (@emp_id INT) AS
DECLARE @manager_id INT;
BEGIN
    SELECT @manager_id = manager_id
    FROM employee
    WHERE emp_id = @emp_id;

    IF (@manager_id IS NULL)
        BEGIN
            PRINT 'Employee ' + CAST(@emp_id AS VARCHAR(10)) + ' is the CEO.'
        END
    ELSE
        BEGIN
            PRINT 'Employee ' + CAST(@emp_id AS VARCHAR(10)) + ' is not the CEO.'
        END
END;

GO

EXEC check_if_ceo 10;

EXEC check_if_ceo 7;
GO

--Add nested IF statement
ALTER PROCEDURE check_if_ceo (@emp_id INT) AS
DECLARE @manager_id INT, @dept_id INT;
BEGIN
    SELECT @manager_id = manager_id,
    @dept_id = dept_id
    FROM employee
    WHERE emp_id = @emp_id;

    IF (@manager_id IS NULL)
        BEGIN
            PRINT 'Employee ' + CAST(@emp_id AS VARCHAR(10)) + ' is the CEO.'
        END
    ELSE
        BEGIN
            IF (@dept_id = 3)
                BEGIN
                    PRINT 'Employee ' + CAST(@emp_id AS VARCHAR(10)) + ' is NOT the CEO and IS in the IT department.'
                END
            ELSE
                BEGIN
                    PRINT 'Employee ' + CAST(@emp_id AS VARCHAR(10)) + ' is NOT the CEO and IS NOT in the IT department.'
                END       
        END
END;

GO

EXEC check_if_ceo 10;

EXEC check_if_ceo 7;

EXEC check_if_ceo 1;
