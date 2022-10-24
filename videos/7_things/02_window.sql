SELECT
order_id,
order_date,
order_total,
SUM(order_total) OVER (
    ORDER BY order_id ASC
) AS running_total
FROM orders
ORDER BY order_id ASC;