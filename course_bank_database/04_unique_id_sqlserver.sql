/*
Lesson 04
SQL Server
*/

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