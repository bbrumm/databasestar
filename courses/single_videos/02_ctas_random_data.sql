--DROP TABLE all_customers;

CREATE TABLE all_customers (
  customer_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  max_credit NUMBER,
  created_date DATE,
  updated_date DATE,
  updated_count NUMBER
);


/*Takes approx 37 seconds to run. */
INSERT /*+ APPEND */ INTO all_customers
SELECT
td.customer_id,
sf.first_name,
sl.last_name,
td.max_credit,
td.created_date,
NULL as updated_date,
0 as updated_count
FROM (
  SELECT
  level AS customer_id,
  TRUNC(DBMS_RANDOM.value(1,1000)) AS fn_id,
  TRUNC(DBMS_RANDOM.value(1,1000)) AS ln_id,
  TRUNC(DBMS_RANDOM.value(100,10000)) AS max_credit,
  TRUNC(SYSDATE - DBMS_RANDOM.value(0,366)) AS created_date
  FROM dual
  CONNECT BY level <= 1000000
) td
LEFT OUTER JOIN (
  SELECT first_name, ROWNUM AS first_id
  FROM mock_data
) sf ON td.fn_id = sf.first_id
LEFT OUTER JOIN (
  SELECT last_name, ROWNUM AS last_id
  FROM mock_data
) sl ON td.ln_id = sl.last_id
ORDER BY td.customer_id ASC;
COMMIT;


CREATE INDEX idx_cust_fn ON all_customers(first_name);

CREATE INDEX idx_cust_crd ON all_customers(max_credit);



SELECT *
FROM all_customers;


