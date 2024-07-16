/*
01 Create Account
Create accounts for HR schema
Run this as either SYS or SYSTEM.
*/


/*
Set the pluggable database if you're running this on Oracle v12 or later.
*/
ALTER SESSION SET CONTAINER = ORCLPDB1;

/*
If the above PDB name does not work, some options for PDB names are:
ALTER SESSION SET CONTAINER = ORCLPDB1;
ALTER SESSION SET CONTAINER = PDB1;
*/

/*
Drop the HR account and all objects to reset.
Then, create the user and give it the permissions.
*/
DROP USER HR CASCADE;

CREATE USER HR IDENTIFIED BY hrpass;

ALTER USER HR DEFAULT TABLESPACE users QUOTA UNLIMITED ON users;

ALTER USER HR TEMPORARY TABLESPACE TEMP;

GRANT CONNECT TO HR;

GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO HR;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE, UNLIMITED TABLESPACE TO HR;