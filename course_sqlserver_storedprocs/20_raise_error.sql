ALTER PROCEDURE update_employee_title (
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
        RAISERROR ('Error: no rows were updated. Perhaps the emp_id does not exist.', 1, 1);
    END
END

GO

EXEC update_employee_title 100, 'CIO';

--Add a custom message
EXEC sp_addmessage 
    @msgnum = 50008, 
    @severity = 1, 
    @msgtext = 'No rows were updated. Maybe the emp_id does not exist.';

SELECT *
FROM sys.messages
WHERE message_id = 50008;

GO

ALTER PROCEDURE update_employee_title (
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
        RAISERROR (50008, 1, 1);
    END
END

GO

EXEC sp_dropmessage 
    @msgnum = 50008;  