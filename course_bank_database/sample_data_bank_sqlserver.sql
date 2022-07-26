/*
Sample data for Bank Database course - SQL Server
*/
/*
DROP TABLE bank_transaction;
DROP TABLE cust_account;
DROP TABLE customer;
*/

CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE cust_account (
	account_id INT PRIMARY KEY,
	customer_id INT,
	account_status VARCHAR(20),
	balance INT,
	CONSTRAINT fk_ca_cust FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE bank_transaction (
	transaction_id INT,
	from_account_id INT,
	to_account_id INT,
	transaction_datetime DATETIME,
	amount INT,
	CONSTRAINT pk_banktrans PRIMARY KEY (transaction_id),
	CONSTRAINT ck_btr_fracc FOREIGN KEY (from_account_id) REFERENCES cust_account(account_id),
  CONSTRAINT ck_btr_toacc FOREIGN KEY (to_account_id) REFERENCES cust_account(account_id)
);

INSERT INTO customer (customer_id, first_name, last_name) VALUES
(1, 'John', 'Smith'),
(2, 'Sally', 'Jones'),
(3, 'Mark', 'Johnson'),
(4, 'Claire', 'Smith'),
(5, 'Andrew', 'Brown');

INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES
(1, 2, 'Active', 100),
(2, 1, 'Active', 4120),
(3, 3, 'Active', 603),
(4, 2, 'Inactive', 45),
(5, 4, 'Active', 20),
(6, 5, 'Active', 16),
(7, 5, 'Active', 12970),
(8, 1, 'Inactive', 1300);
COMMIT;

SELECT * FROM customer;
SELECT * FROM cust_account;
