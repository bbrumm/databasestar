/*
Lesson 07
SQL Server
*/

--Tab 1
SELECT *
FROM cust_account;

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (8, 1, GETDATE(), 25);

UPDATE cust_account
SET balance = balance - 25
WHERE account_id = 8;

UPDATE cust_account
SET balance = balance + 25
WHERE account_id = 1;

SELECT *
FROM cust_account;

--Tab 2
SELECT *
FROM cust_account;

--Tab 1
COMMIT;

SELECT *
FROM cust_account;

--Tab 2
SELECT *
FROM cust_account;