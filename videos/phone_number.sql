CREATE TABLE customer (
  customer_name VARCHAR(100),
  phone_number INT
);

INSERT INTO customer (customer_name, phone_number)
VALUES ('John Smith', 9876543210);

SELECT customer_name, phone_number
FROM customer;

INSERT INTO customer (customer_name, phone_number)
VALUES ('Mary Jones', 0621092131);

DROP TABLE customer;

CREATE TABLE customer (
  customer_name VARCHAR(100),
  phone_number VARCHAR(25)
);