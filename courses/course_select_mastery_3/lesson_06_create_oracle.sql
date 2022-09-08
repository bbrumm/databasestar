/*
Lesson 06
Create Table - Oracle
*/

CREATE TABLE currency_convert (
  from_currency VARCHAR2(5),
  to_currency VARCHAR2(5),
  conversion_rate NUMBER(20, 4)
);

INSERT INTO currency_convert
(from_currency, to_currency, conversion_rate)
VALUES ('USD', 'GBP', 0.73)
