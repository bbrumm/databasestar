/*
Boolean
*/

--SQL 01
CREATE TABLE boolean_test (
  description TEXT,
  boolean_value BOOLEAN
);

--SQL 02
INSERT INTO boolean_test(description, boolean_value)
VALUES ('True value', TRUE);

--SQL 03
SELECT description, boolean_value
FROM boolean_test;

--SQL 04
INSERT INTO boolean_test(description, boolean_value)
VALUES ('False value', FALSE);

--SQL 05
INSERT INTO boolean_test(description, boolean_value)
VALUES ('1 value', 1);

--SQL 06
INSERT INTO boolean_test(description, boolean_value)
VALUES ('1 value', 1::boolean);

--SQL 07
INSERT INTO boolean_test(description, boolean_value)
VALUES ('0 value', 0::boolean);

--SQL 08
INSERT INTO boolean_test(description, boolean_value)
VALUES ('NULL value', NULL);

--SQL 09
INSERT INTO boolean_test(description, boolean_value)
VALUES ('Yes value', 'Yes');

INSERT INTO boolean_test(description, boolean_value)
VALUES ('No value', 'No');

--SQL 10
INSERT INTO boolean_test(description, boolean_value)
VALUES ('On value', 'On');

INSERT INTO boolean_test(description, boolean_value)
VALUES ('Off value', 'Off');

--SQL 11
SELECT
description,
boolean_value,
boolean_value IS TRUE AS is_true,
boolean_value IS FALSE AS is_false
FROM boolean_test;
