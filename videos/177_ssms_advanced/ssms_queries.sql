/* SQL 01 */

INSERT INTO order_line(line_id, order_id, book_id, price) VALUES
(15401, 4770, 45, 13),
(15402, 4770, 48, 13),
(15403, 4770, 21, 13),
(15404, 4770, 18, 13),
(15405, 4770, 09, 13);


/* SQL 02 */

SELECT
book_id,
title,
isbn13,
language_id,
num_pages,
publication_date
FROM book;

/* SQL 03 */

CREATE TABLE courier (
    id INTEGER,
    courier_name VARCHAR(100)
);

/* SQL 04 */

SELECT id, courier_name
FROM courier;

/* SQL 05 */

SELECT *
FROM c

/* SQL 06 */

SELECT
language_id,
language_code,
language_name
FROM language;

/* SQL 07 */

SELECT
book_id,
title,
isbn13,
language_id,
num_pages,
publication_date
FROM book;

/* SQL 08 */

SELECT
book_id,
title,
isbn13,
language_id,
num_pages,
publication_date
FROM book
WHERE num_pages < 200;

/* SQL 09 */

SELECT
title,
publication_date,
YEAR(publication_date) AS publication_year
FROM book;

/* SQL 10 */

SELECT
'Group A' AS order_group,
co.order_id,
co.order_date,
c.customer_id,
c.email,
ct.country_name
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country ct ON a.country_id = ct.country_id
WHERE sm.method_name = 'Express'

UNION ALL

SELECT
'Group B' AS order_group,
co.order_id,
co.order_date,
c.customer_id,
c.email,
ct.country_name
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country ct ON a.country_id = ct.country_id
WHERE ct.country_name = 'Canada'
ORDER BY order_id ASC;
