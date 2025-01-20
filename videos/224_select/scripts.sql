/* Prepare */
UPDATE customer
SET status_id = NULL
WHERE id = 7;

/* SQL 01 */

SELECT
id,
fname,
email,
company,
status_id
FROM customer;

/* SQL 02 */

SELECT
id,
status_value
FROM account_status;

/* SQL 03 */

SELECT
id,
fname,
email,
company,
status_id,
status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;

/* SQL 04 */

SELECT
customer.id,
fname,
email,
company,
status_id,
status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;


/* SQL 05 */

SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
customer.status_id,
account_status.status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;

/* SQL 06 */

SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer
INNER JOIN account_status ON customer.status_id = account_status.id;