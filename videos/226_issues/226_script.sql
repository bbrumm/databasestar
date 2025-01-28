/* SQL 01 */

SELECT
id,
fname,
email,
company,
status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;

/* SQL 02 */

SELECT
customer.id,
fname,
email,
company,
status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;

/* SQL 03 */

SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;

/* SQL 04 */

SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer
LEFT JOIN account_status ON customer.status_id = account_status.id;

/* SQL 05 */

SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer
RIGHT JOIN account_status ON customer.status_id = account_status.id;

/* SQL 06 */

ALTER TABLE customer
ADD COLUMN status_id_text VARCHAR(5);

/* SQL 07 */

UPDATE customer
SET status_id_text = '01'
WHERE status_id = 1;

UPDATE customer
SET status_id_text = '2'
WHERE status_id = 2;

UPDATE customer
SET status_id_text = '3 '
WHERE status_id = 3;

/* SQL 08 */
SELECT *
FROM customer;

/* SQL 09 */

SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer
INNER JOIN account_status ON customer.status_id_text = account_status.id;




