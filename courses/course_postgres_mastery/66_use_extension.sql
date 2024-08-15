/*
Use Extension
*/

--SQL 01
SELECT soundex('Anne');

--SQL 02
SELECT soundex('Ann');

--SQL 03
SELECT 
soundex('Anne'),
soundex('Ann'),
difference('Anne', 'Ann');

--SQL 04
SELECT 
soundex('Ben'),
soundex('Bob'),
difference('Ben', 'Bob');

--SQL 05
SELECT 
soundex('Steve'),
soundex('Donald'),
difference('Steve', 'Donald');

--SQL 06
DROP EXTENSION fuzzystrmatch;

--SQL 07
SELECT * 
FROM pg_extension;