/*
Repeatable Read - Transaction 2
*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--SQL 01
SELECT id, courier_name
FROM courier;
