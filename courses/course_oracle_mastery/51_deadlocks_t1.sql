/*
Deadlocks - Transaction 1
*/

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
UPDATE courier
SET courier_name = 'Aus Post'
WHERE id = 6;

--SQL 03
UPDATE courier
SET courier_name = 'Star Track'
WHERE id = 1;

--SQL 04
COMMIT;