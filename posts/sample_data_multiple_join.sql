/*
Sample data for the Multiple Join post
*/

CREATE TABLE product_category (
  id INT,
  category_name VARCHAR(50)
);

CREATE TABLE product_item (
  id INT,
  item_name VARCHAR(100),
  category_id INT
);

INSERT INTO product_category (id, category_name) VALUES 
(1, 'Furniture'),
(2, 'Electronics');

INSERT INTO product_item (id, item_name, category_id) VALUES
(1, 'MacBook', 2),
(2, 'Desk Chair', 1),
(3, 'Couch', 1),
(4, 'Speakers', 2),
(5, 'Queen Bed', 1);

/*
Join two tables example
*/

SELECT
product_item.item_name,
product_category.category_name
FROM product_category
INNER JOIN product_item ON product_category.id = product_item.category_id;


/*
Join three tables
*/



CREATE TABLE supplier (
  id INT,
  supplier_name VARCHAR(100)
);

DROP TABLE product_item;

CREATE TABLE product_item (
  id INT,
  item_name VARCHAR(100),
  category_id INT,
  supplier_id INT
);

INSERT INTO supplier (id, supplier_name) VALUES
(1, 'Ikea'),
(2, 'Fantastic Furniture'),
(3, 'Apple'),
(4, 'Best Buy');

INSERT INTO product_item (id, item_name, category_id, supplier_id) VALUES
(1, 'MacBook', 2, 3),
(2, 'Desk Chair', 1, 1),
(3, 'Couch', 1, 1),
(4, 'Speakers', 2, 4),
(5, 'Queen Bed', 1, 1);

SELECT
product_item.item_name,
product_category.category_name,
supplier.supplier_name
FROM product_category
INNER JOIN product_item ON product_category.id = product_item.category_id
INNER JOIN supplier ON product_item.supplier_id = supplier.id;
