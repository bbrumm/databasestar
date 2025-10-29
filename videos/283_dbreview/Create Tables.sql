CREATE TABLE customers (
  id INT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(350),
  phone_number1 VARCHAR(20),
  phone_number2 VARCHAR(20),
  CONSTRAINT pk_customer PRIMARY KEY (id)
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  order_date DATETIME,
  order_status_id INT,
  product_id INT,
  CONSTRAINT fk_ord_prod
    FOREIGN KEY (product_id) REFERENCES products (id),
  CONSTRAINT fk_ord_cust
    FOREIGN KEY (customer_id) REFERENCES customers (id),
  CONSTRAINT fk_ord_status
    FOREIGN KEY (order_status_id) REFERENCES order_status (id)
);

CREATE TABLE products (
  id INT PRIMARY KEY,
  product_name VARCHAR(200)
);

CREATE TABLE phone_number (
  id INT,
  phone_number VARCHAR(20),
  customer_id INT,
  CONSTRAINT pk_phonenumber PRIMARY KEY (id),
  CONSTRAINT fk_phone_cust
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE order_status (
    id INT,
    status VARCHAR(20),
    CONSTRAINT pk_orderstatus PRIMARY KEY (id)
);