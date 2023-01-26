/*
Show data for customer orders per month
*/

/*
Orders, order lines, and shipping cost
*/

SELECT
co.order_id,
co.order_date,
sm.method_name,
sm.cost,
ol.book_id,
ol.price
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
INNER JOIN order_line ol ON co.order_id = ol.order_id;

/*
Group by order date and show different values
*/

SELECT
DATE(order_date) AS order_date,
COUNT(book_id) AS books_ordered,
SUM(shipping_cost) AS total_shipping_cost,
SUM(price) AS total_book_price,
SUM(shipping_cost) + SUM(price) AS total_order_amount
FROM (
	SELECT
	co.order_id,
	co.order_date,
	sm.method_name,
	sm.cost AS shipping_cost,
	ol.book_id,
	ol.price
	FROM cust_order co
	INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
	INNER JOIN order_line ol ON co.order_id = ol.order_id
) AS sub
GROUP BY DATE(order_date)
ORDER BY DATE(order_date) ASC;
