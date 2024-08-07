/*
Deadlocks - Transaction 1
*/

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
UPDATE courier
SET courier_name = 'Aus Post'
WHERE id = 4;

--SQL 03
UPDATE courier
SET courier_name = 'Star Track'
WHERE id = 5;

--SQL 04
COMMIT;