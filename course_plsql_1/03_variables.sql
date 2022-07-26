/*
Lesson 03
*/

DECLARE
  message VARCHAR2(100): := 'Hello world!';
BEGIN
  DBMS_OUTPUT.PUT_LINE(message);
END;


DECLARE
  message VARCHAR2(100): := 'Goodnight world!';
BEGIN
  DBMS_OUTPUT.PUT_LINE(message);
END;


DECLARE
  message VARCHAR2(100);
BEGIN
  DBMS_OUTPUT.PUT_LINE(message);
END;


DECLARE
  message VARCHAR2(100);
BEGIN
  message := 'Hello!';
  DBMS_OUTPUT.PUT_LINE(message);
END;