-- Video 339, Section 6: Data Types and Primary Keys
-- Run the statements in order. Generated from the section script.


-- ---- Section 6: Data Types and Primary Keys ----
USE online_store;

DESCRIBE customers;


-- ---- Primary Keys and AUTO_INCREMENT ----
ALTER TABLE customers
ADD COLUMN customer_id INT PRIMARY KEY AUTO_INCREMENT FIRST;

SELECT * FROM customers;


-- ---- NULL and NOT NULL ----
ALTER TABLE customers
ADD COLUMN email VARCHAR(255);

SELECT * FROM customers;

ALTER TABLE customers
MODIFY COLUMN name VARCHAR(100) NOT NULL;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1364: Field 'name' doesn't have a default value (NOT NULL in action)
-- INSERT INTO customers (email)
-- VALUES ('test@example.com');


-- ---- DEFAULT ----
ALTER TABLE customers
ADD COLUMN city VARCHAR(100) DEFAULT 'Melbourne';

SELECT * FROM customers;


-- ---- Adding More Customers ----
INSERT INTO customers (name, email, city) VALUES
  ('David Brown', 'david.brown@example.com', 'Sydney'),
  ('Eve Davis', 'eve.davis@example.com', 'Melbourne'),
  ('Frank Miller', 'frank.miller@example.com', 'Brisbane'),
  ('Alice Chen', 'alice.chen@example.com', 'Sydney'),
  ('Grace Wong', 'grace.wong@example.com', 'Perth');

SELECT * FROM customers;

DESCRIBE customers;


-- ---- Mini-Challenge ----
ALTER TABLE products
ADD COLUMN price DECIMAL(10,2),
ADD COLUMN stock_quantity INT,
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

INSERT INTO products (name, price, stock_quantity) VALUES
  ('Laptop Stand', 59.00, 20),
  ('Phone Charger', 24.95, 100);

SELECT * FROM products;
