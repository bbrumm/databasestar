-- Script to set up tables on Postgres
-- ==================================
-- Drop Tables if they already exist
-- (reverse dependency order)
-- ==================================
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS shipping_method;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ========================
-- Create Tables
-- ========================

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100)
);

CREATE TABLE products (
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price        NUMERIC(10,2)
);

CREATE TABLE shipping_method (
    shipping_method_id  SERIAL PRIMARY KEY,
    method_name  TEXT
);

CREATE TABLE orders (
    order_id     SERIAL PRIMARY KEY,
    customer_id  INT,
    method_id    INT,
    order_date   DATE NOT NULL,
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_order_shup FOREIGN KEY (method_id) REFERENCES shipping_method(shipping_method_id)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT NOT NULL,
    CONSTRAINT fk_ordit_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_ordit_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id   SERIAL PRIMARY KEY,
    order_id     INT,
    payment_date DATE,
    amount       NUMERIC(10,2),
    CONSTRAINT fk_pay_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE employees (
    employee_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100),
    hire_date    DATE,
    manager_id   INT,
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE salaries (
    salary_id    SERIAL PRIMARY KEY,
    employee_id  INT,
    start_date   DATE NOT NULL,
    end_date     DATE,
    salary       NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_sal_emp FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- ========================
-- Insert Sample Data
-- ========================

-- Customers
INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
(1, 'Alice', 'Anderson', 'alice@example.com'),
(2, 'Bob', 'Jones', 'bob@example.com'),
(3, 'Carol', 'Clark', 'carol@example.com'),
(4, 'Diane', 'Smith', 'diane@example.com');


-- Products
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.00),
(3, 'Phone', 800.00),
(4, 'Monitor', 300.00);

--Shipping Method
INSERT INTO shipping_method (shipping_method_id, method_name) VALUES
(1, 'Standard'),
(2, 'Priority'),
(3, 'Express');

-- Orders
INSERT INTO orders (order_id, customer_id, method_id, order_date) VALUES
(1, 2, 1, '2025-07-01'),
(2, 1, 2, '2025-07-02'),
(3, NULL, 1, '2025-07-05'),
(4, 2, 3, '2025-07-05'),
(5, 3, 3, '2025-07-06'),
(6, 2, 3, '2025-07-06'),
(7, NULL, 3, '2025-07-06'),
(8, 1, 3, '2025-07-07'),
(9, 1, 3, '2025-07-07'),
(10, 3, 3, '2025-07-08');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 2),
(4, 1, 1),
(5, 2, 8),
(5, 4, 4),
(6, 1, 1),
(6, 2, 1),
(6, 3, 1),
(6, 4, 1),
(7, 3, 2),
(8, 4, 10),
(9, 4, 1),
(10, 1, 1),
(10, 4, 1);

-- Payments
INSERT INTO payments (order_id, payment_date, amount) VALUES
(1, '2025-07-01', 2425),
(3, '2025-07-06', 600),
(4, '2025-07-05', 500),
(5, '2025-07-08', 920),
(6, '2025-07-06', 1300),
(6, '2025-07-13', 480),
(7, '2025-07-09', 210),
(8, '2025-07-07', 500);


-- Employees
INSERT INTO employees (id, name, hire_date, manager_id) VALUES
(1, 'David', '2020-01-15', 2),
(2, 'Emma', '2021-06-01', NULL),
(3, 'Frank', '2022-03-10', 2),
(4, 'Sarah', '2022-04-01', 1);

-- Salaries
INSERT INTO salaries (employee_id, start_date, end_date, salary) VALUES
(1, '2020-01-01', '2020-12-31', 50000),
(1, '2021-01-01', NULL,        55000),
(2, '2021-06-01', NULL,        60000),
(3, '2022-03-01', '2022-12-31', 45000),
(3, '2023-01-01', NULL,        48000);
