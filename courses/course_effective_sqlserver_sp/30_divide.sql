ALTER PROCEDURE DivideTwoNumbers
	@topNumber INT,
	@bottomNumber INT
AS
BEGIN
	SET NOCOUNT ON;
	PRINT 'test 1';

	BEGIN TRY
		PRINT 'test 2';
		PRINT @topNumber / @bottomNumber;
	END TRY
	BEGIN CATCH
		PRINT 'test 3';
		INSERT INTO error_log
		(err_datetime, err_number, err_severity, err_state, err_procedure, err_line, err_message)
		VALUES(
		GETDATE(),
		ERROR_NUMBER(),
		ERROR_SEVERITY(),
		ERROR_STATE(),
		ERROR_PROCEDURE(),
		ERROR_LINE(),
		ERROR_MESSAGE()
		);
	END CATCH
	PRINT 'test 4';
END;


EXECUTE DivideTwoNumbers 10, 2;