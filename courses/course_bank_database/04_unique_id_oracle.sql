/*
Lesson 04
Oracle
*/


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