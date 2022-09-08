/*
Lesson 04
*/

CREATE OR REPLACE PROCEDURE add_nums
(num1 IN NUMBER, num2 IN NUMBER)
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Total is ' || (num1 + num2));
END;



CREATE OR REPLACE PROCEDURE add_nums
(num1 IN NUMBER, num2 IN NUMBER,
totalNumber OUT NUMBER)
AS
BEGIN
  totalNumber := num1 + num2;
END;


CALL add_nums(14, 19);



DECLARE
  numberToDisplay NUMBER(5);
BEGIN
  add_nums(14, 19, numberToDisplay);
  DBMS_OUTPUT.PUT_LINE(numberToDisplay);
END;
