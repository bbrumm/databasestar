/*
Lesson 04
*/

DECLARE
  message VARCHAR2(100);
  firstNumber NUMBER(4);
  secondNumber NUMBER(4);
BEGIN
  message := 'Hello!';
  firstNumber := 4;
  secondNumber := 5;
  DBMS_OUTPUT.PUT_LINE(firstNumber);
END;


DECLARE
  message VARCHAR2(100);
  firstNumber NUMBER(4);
  secondNumber NUMBER(4);
BEGIN
  message := 'Hello!';
  firstNumber := 4;
  secondNumber := 5;
  DBMS_OUTPUT.PUT_LINE('The first number is ' || firstNumber);
END;


DECLARE
  message VARCHAR2(100);
  firstNumber NUMBER(4);
  secondNumber NUMBER(4);
BEGIN
  message := 'Hello!';
  firstNumber := 4;
  secondNumber := 5;
  DBMS_OUTPUT.PUT_LINE('The first number is ' || firstNumber);
  DBMS_OUTPUT.PUT_LINE('The second number is ' || secondNumber);
END;


DECLARE
  message VARCHAR2(100);
  firstNumber NUMBER(4);
  secondNumber NUMBER(4);
BEGIN
  message := 'The sum is ';
  firstNumber := 4;
  secondNumber := 5;
  DBMS_OUTPUT.PUT_LINE('The first number is ' || firstNumber);
  DBMS_OUTPUT.PUT_LINE('The second number is ' || secondNumber);
  DBMS_OUTPUT.PUT_LINE(message || (firstNumber + secondNumber));
END;