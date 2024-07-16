CREATE TABLE error_log (
  err_datetime DATE,
  err_procedure VARCHAR2(500),
  err_number NUMBER,
  err_message VARCHAR2(2000)
);


CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
      INSERT INTO error_log(err_datetime, err_procedure, err_number, err_message)
      VALUES(SYSDATE, 'DivideTwoNumbers', SQLCODE, SQLERRM);
END;


CALL DivideTwoNumbers(4, 0);



/*
Add variables
*/

CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
  v_error_code NUMBER;
  v_error_message VARCHAR2(1000);
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
      v_error_code := SQLCODE;
      v_error_message := SQLERRM;
      INSERT INTO error_log(err_datetime, err_procedure, err_number, err_message)
      VALUES(SYSDATE, 'DivideTwoNumbers', v_error_code, v_error_message);
END;

SELECT
TO_CHAR(err_datetime, 'YYYY-MM-DD HH:MI:SS') AS err_datetime, 
err_procedure,
err_number,
err_message
FROM error_log;