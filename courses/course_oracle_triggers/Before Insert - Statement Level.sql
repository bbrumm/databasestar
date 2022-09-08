--Before Insert - Statement Level

CREATE TABLE statements_run (
  rundate DATE,
  statement_run VARCHAR2(20),
  table_run VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER cust_before_insert
BEFORE INSERT ON customer
BEGIN
  INSERT INTO statements_run (rundate, statement_run, table_run)
  VALUES (SYSDATE, 'INSERT', 'customer');
END;


INSERT INTO customer (customer_id, customer_name)
VALUES (6, 'Jane Doe');

SELECT * FROM customer;

SELECT * FROM statements_run;