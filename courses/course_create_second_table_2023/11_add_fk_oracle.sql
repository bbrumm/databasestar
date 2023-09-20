/*
Lesson 11
Oracle
*/

ALTER TABLE product
ADD supplier_id NUMBER(20);

ALTER TABLE product
ADD CONSTRAINT fk_product_supplierid
FOREIGN KEY (supplier_id)
REFERENCES supplier (supplier_id);


UPDATE product
SET supplier_id = 4
WHERE product_name = 'Black and white running shoes';

UPDATE product
SET supplier_id = 5
WHERE product_name = 'Red and black running shoes';

UPDATE product
SET supplier_id = 1
WHERE product_name = 'Jumper';

UPDATE product
SET supplier_id = 3
WHERE product_name = 'Shirt';

UPDATE product
SET supplier_id = 1
WHERE product_name = 'Black dress';

UPDATE product
SET supplier_id = 2
WHERE product_name = 'Slippers';


SELECT
product_name,
price,
supplier_name,
supplier_id
FROM product;

ALTER TABLE product
DROP COLUMN supplier_name;


SELECT
product_name,
price,
supplier_id
FROM product;

