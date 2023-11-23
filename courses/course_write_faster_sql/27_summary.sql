SELECT
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
COUNT(DISTINCT co.order_id) AS order_count,
SUM(ol.price) AS order_value
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date) ASC, MONTH(order_date) ASC;

CREATE TABLE order_summary (
	order_year INT,
    order_month INT,
    order_count INT,
    order_value INT
);

DROP TABLE order_summary;

INSERT INTO order_summary (order_year, order_month, order_count, order_value)
SELECT
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
COUNT(DISTINCT co.order_id) AS order_count,
SUM(ol.price) AS order_value
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY YEAR(order_date), MONTH(order_date);

SELECT
order_year,
order_month,
order_count,
order_value
FROM order_summary
ORDER BY order_year ASC, order_month ASC;

