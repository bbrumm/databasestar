SELECT
customer_id,
email
FROM customer;

CREATE INDEX idx_cust_idemail
ON customer (customer_id, email);
