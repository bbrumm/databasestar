/*
Lesson 06
*/

CREATE USER intro_user IDENTIFIED BY mypassword;

GRANT CONNECT TO intro_user;

GRANT CREATE SESSION intro_user;

GRANT UNLIMITED TABLESPACE TO intro_user;

GRANT CREATE TABLE TO intro_user;