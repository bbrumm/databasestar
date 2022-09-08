--Simple loop

DECLARE @counter INT = 1;

WHILE @counter <= 10
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END
GO

CREATE PROCEDURE while_loop AS 
BEGIN
    DECLARE @counter INT = 1;

    WHILE @counter <= 10
    BEGIN
        PRINT @counter;
        SET @counter = @counter + 1;
    END
END;

EXEC while_loop;