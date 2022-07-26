--02 MySQL
INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (1, 2, 5, NOW(), 50);

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (2, 6, 3, NOW(), 100);

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (2, 5, 1, NOW(), 10);

--03 SQL Server
DROP TABLE bank_transaction;

CREATE TABLE bank_transaction (
	transaction_id INT IDENTITY (1, 1),
	from_account_id INT,
	to_account_id INT,
	transaction_datetime DATETIME,
	amount INT,
	CONSTRAINT pk_banktrans PRIMARY KEY (transaction_id),
	CONSTRAINT ck_btr_fracc FOREIGN KEY (from_account_id) REFERENCES cust_account(account_id),
  CONSTRAINT ck_btr_toacc FOREIGN KEY (to_account_id) REFERENCES cust_account(account_id)
);


INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (2, 5, GETDATE(), 50);

SELECT *
FROM bank_transaction;

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 3, GETDATE(), 100);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (5, 1, GETDATE(), 10);

--04 Oracle


CREATE SEQUENCE seq_bank_trans;

DELETE FROM bank_transaction;

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (seq_bank_trans.NEXTVAL, 2, 5, SYSDATE, 50);

SELECT *
FROM bank_transaction;

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (seq_bank_trans.NEXTVAL, 6, 3, SYSDATE, 100);

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (seq_bank_trans.NEXTVAL, 5, 1, SYSDATE, 10);

--05 Oracle
DROP TABLE bank_transaction;

CREATE TABLE bank_transaction (
	transaction_id NUMBER(10) GENERATED ALWAYS AS IDENTITY,
	from_account_id NUMBER(10),
	to_account_id NUMBER(10),
	transaction_datetime DATE,
	amount NUMBER(10),
	CONSTRAINT pk_banktrans PRIMARY KEY (transaction_id),
	CONSTRAINT ck_btr_fracc FOREIGN KEY (from_account_id) REFERENCES cust_account(account_id),
  CONSTRAINT ck_btr_toacc FOREIGN KEY (to_account_id) REFERENCES cust_account(account_id)
);


INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (2, 5, SYSDATE, 50);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 3, SYSDATE, 100);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (5, 1, SYSDATE, 10);

SELECT *
FROM bank_transaction;

--06 Postgres
CREATE SEQUENCE seq_bank_trans START 1;

DELETE FROM bank_transaction;

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (NEXTVAL('seq_bank_trans'), 2, 5, NOW(), 50);

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (NEXTVAL('seq_bank_trans'), 6, 3, NOW(), 100);

INSERT INTO bank_transaction
(transaction_id, from_account_id, to_account_id, transaction_datetime, amount)
VALUES (NEXTVAL('seq_bank_trans'), 5, 1, NOW(), 10);

SELECT *
FROM bank_transaction;

--07 Postgres
DROP TABLE bank_transaction;

CREATE TABLE bank_transaction (
	transaction_id INTEGER GENERATED ALWAYS AS IDENTITY,
	from_account_id INTEGER,
	to_account_id INTEGER,
	transaction_datetime TIMESTAMP,
	amount INTEGER,
	CONSTRAINT pk_banktrans PRIMARY KEY (transaction_id),
	CONSTRAINT ck_btr_fracc FOREIGN KEY (from_account_id) REFERENCES cust_account(account_id),
  CONSTRAINT ck_btr_toacc FOREIGN KEY (to_account_id) REFERENCES cust_account(account_id)
);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (2, 5, NOW(), 50);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 3, NOW(), 100);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (5, 1, NOW(), 10);

SELECT *
FROM bank_transaction;

--08 MySQL
DROP TABLE bank_transaction;

CREATE TABLE bank_transaction (
	transaction_id INT NOT NULL AUTO_INCREMENT,
	from_account_id INT,
	to_account_id INT,
	transaction_datetime DATETIME,
	amount INT,
	CONSTRAINT pk_banktrans PRIMARY KEY (transaction_id),
	CONSTRAINT ck_btr_fracc FOREIGN KEY (from_account_id) REFERENCES cust_account(account_id),
  CONSTRAINT ck_btr_toacc FOREIGN KEY (to_account_id) REFERENCES cust_account(account_id)
);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (2, 5, NOW(), 50);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (6, 3, NOW(), 100);

INSERT INTO bank_transaction
(from_account_id, to_account_id, transaction_datetime, amount)
VALUES (5, 1, NOW(), 10);

SELECT *
FROM bank_transaction;
