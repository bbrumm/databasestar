SELECT
co.order_id,
co.order_date,
c.email,
sm.method_name
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
ORDER BY co.order_date ASC
LIMIT 10 OFFSET 0;

CREATE INDEX idx_co_orderdate
ON cust_order (order_date);

DROP INDEX idx_co_orderdate;