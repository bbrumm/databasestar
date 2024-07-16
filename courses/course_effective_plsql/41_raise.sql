CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
      LogError('DivideTwoNumbers');
      RAISE;
END;

CALL DivideTwoNumbers(5, 2);
CALL DivideTwoNumbers(5, 0);

SELECT
TO_CHAR(err_datetime, 'YYYY-MM-DD HH:MI:SS') AS err_datetime, 
err_procedure,
err_number,
err_message
FROM error_log
ORDER BY err_datetime ASC;



CREATE OR REPLACE PROCEDURE LogError(
  v_procedure_name VARCHAR2
)
AS
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_error_code NUMBER;
  v_error_message VARCHAR2(1000);
BEGIN
    v_error_code := SQLCODE;
    v_error_message := SQLERRM;
	INSERT INTO error_log(err_datetime, err_procedure, err_number, err_message)
    VALUES(SYSDATE, v_procedure_name, v_error_code, v_error_message);
    COMMIT;
END;

