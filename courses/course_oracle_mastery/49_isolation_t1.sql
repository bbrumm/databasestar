/*
Isolation Levels - Transaction 1
*/

--SQL 01
INSERT INTO courier (id, courier_name)
VALUES (2, 'DHL');

INSERT INTO courier (id, courier_name)
VALUES (3, 'UPS');

COMMIT;

--SQL 02
SELECT id, courier_name
FROM courier;

--SQL 03
INSERT INTO courier (id, courier_name)
VALUES (6, 'ABC Delivery');

--SQL 04
SELECT id, courier_name
FROM courier;

--SQL 05
COMMIT;