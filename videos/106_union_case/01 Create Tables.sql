DROP TABLE order_line;
DROP TABLE customer_order;
DROP TABLE customer;
DROP TABLE product;
DROP TABLE product_category;



CREATE TABLE customer (
  customer_id INT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  address VARCHAR(500),
  CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE product_category (
  category_id INT,
  category_name VARCHAR(100),
  CONSTRAINT pk_prodcategory PRIMARY KEY (category_id)
);


CREATE TABLE product (
  product_id INT,
  product_name VARCHAR(500),
  retail_price DECIMAL(8, 2),
  product_category_id INT,
  status VARCHAR(1),
  CONSTRAINT pk_product PRIMARY KEY (product_id),
  CONSTRAINT fk_prod_category FOREIGN KEY (product_category_id)
	REFERENCES product_category (category_id)
);



CREATE TABLE customer_order (
  order_id INT,
  customer_id INT,
  order_date DATE,
  CONSTRAINT pk_co PRIMARY KEY (order_id),
  CONSTRAINT fk_co_cust FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
);


CREATE TABLE order_line (
  order_line_id INT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  qty INT NOT NULL,
  price DECIMAL(8,2),
  CONSTRAINT pk_orderline PRIMARY KEY (order_line_id),
  CONSTRAINT fk_ol_order FOREIGN KEY (order_id)
    REFERENCES customer_order (order_id),
  CONSTRAINT fk_ol_prod FOREIGN KEY (product_id)
    REFERENCES product (product_id)
);


