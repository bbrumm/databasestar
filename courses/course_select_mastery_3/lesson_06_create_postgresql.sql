/*
Lesson 06
Create Table - Postgres
*/


CREATE TABLE currency_convert (
  from_currency CHARACTER VARYING(5),
  to_currency CHARACTER VARYING(5),
  conversion_rate NUMERIC(20, 4)
);

INSERT INTO currency_convert
(from_currency, to_currency, conversion_rate)
VALUES ('USD', 'GBP', 0.73)
