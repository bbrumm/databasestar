/*
Frame Between
*/

--SQL 01
SELECT
order_date::date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER(ORDER BY order_date::date)
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY order_date::date
ORDER BY order_date::date ASC;

--SQL 02
SELECT
order_date::date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER (
    ORDER BY order_date::date ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING
)
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY order_date::date
ORDER BY order_date::date ASC;

--SQL 03
SELECT
order_date::date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER (
    ORDER BY order_date::date ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
)
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY order_date::date
ORDER BY order_date::date ASC;
