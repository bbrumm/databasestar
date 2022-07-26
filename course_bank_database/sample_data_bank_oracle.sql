/*
Sample data for Bank Database course - Oracle
*/
/*
DROP TABLE bank_transaction;
DROP TABLE cust_account;
DROP TABLE customer;
*/

CREATE TABLE customer (
	customer_id NUMBER(10) PRIMARY KEY,
	first_name VARCHAR2(100),
	last_name VARCHAR2(100)
);

CREATE TABLE cust_account (
	account_id NUMBER(10) PRIMARY KEY,
	customer_id NUMBER(10),
	account_status VARCHAR2(20),
	balance NUMBER(10),
	CONSTRAINT fk_ca_cust FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE bank_transaction (
	transaction_id NUMBER(10),
	from_account_id NUMBER(10),
	to_account_id NUMBER(10),
	transaction_datetime DATE,
	amount NUMBER(10),
	CONSTRAINT pk_banktrans PRIMARY KEY (transaction_id),
	CONSTRAINT ck_btr_fracc FOREIGN KEY (from_account_id) REFERENCES cust_account(account_id),
  CONSTRAINT ck_btr_toacc FOREIGN KEY (to_account_id) REFERENCES cust_account(account_id)
);

INSERT INTO customer (customer_id, first_name, last_name) VALUES (1, 'John', 'Smith');
INSERT INTO customer (customer_id, first_name, last_name) VALUES (2, 'Sally', 'Jones');
INSERT INTO customer (customer_id, first_name, last_name) VALUES (3, 'Mark', 'Johnson');
INSERT INTO customer (customer_id, first_name, last_name) VALUES (4, 'Claire', 'Smith');
INSERT INTO customer (customer_id, first_name, last_name) VALUES (5, 'Andrew', 'Brown');

INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (1, 2, 'Active', 100);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (2, 1, 'Active', 4120);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (3, 3, 'Active', 603);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (4, 2, 'Inactive', 45);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (5, 4, 'Active', 20);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (6, 5, 'Active', 16);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (7, 5, 'Active', 12970);
INSERT INTO cust_account (account_id, customer_id, account_status, balance) VALUES (8, 1, 'Inactive', 1300);

COMMIT;

SELECT * FROM customer;
SELECT * FROM cust_account;
