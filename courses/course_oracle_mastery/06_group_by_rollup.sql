/*
Group By Rollup
*/

--SQL 01
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY ROLLUP(EXTRACT(YEAR FROM co.order_date), s.method_name)
ORDER BY order_year ASC, s.method_name ASC;

--SQL 02
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS(
  (EXTRACT(YEAR FROM co.order_date), s.method_name),
  EXTRACT(YEAR FROM co.order_date),
  ()
)
ORDER BY order_year ASC, s.method_name ASC;