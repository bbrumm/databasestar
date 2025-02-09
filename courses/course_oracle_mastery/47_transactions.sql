/*
Transactions
*/

--SQL 01
CREATE TABLE courier (
  id NUMBER,
  courier_name VARCHAR2(100)
);

--SQL 02
INSERT INTO courier (id, courier_name)
VALUES (1, 'Fedex');

--SQL 03
SELECT id, courier_name
FROM courier;

--SQL 04
COMMIT;

--SQL 05
INSERT INTO courier (id, courier_name)
VALUES (2, 'DHL');

--SQL 06
ROLLBACK;

--SQL 07
INSERT INTO courier (id, courier_name)
VALUES (3, 'UPS');
