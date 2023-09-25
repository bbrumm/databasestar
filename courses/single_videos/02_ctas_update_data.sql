SELECT COUNT(*)
FROM all_customers
WHERE created_date >= SYSDATE - 90;


UPDATE all_customers
SET max_credit = max_credit * 1.25,
updated_date = SYSDATE,
updated_count = updated_count + 1
WHERE created_date >= SYSDATE - 90;


DROP TABLE all_customers_copy;



CREATE TABLE all_customers_copy AS
SELECT
customer_id,
first_name,
last_name,
CASE WHEN created_date >= SYSDATE - 90 THEN max_credit * 1.25 ELSE max_credit END max_credit,
created_date,
CASE WHEN created_date >= SYSDATE - 90 THEN SYSDATE ELSE updated_date END updated_date,
CASE WHEN created_date >= SYSDATE - 90 THEN updated_count + 1 ELSE updated_count END updated_count
FROM all_customers;


SELECT *
FROM all_tab_privs
WHERE table_name = 'ALL_CUSTOMERS';


SELECT
 i.owner,
 i.index_name,
 i.index_type,
 i.table_name,
 c.column_name,
 c.column_position 
 FROM all_indexes i
 JOIN all_ind_columns c ON i.index_name = c.index_name
 WHERE i.table_name = 'ALL_CUSTOMERS';




CREATE INDEX idx_custcopy_fn ON all_customers_copy(first_name);
CREATE INDEX idx_custcopy_crd ON all_customers_copy(max_credit);

ALTER TABLE all_customers RENAME TO all_customers_bk;
ALTER TABLE all_customers_copy RENAME TO all_customers;

SELECT * FROM all_customers;

