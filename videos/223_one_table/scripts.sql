/* 
Video 223 scripts
*/

/* SQL 01 */

CREATE TABLE customer (
  id INT,
  fname VARCHAR(200),
  email VARCHAR(350),
  company VARCHAR(200),
  account_status VARCHAR(20),
  CONSTRAINT pk_customer PRIMARY KEY (id)
);

/* SQL 02 */

INSERT INTO customer (id, fname, email, company, account_status) VALUES
(1, 'Mary', 'mary@abc.com', 'ABC Inc', 'Active'),
(2, 'John', 'jsmith@orange.com', 'Orange', 'Pending'),
(3, 'Sarah', 'sjones@starkindustries.com', 'Stark Industries', 'Active'),
(4, 'Chris', 'chrisandrews@temple.co.uk', 'Temple Co.', 'Cancelled'),
(5, 'Matt', 'mjohnson@orange.com', 'Orange', 'Cancelled');

/* SQL 03 */

SELECT
id,
fname,
email,
company,
account_status
FROM customer;

/* SQL 04 */

INSERT INTO customer (id, fname, email, company, account_status) VALUES
(6, 'Simone', 'simoneb@abc.com', 'ABC', 'Actvie');

/* SQL 05 */

SELECT
id,
fname,
email,
company,
account_status
FROM customer
WHERE account_status = 'Active';

/* SQL 06 */

INSERT INTO customer (id, fname, email, company, account_status) VALUES
(7, 'Claire', 'claire@intel.com', 'Intel', 'Open');

/* SQL 07 */

UPDATE customer
SET account_status = 'Inactive'
WHERE id = 4;

/* SQL 08 */

DELETE FROM customer
WHERE id = 2;

/* SQL 09 */

CREATE TABLE account_status (
  id INT,
  status_value VARCHAR(20),
  CONSTRAINT pk_accstatus PRIMARY KEY (id)
);

/* SQL 10 */

INSERT INTO account_status (id, status_value) VALUES
(1, 'Active'),
(2, 'Pending'),
(3, 'Cancelled');

/* SQL 11 */

SELECT id, status_value
FROM account_status;

/* SQL 12 */

SELECT
id,
fname,
email,
company,
account_status
FROM customer;

/* SQL 13 */

ALTER TABLE customer
ADD COLUMN status_id INT;

/* SQL 14 */

ALTER TABLE customer
ADD CONSTRAINT fk_comp_accstatus
FOREIGN KEY (status_id)
REFERENCES account_status (id);

/* SQL 15 */

SELECT
id,
fname,
email,
company,
account_status,
status_id
FROM customer;

/* SQL 16 */

UPDATE customer
SET status_id = 1
WHERE id IN (1, 3, 6);

/* SQL 17 */

UPDATE customer
SET status_id = 2
WHERE id IN (7);

UPDATE customer
SET status_id = 3
WHERE id IN (4, 5);

/* SQL 18 */

ALTER TABLE customer
DROP COLUMN account_status;

/* SQL 19 */

SELECT
id,
fname,
email,
company,
status_id
FROM customer;