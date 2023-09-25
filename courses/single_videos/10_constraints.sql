/*
Primary Key
*/
--Primary Key - new, column
CREATE TABLE product (
    product_id NUMBER(10) PRIMARY KEY,
    product_name VARCHAR(200),
    category_id NUMBER(10),
    price NUMBER(12,2),
    colour VARCHAR(20),
    active VARCHAR(1)
);


--Primary Key - new, table
CREATE TABLE product2 (
    product_id NUMBER(10),
    product_name VARCHAR(200),
    category_id NUMBER(10),
    price NUMBER(12,2),
    colour VARCHAR(20),
    active VARCHAR(1),
    CONSTRAINT pk_prod_id PRIMARY KEY (product_id, product_name)
);


--Primary key - alter with existing data
CREATE TABLE product3 (
    product_id NUMBER(10),
    product_name VARCHAR(200),
    category_id NUMBER(10),
    price NUMBER(12,2),
    colour VARCHAR(20),
    active VARCHAR(1)

);

INSERT ALL
INTO product3 (product_id, product_name, category_id, price, colour, active) VALUES (1, 'Couch', 4, 199.95, 'Grey', 'Y')
INTO product3 (product_id, product_name, category_id, price, colour, active) VALUES (2, 'Armchair', 4, 45, 'Black', 'Y')
INTO product3 (product_id, product_name, category_id, price, colour, active) VALUES (2, 'Rug', NULL, 79, 'Red', 'Y')
INTO product3 (product_id, product_name, category_id, price, colour, active) VALUES (NULL, 'Pot with lid', 3, 15, 'Blue', 'Y')
SELECT * FROM dual;

ALTER TABLE product3
ADD PRIMARY KEY (product_id);


--Primary Key - update data and try again
UPDATE product3
SET product_id = 3
WHERE product_name = 'Rug';

UPDATE product3
SET product_id = 4
WHERE product_name = 'Pot with lid';

ALTER TABLE product3
ADD PRIMARY KEY (product_id);


/*
Foreign Key
*/

--Column
CREATE TABLE order_line (
    order_line_id NUMBER(10),
    order_id NUMBER(10),
    product_id NUMBER(10) REFERENCES product(product_id),
    qty NUMBER(10)
);


--Table
CREATE TABLE order_line2 (
    order_line_id NUMBER(10),
    order_id NUMBER(10),
    product_id NUMBER(10),
    qty NUMBER(10),
    CONSTRAINT fk_ol_prodid FOREIGN KEY (product_id) REFERENCES product(product_id)
);

--Alter table
CREATE TABLE order_line3 (
    order_line_id NUMBER(10),
    order_id NUMBER(10),
    product_id NUMBER(10),
    qty NUMBER(10)
);

INSERT INTO order_line3 (order_line_id, order_id, product_id, qty)
VALUES (1, 1, 1, 5);
INSERT INTO order_line3 (order_line_id, order_id, product_id, qty)
VALUES (2, 1, 3, 1);
INSERT INTO order_line3 (order_line_id, order_id, product_id, qty)
VALUES (3, 2, 4, 10);

ALTER TABLE order_line3
ADD CONSTRAINT fk_old_prodid FOREIGN KEY (product_id) REFERENCES product3(product_id);

SELECT *
FROM product3;


--On Delete Cascade
CREATE TABLE order_line4 (
    order_line_id NUMBER(10),
    order_id NUMBER(10),
    product_id NUMBER(10) REFERENCES product(product_id) ON DELETE CASCADE,
    qty NUMBER(10)
);

INSERT INTO product(product_id, product_name, category_id, price, colour, active)
VALUES (5, 'Desk', 4, 150, 'White', 'Y');

INSERT INTO order_line4 (order_line_id, order_id, product_id, qty)
VALUES (4, 3, 5, 2);


SELECT *
FROM product;

SELECT *
FROM order_line4;

DELETE FROM product
WHERE product_id = 5;

SELECT *
FROM product;

SELECT *
FROM order_line4;

--On Delete Set Null
CREATE TABLE order_line5 (
    order_line_id NUMBER(10),
    order_id NUMBER(10),
    product_id NUMBER(10) REFERENCES product(product_id) ON DELETE SET NULL,
    qty NUMBER(10)
);

INSERT INTO product(product_id, product_name, category_id, price, colour, active)
VALUES (6, 'Basket', 2, 8.50, 'Yellow', 'Y');

INSERT INTO order_line5 (order_line_id, order_id, product_id, qty)
VALUES (5, 3, 6, 1);

SELECT *
FROM product;

SELECT *
FROM order_line5;

DELETE FROM product
WHERE product_id = 6;

SELECT *
FROM product;

SELECT *
FROM order_line5;


/*
Not Null
*/

--Column
CREATE TABLE cust_order (
    order_id NUMBER(10),
    order_date DATE,
    ship_to_address VARCHAR2(500) NOT NULL
);

--Insert data
INSERT INTO cust_order (order_id, order_date, ship_to_address)
VALUES (1, SYSDATE, '10 Main Street');

INSERT INTO cust_order (order_id, order_date, ship_to_address)
VALUES (2, SYSDATE, NULL);

INSERT INTO cust_order (order_id, order_date)
VALUES (3, SYSDATE);

--Alter Table
CREATE TABLE cust_order2 (
    order_id NUMBER(10),
    order_date DATE,
    ship_to_address VARCHAR2(500)
);

ALTER TABLE cust_order2
MODIFY (ship_to_address NOT NULL);


INSERT INTO cust_order (order_id, order_date, ship_to_address)
VALUES (4, SYSDATE, '52 Long Road');


/*
Unique Constraint
*/

--Column
CREATE TABLE customer (
    customer_id NUMBER(10),
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(500),
    tax_number NUMBER(15) UNIQUE
);

INSERT INTO customer (customer_id, customer_name, customer_address, tax_number)
VALUES (1, 'John Smith', '10 Main Street', '10983274');

INSERT INTO customer (customer_id, customer_name, customer_address, tax_number)
VALUES (2, 'Sue Jones', '15 Long Road', '583091203');

INSERT INTO customer (customer_id, customer_name, customer_address, tax_number)
VALUES (3, 'Peter Davidson', '23 Stony Drive', '583091203');

--Table
CREATE TABLE customer2 (
    customer_id NUMBER(10),
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(500),
    tax_number NUMBER(15),
    CONSTRAINT uc_cust_taxnum UNIQUE (tax_number)
);

--Alter Table
CREATE TABLE customer3 (
    customer_id NUMBER(10),
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(500),
    tax_number NUMBER(15)
);

ALTER TABLE customer3
ADD CONSTRAINT uc_cust_taxnum2 UNIQUE (tax_number);


--Multiple columns
CREATE TABLE customer4 (
    customer_id NUMBER(10),
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(500),
    tax_number NUMBER(15),
    CONSTRAINT uc_cust_nmadd UNIQUE (customer_name, customer_address)
);


INSERT INTO customer4 (customer_id, customer_name, customer_address, tax_number)
VALUES (1, 'John Smith', '10 Main Street', '10983274');

INSERT INTO customer4 (customer_id, customer_name, customer_address, tax_number)
VALUES (2, 'Sue Jones', '15 Long Road', '583091203');

INSERT INTO customer4 (customer_id, customer_name, customer_address, tax_number)
VALUES (3, 'Sue Jones', '44 Station Street', '3423412');

INSERT INTO customer4 (customer_id, customer_name, customer_address, tax_number)
VALUES (4, 'Tom Anderson', '44 Station Street', '98109245');

INSERT INTO customer4 (customer_id, customer_name, customer_address, tax_number)
VALUES (5, 'Sue Jones', '44 Station Street', '12461409');

INSERT INTO customer4 (customer_id, customer_name, customer_address, tax_number)
VALUES (6, 'Sue Jones', NULL, '41230947');


/*
Check Constraint
*/

--Column
CREATE TABLE customer5 (
    customer_id NUMBER(10),
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(500),
    tax_number NUMBER(15),
    max_credit NUMBER(10) CHECK (max_credit BETWEEN 100 AND 100000)
);


INSERT INTO customer5 (customer_id, customer_name, customer_address, tax_number, max_credit)
VALUES (1, 'John Smith', '10 Main Street', '10983274', 2000);

INSERT INTO customer5 (customer_id, customer_name, customer_address, tax_number, max_credit)
VALUES (2, 'Sue Jones', '15 Long Road', '583091203', 110000);

INSERT INTO customer5 (customer_id, customer_name, customer_address, tax_number, max_credit)
VALUES (3, 'Peter Davidson', '23 Stony Drive', '583091203', 30);


--Table
CREATE TABLE customer6 (
    customer_id NUMBER(10),
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(500),
    tax_number NUMBER(15),
    customer_type VARCHAR2(3),
    max_credit NUMBER(10),
    CONSTRAINT cc_credit_type CHECK (
        CASE
        WHEN customer_type = 'BUS' AND max_credit BETWEEN 100 AND 100000 THEN 1
        WHEN customer_type = 'PER' AND max_credit BETWEEN 0 AND 1000 THEN 1
        ELSE 0
        END = 1)
);

INSERT INTO customer6 (customer_id, customer_name, customer_address, tax_number, customer_type, max_credit)
VALUES (1, 'John Smith', '10 Main Street', '10983274', 'PER', 2000);

INSERT INTO customer6 (customer_id, customer_name, customer_address, tax_number, customer_type, max_credit)
VALUES (2, 'Sue Jones', '15 Long Road', '583091203', 'PER', 100);

INSERT INTO customer6 (customer_id, customer_name, customer_address, tax_number, customer_type, max_credit)
VALUES (3, 'AB Plumbing', '4 Long Road', '13425123', 'BUS', 5000);

INSERT INTO customer6 (customer_id, customer_name, customer_address, tax_number, customer_type, max_credit)
VALUES (4, 'XYZ Supplies', '22 Round Road', '13425123', 'BUS', 20);





