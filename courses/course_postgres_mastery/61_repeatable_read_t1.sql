/*
Repeatable Read - Transaction 1
*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--SQL 01
SELECT id, courier_name
FROM courier;

--SQL 02
INSERT INTO courier (id, courier_name)
VALUES (7, 'XYZ Delivery');

--SQL 03
UPDATE courier
SET courier_name = 'DHL Limited'
WHERE id = 2;

--SQL 04
COMMIT;