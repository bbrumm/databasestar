/*
Isolation Levels - Transaction 1
*/

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
INSERT INTO courier (id, courier_name)
VALUES (6, 'ABC Delivery');

--SQL 03
SELECT id, courier_name
FROM courier;

--SQL 04
COMMIT;