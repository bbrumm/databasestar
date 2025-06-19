SELECT
CONVERT(date, co.order_date) AS order_date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER(ORDER BY CONVERT(date, co.order_date)) AS running_total
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY CONVERT(date, co.order_date)
ORDER BY CONVERT(date, co.order_date) ASC;


SELECT
CONVERT(date, co.order_date) AS order_date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER (
    ORDER BY CONVERT(date, co.order_date) ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING
) AS total_frame
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY CONVERT(date, co.order_date)
ORDER BY CONVERT(date, co.order_date) ASC;


SELECT
CONVERT(date, co.order_date) AS order_date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER (
    ORDER BY CONVERT(date, co.order_date) ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
) AS total_frame
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY CONVERT(date, co.order_date)
ORDER BY CONVERT(date, co.order_date) ASC;