CREATE PROCEDURE LogError
AS
BEGIN
	 INSERT INTO error_log
    (err_datetime, err_number, err_severity, err_state, err_procedure, err_line,     err_message)
    VALUES (GETDATE(),
    ERROR_NUMBER(),
    ERROR_SEVERITY(),
    ERROR_STATE(),
    ERROR_PROCEDURE(), 
    ERROR_LINE(),
    ERROR_MESSAGE()
    );

END;
