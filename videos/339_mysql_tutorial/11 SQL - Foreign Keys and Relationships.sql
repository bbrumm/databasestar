-- Video 339, Section 11: Foreign Keys and Relationships
-- Run the statements in order. Generated from the section script.


-- ---- Section 11: Foreign Keys and Relationships ----
USE online_store;


-- ---- Creating a Table with a Foreign Key ----
CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'Pending',
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

DESCRIBE orders;


-- ---- Inserting Related Data ----
INSERT INTO orders (customer_id, status) VALUES
  (1, 'Delivered'),
  (1, 'Delivered'),
  (1, 'Shipped'),
  (2, 'Delivered'),
  (2, 'Pending'),
  (4, 'Delivered'),
  (4, 'Shipped'),
  (5, 'Delivered'),
  (7, 'Pending'),
  (3, 'Delivered');

SELECT * FROM orders;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1452: foreign key stops an order for a customer that does not exist
-- -- ---- What the Foreign Key Protects ----
-- INSERT INTO orders (customer_id, status)
-- VALUES (99, 'Pending');

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1451: foreign key stops deleting a customer who has orders
-- DELETE FROM customers
-- WHERE customer_id = 1;


-- ---- Mini-Challenge ----
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (1, 1, 1),
  (1, 2, 1);

SELECT * FROM order_items;

INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (2, 8, 1),
  (3, 5, 2),
  (4, 6, 1),
  (4, 9, 2),
  (5, 10, 1),
  (6, 3, 1),
  (6, 2, 1),
  (7, 7, 1),
  (8, 4, 1),
  (8, 1, 1),
  (9, 9, 1),
  (10, 5, 1),
  (10, 3, 2);
