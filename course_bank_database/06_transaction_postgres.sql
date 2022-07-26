/*
Lesson 06
Postgres
*/

UPDATE cust_account
SET balance = 0
WHERE account_id = 1;

ALTER TABLE cust_account
ADD CONSTRAINT ck_acc_minbal CHECK (balance >= 0);



START TRANSACTION;

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (4, 7, NOW(), 50);

UPDATE cust_account
SET balance = balance - 50
WHERE account_id = 4;

UPDATE cust_account
SET balance = balance + 50
WHERE account_id = 7;

COMMIT;

SELECT *
FROM bank_transaction;

SELECT *
FROM cust_account;


START TRANSACTION;

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 2, NOW(), 85);

UPDATE cust_account
SET balance = balance - 85
WHERE account_id = 6;

UPDATE cust_account
SET balance = balance + 85
WHERE account_id = 2;

COMMIT;

SELECT *
FROM bank_transaction;

SELECT *
FROM cust_account;

ROLLBACK;

SELECT *
FROM bank_transaction;