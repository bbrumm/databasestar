SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY ROLLUP(DATEPART(YEAR, co.order_date), s.method_name)
ORDER BY order_year ASC, s.method_name ASC;


SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS(
  (DATEPART(YEAR, co.order_date), s.method_name),
  DATEPART(YEAR, co.order_date),
  ()
)
ORDER BY order_year ASC, s.method_name ASC;


