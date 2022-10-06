/*
Sample data for my SQL Decimal post
*/

CREATE TABLE bank_account (
  account_id INT,
  account_name VARCHAR(200),
  account_balance DECIMAL(20,2)
);

INSERT INTO bank_account (account_id, account_name, account_balance)
VALUES (1, 'John', 4502.25);

SELECT
account_id,
account_name,
account_balance
FROM bank_account;


CREATE TABLE decimal_test (
  dec1 DECIMAL (2, 1),
  dec2 DECIMAL (3, 1),
  dec3 DECIMAL (5, 4),
  dec4 DECIMAL (6, 2)
);



