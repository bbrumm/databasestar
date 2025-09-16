-- Script to set up tables on Postgres
-- ==================================
-- Drop Tables if they already exist
-- (reverse dependency order)
-- ==================================
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS shipping;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sales_reps;

-- ========================
-- Create Tables
-- ========================

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100)
);

CREATE TABLE sales_reps (
    sales_rep_id SERIAL PRIMARY KEY,
    rep_name     VARCHAR(100)
);

CREATE TABLE products (
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price        NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id     SERIAL PRIMARY KEY,
    customer_id  INT REFERENCES customers(customer_id),
    order_date   DATE NOT NULL,
    sales_rep_id INT REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT REFERENCES orders(order_id),
    product_id    INT REFERENCES products(product_id),
    quantity      INT NOT NULL
);

CREATE TABLE payments (
    payment_id   SERIAL PRIMARY KEY,
    order_id     INT REFERENCES orders(order_id),
    payment_date DATE,
    amount       NUMERIC(10,2)
);

CREATE TABLE shipping (
    shipping_id  SERIAL PRIMARY KEY,
    order_id     INT REFERENCES orders(order_id),
    shipped_date DATE,
    status       VARCHAR(50)
);

CREATE TABLE employees (
    employee_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100),
    hire_date    DATE
);

CREATE TABLE salaries (
    salary_id    SERIAL PRIMARY KEY,
    employee_id  INT REFERENCES employees(employee_id),
    start_date   DATE NOT NULL,
    end_date     DATE,
    salary       NUMERIC(10,2) NOT NULL
);

-- ========================
-- Insert Sample Data
-- ========================

-- Customers
INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Anderson', 'alice@example.com'),
('Bob', 'Brown', 'bob@example.com'),
('Carol', 'Clark', 'carol@example.com');

-- Sales Reps
INSERT INTO sales_reps (rep_name) VALUES
('John Smith'),
('Sarah Jones');

-- Products
INSERT INTO products (product_name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Phone', 800.00),
('Monitor', 300.00);

-- Orders
INSERT INTO orders (customer_id, order_date, sales_rep_id) VALUES
(1, '2023-07-01', 1),  -- Alice’s order handled by John
(2, '2023-07-02', 2),  -- Bob’s order handled by Sarah
(3, '2023-07-05', 1);  -- Carol’s order handled by John

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),  -- Alice bought 2 Laptops
(1, 2, 1),  -- Alice bought 1 Mouse
(2, 3, 1),  -- Bob bought 1 Phone
(3, 4, 2);  -- Carol bought 2 Monitors

-- Payments
INSERT INTO payments (order_id, payment_date, amount) VALUES
(1, '2023-07-01', 2425.00), -- Alice paid
(3, '2023-07-06', 600.00);  -- Carol underpaid as example

-- Shipping
INSERT INTO shipping (order_id, shipped_date, status) VALUES
(1, '2023-07-03', 'Shipped'),
(3, '2023-07-07', 'Processing');

-- Employees
INSERT INTO employees (name, hire_date) VALUES
('David Lee', '2020-01-15'),
('Emma White', '2021-06-01'),
('Frank Hall', '2022-03-10');

-- Salaries
INSERT INTO salaries (employee_id, start_date, end_date, salary) VALUES
(1, '2020-01-01', '2020-12-31', 50000),   -- David’s first salary
(1, '2021-01-01', NULL,        55000),   -- David’s current salary
(2, '2021-06-01', NULL,        60000),   -- Emma’s salary
(3, '2022-03-01', '2022-12-31', 45000),  -- Frank’s first salary
(3, '2023-01-01', NULL,        48000);   -- Frank’s updated salary
