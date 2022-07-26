/*
Lesson 05
SQL Server
*/

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (1, 4, GETDATE(), 300);

UPDATE cust_account
SET balance = balance - 300
WHERE account_id = 1;

UPDATE cust_account
SET balance = balance + 300
WHERE account_id = 4;

SELECT *
FROM cust_account;

ALTER TABLE cust_account
ADD CONSTRAINT ck_acc_minbal CHECK (balance >= 0);