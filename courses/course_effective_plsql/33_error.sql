CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
END;


CALL DivideTwoNumbers(10, 2);

CALL DivideTwoNumbers(15, 6);

CALL DivideTwoNumbers(4, 0);

/*
Add an exception block
*/
CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;

/*
Add zero_divide
*/
CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('A divide by zero error was found.');
      DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
END;

CALL DivideTwoNumbers(4, 0);

