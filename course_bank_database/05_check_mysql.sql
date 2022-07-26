/*
Lesson 05
MySQL
*/

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (1, 4, NOW(), 300);

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

ALTER TABLE cust_account
ADD CONSTRAINT ck_acc_minbal CHECK (balance >= 0) NOT ENFORCED;

ALTER TABLE cust_account
ALTER CONSTRAINT ck_acc_minbal ENFORCED;

UPDATE cust_account
SET balance = 0
WHERE account_id = 1;

ALTER TABLE cust_account
ALTER CONSTRAINT ck_acc_minbal ENFORCED;

SELECT *
FROM cust_account;


INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (4, 7, NOW(), 50);

UPDATE cust_account
SET balance = balance - 50
WHERE account_id = 4;

UPDATE cust_account
SET balance = balance + 50
WHERE account_id = 7;

SELECT *
FROM cust_account;


INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 8, NOW(), 90);

UPDATE cust_account
SET balance = balance - 90
WHERE account_id = 6;

UPDATE cust_account
SET balance = balance + 90
WHERE account_id = 6;

SELECT *
FROM cust_account;
