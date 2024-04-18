/*
Lesson 44
*/

--SQL 01
ALTER TABLE product_category
ADD parent_category_id INT;

--SQL 02
ALTER TABLE product_category
ADD CONSTRAINT fk_category_parent
FOREIGN KEY (parent_category_id)
REFERENCES product_category(category_id);

--SQL 03
SELECT
category_id,
category_name,
parent_category_id
FROM product_category;

--SQL 04
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (5, 'Outerwear', 2);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (6, 'Jackets', 5);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (7, 'Dress Shoes', 1);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (8, 'Jewellery', 4);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (9, 'Hats', 4);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (10, 'Necklaces', 8);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (11, 'Watches', 8);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (12, 'Pants', 3);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (13, 'Skirts', 3);
INSERT INTO product_category (category_id, category_name, parent_category_id)
VALUES (14, 'All Clothing', NULL);

--SQL 05
UPDATE product_category
SET parent_category_id = 14
WHERE category_id IN (1, 2, 3, 4);

--SQL 06
SELECT
c.category_id,
c.category_name,
c.parent_category_id,
p.category_name
FROM product_category p
INNER JOIN product_category c ON c.parent_category_id = p.category_id;


--SQL 07 - Insert without ID

INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Outerwear', 2);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Jackets', 5);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Dress Shoes', 1);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Jewellery', 4);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Hats', 4);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Necklaces', 8);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Watches', 8);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Pants', 3);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('Skirts', 3);
INSERT INTO product_category (category_name, parent_category_id)
VALUES ('All Clothing', NULL);




