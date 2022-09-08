/*
Lesson 03
*/

CREATE PROCEDURE hello_world AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello world!');
END;


CREATE OR REPLACE PROCEDURE hello_world AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Goodnight.');
END;



CREATE OR REPLACE PROCEDURE hello_world 
(message IN VARCHAR2)
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE(message);
END;

CALL hello_world('Hello');

CALL hello_world(message => 'Goodbye');



CREATE OR REPLACE PROCEDURE add_nums
(num1 IN NUMBER, num2 IN NUMBER)
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Total is ' || (num1 + num2));
END;

CALL add_nums(5, 3);

CALL add_nums(14, 19);