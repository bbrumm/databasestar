--------------------------------------------------------------------------
-- 00_create_user.sql
-- Creates a USERS tablespace (Oracle Free doesn't include one by default)
-- and a dedicated user/schema to hold the OE-style database, instead of
-- building everything under SYS.
--
-- Run this connected to the PLUGGABLE DATABASE as SYSDBA, e.g.:
--   sqlplus sys/YourPassword123@localhost:1521/FREEPDB1 as sysdba
-- or as a SYSDBA connection in DataGrip.
--
-- In Oracle 23c/26 Free (and 21c XE), user-created schemas belong in the
-- PDB (FREEPDB1 by default), not in the CDB root - if you connect to the
-- root (service name FREE instead of FREEPDB1) you'll get ORA-65096.
--
-- BEFORE RUNNING:
--   1. Check your actual datafile directory:
--        SELECT file_name FROM dba_data_files;
--      and update the DATAFILE path below to match (it's usually
--      /opt/oracle/oradata/FREE/FREEPDB1/ inside the container).
--   2. Edit the username/password below.
--------------------------------------------------------------------------

-- Skip this block if a USERS tablespace already exists in your PDB.
CREATE TABLESPACE users
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/users01.dbf'
    SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;

CREATE USER oe_demo IDENTIFIED BY "ChangeMe123!"
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA UNLIMITED ON users;

-- Minimum privileges to connect and create objects (tables, sequences,
-- indexes, views, PL/SQL) under their own schema.
GRANT CREATE SESSION   TO oe_demo;
GRANT CREATE TABLE     TO oe_demo;
GRANT CREATE SEQUENCE  TO oe_demo;
GRANT CREATE VIEW      TO oe_demo;
GRANT CREATE PROCEDURE TO oe_demo;
GRANT CREATE TRIGGER   TO oe_demo;

PROMPT User oe_demo created successfully.
PROMPT Connect with: sqlplus oe_demo/ChangeMe123!@localhost:1521/FREEPDB1