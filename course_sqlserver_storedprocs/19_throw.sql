CREATE PROCEDURE update_employee_title (
    @emp_id INT,
    @title VARCHAR(100)
) AS
DECLARE
    @numRowsChanged INT
BEGIN
    UPDATE employee
    SET title = @title
    WHERE emp_id = @emp_id;

    --Find the number of rows impacted
    SELECT @numRowsChanged = @@ROWCOUNT;

    IF (@numRowsChanged = 0)
    BEGIN; --semicolon needed
        THROW 50002, 'Error: no rows were updated. Perhaps the emp_id does not exist.', 1;
    END
END

GO

EXEC update_employee_title 1, 'Head of IT';

EXEC update_employee_title 1, 'CIO';

EXEC update_employee_title 100, 'CIO';

SELECT * FROM employee;

GO

--Throw inside Catch
ALTER PROCEDURE insert_employee (
    @emp_id INT,
    @first_name VARCHAR(100),
    @title VARCHAR(100),
    @dept_id INT,
    @manager_id INT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id)
        VALUES (@emp_id, @first_name, @title, @dept_id, @manager_id);
    END TRY
    BEGIN CATCH
        PRINT 'Error encountered when inserting.';
        THROW;
    END CATCH
END;
GO

EXEC insert_employee
    @emp_id = 5,
    @first_name = 'Joan',
    @title = 'Salesperson',
    @dept_id = 2,
    @manager_id = 5
    ;
GO