/*
Lesson 05
*/

CREATE OR REPLACE FUNCTION multiply_nums
(num1 IN NUMBER, num2 IN NUMBER)
RETURN NUMBER AS
BEGIN
  RETURN num1 * num2;
END;



BEGIN
  DBMS_OUTPUT.PUT_LINE(multiply_nums(4, 5));
END;


SELECT multiply_nums(4, 5)
FROM dual;
