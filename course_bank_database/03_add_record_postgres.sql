/*
Lesson 03
MySQL
*/

SELECT *
FROM bank_transaction;

SELECT *
FROM cust_account;

INSERT INTO bank_transaction(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (1, 2, 5, NOW(), 50);

UPDATE cust_account
SET balance = balance - 50
WHERE account_id = 2;

UPDATE cust_account
SET balance = balance + 50
WHERE account_id = 5;