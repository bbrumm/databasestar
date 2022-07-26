/*
Lesson 04
Postgres
*/

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