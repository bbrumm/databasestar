/*
Encoding
*/

--SQL 01
SELECT datname, pg_encoding_to_char(encoding)
FROM pg_database;

--SQL 02
SHOW SERVER_ENCODING;

--SQL 03
UPDATE pg_database
SET encoding = pg_char_to_encoding('UTF8')
WHERE datname = 'your_database_name';