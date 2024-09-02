/*
Create a procedure in Oracle PL/SQL
*/

CREATE PROCEDURE HelloWorld
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello world!');
END;


CALL HelloWorld();



CREATE OR REPLACE PROCEDURE HelloWorld
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello everyone!');
END;