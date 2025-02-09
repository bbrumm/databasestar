/*
Locks - Transaction 1
*/

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
UPDATE courier
SET courier_name = 'DHL Australia'
WHERE id = 2;

--SQL 03
COMMIT;