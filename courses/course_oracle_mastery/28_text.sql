/*
Character types
*/

--SQL 01
CREATE TABLE char_data (
  vc2 VARCHAR2(20),
  nvc2 NVARCHAR2(20),
  char_n CHAR(5)
);

--SQL 02
INSERT INTO char_data(vc2, nvc2, char_n)
VALUES ('A', 'B', 'C');

--SQL 03
SELECT *
FROM char_data;

--SQL 04
--Error
INSERT INTO char_data(vc2, nvc2, char_n)
VALUES ('Monday', 'Tuesday', 'Wednesday');

--SQL 05
INSERT INTO char_data(vc2, nvc2, char_n)
VALUES ('Monday', 'Tuesday', 'Wed');

--SQL 06
--Unicode - Chinese characters for "Hello"
INSERT INTO char_data(vc2, nvc2)
VALUES ('你好', '你好');

--SQL 07
SELECT
vc2,
DUMP(vc2),
nvc2,
DUMP(nvc2)
FROM char_data;