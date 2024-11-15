/* SQL 01 */

SELECT
product_id,
product_name,
supplier_id,
price
FROM product;

/* SQL 02 */

UPDATE product
SET price = 300
WHERE product_name = 'Jeans';

/* SQL 03 */

SELECT *
FROM product;

/* SQL 04 */

UPDATE product
SET price = 35, product_name = 'Simple shoes'
WHERE product_name = 'Brown dress shoes';

/* SQL 05 */

UPDATE product
SET price = 95
WHERE supplier_id = 2;

/* SQL 06 */
UPDATE product
SET price = price * 0.8
WHERE price > 50;

/* SQL 07 */

UPDATE product
SET price = 200;

/* run code to update to previous price values */

/* SQL 08 */

UPDATE product
SET price = price * 1.1
WHERE price > 100;

SELECT *
FROM product
WHERE price > 100;