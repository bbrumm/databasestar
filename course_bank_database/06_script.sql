--02 MySQL

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (4, 7, NOW(), 50);

UPDATE cust_account
SET balance = balance - 50
WHERE account_id = 4;

UPDATE cust_account
SET balance = balance + 50
WHERE account_id = 7;

--03 MySQL
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

ROLLBACK;

SELECT *
FROM bank_transaction;

--04 Oracle

--need to create the constraint and ensure the data is updated
UPDATE cust_account
SET balance = 0
WHERE account_id = 1;

ALTER TABLE cust_account
ADD CONSTRAINT ck_acc_minbal CHECK (balance >= 0);



INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (4, 7, SYSDATE, 50);

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


INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 2, SYSDATE, 85);

UPDATE cust_account
SET balance = balance - 85
WHERE account_id = 6;

UPDATE cust_account
SET balance = balance + 85
WHERE account_id = 2;

COMMIT;

BEGIN

    INSERT INTO bank_transaction
    (from_account_id, to_account_id, transaction_datetime, amount)
    VALUES (6, 2, SYSDATE, 85);

    UPDATE cust_account
    SET balance = balance - 85
    WHERE account_id = 6;

    UPDATE cust_account
    SET balance = balance + 85
    WHERE account_id = 2;

    COMMIT;

END;


SELECT *
FROM bank_transaction;

SELECT *
FROM cust_account;

--05 SQL Server

BEGIN TRANSACTION;

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (4, 7, GETDATE(), 50);

UPDATE cust_account
SET balance = balance - 50
WHERE account_id = 4;

UPDATE cust_account
SET balance = balance + 50
WHERE account_id = 7;

COMMIT;



BEGIN TRANSACTION;

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 2, GETDATE(), 85);

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

SELECT *
FROM cust_account;

--06 Postgres

UPDATE cust_account
SET balance = 0
WHERE account_id = 1;

ALTER TABLE cust_account
ADD CONSTRAINT ck_acc_minbal CHECK (balance >= 0);

--start

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

/*reset
delete from bank_transaction where transaction_id = 7;

UPDATE cust_account
SET balance = balance + 50
WHERE account_id = 4;

UPDATE cust_account
SET balance = balance - 50
WHERE account_id = 7;

*/

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
