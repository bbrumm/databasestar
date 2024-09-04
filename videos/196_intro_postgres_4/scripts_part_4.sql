/* SQL 01 */

SELECT
product_name,
price,
in_stock
FROM product;

/* SQL 02 */

CREATE TABLE supplier (
  supplier_name VARCHAR
);

/* SQL 03 */

INSERT INTO supplier (supplier_name)
VALUES ('Calvin Klein');

INSERT INTO supplier (supplier_name)
VALUES ('Nike');

/* SQL 04 */

SELECT supplier_name
FROM supplier;

/* SQL 05 */

ALTER TABLE supplier
ADD COLUMN supplier_id INTEGER;

/* SQL 06 */

UPDATE supplier
SET supplier_id = 1
WHERE supplier_name = 'Calvin Klein';

UPDATE supplier
SET supplier_id = 2
WHERE supplier_name = 'Nike';

/* SQL 07 */

SELECT
supplier_id,
supplier_name
FROM supplier;

/* SQL 08 */

ALTER TABLE product
ADD COLUMN supplier_id INTEGER;

/* SQL 09 */

UPDATE product
SET supplier_id = 1
WHERE product_name = 'Jeans';

UPDATE product
SET supplier_id = 2
WHERE product_name = 'Running shoes'
OR product_name = 'T-shirt';

/* SQL 10 */

SELECT
product_name,
price,
in_stock,
supplier_id
FROM product;