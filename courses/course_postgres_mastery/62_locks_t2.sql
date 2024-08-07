/*
Locks - Transaction 2
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
SET courier_name = 'DHL'
WHERE id = 2;

COMMIT;