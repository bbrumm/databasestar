/*
Transactions
*/

--SQL 01
CREATE TABLE courier (
  id INTEGER,
  courier_name TEXT
);

--SQL 02
INSERT INTO courier (id, courier_name)
VALUES (1, 'Fedex');

--SQL 03
SELECT id, courier_name
FROM courier;

--SQL 04
START TRANSACTION;

INSERT INTO courier (id, courier_name)
VALUES (2, 'DHL');

COMMIT;


--SQL 05
START TRANSACTION;

INSERT INTO courier (id, courier_name)
VALUES (3, 'UPS');

ROLLBACK;

--SQL 06
INSERT INTO courier (id, courier_name)
VALUES (4, 'Australia Post');

--SQL 07
INSERT INTO courier (id, courier_name)
VALUES (5, 'Startrack');

--SQL 08
COMMIT;

--SQL 09
--auto commit is off in DBeaver
SELECT CURRENT_TIMESTAMP;
