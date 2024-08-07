/*
Install Extension
 */

--SQL 01
SELECT *
FROM pg_available_extensions;

--SQL 02
CREATE EXTENSION fuzzystrmatch;

--SQL 03
SELECT * 
FROM pg_extension;
