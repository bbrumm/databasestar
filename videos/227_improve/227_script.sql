/* SQL 01 */
SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer
INNER JOIN account_status ON customer.status_id_text = account_status.id;

/* SQL 02 */
SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer AS c
INNER JOIN account_status AS a ON customer.status_id_text = account_status.id;

/* SQL 03 */
SELECT
customer.id,
customer.fname,
customer.email,
customer.company,
account_status.status_value
FROM customer AS c
INNER JOIN account_status AS a ON c.status_id_text = a.id;

/* SQL 04 */
SELECT
c.id,
c.fname,
c.email,
c.company,
a.status_value
FROM customer AS c
INNER JOIN account_status AS a ON c.status_id_text = a.id;


/* SQL 05 */
SELECT
c.id AS customer_id,
c.fname,
c.email,
c.company,
a.status_value
FROM customer AS c
INNER JOIN account_status AS a ON c.status_id_text = a.id;

/* SQL 06 */
SELECT
c.id,
c.fname,
c.email,
c.company,
c.status_id,
a.id,
a.status_value
FROM customer AS c
INNER JOIN account_status AS a ON c.status_id_text = a.id;