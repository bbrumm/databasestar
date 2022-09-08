/*
Lesson 06
Create Table - SQL Server and MySQL
*/


CREATE TABLE currency_convert (
  from_currency VARCHAR(5),
  to_currency VARCHAR(5),
  conversion_rate DECIMAL(20, 4)
);

INSERT INTO currency_convert
(from_currency, to_currency, conversion_rate)
VALUES ('USD', 'GBP', 0.73)
