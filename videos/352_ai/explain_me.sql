SELECT c.customer_name,
  o.order_id,
  o.order_total,
  (SELECT COUNT(*)
   FROM orders o2
   WHERE o2.customer_id = c.customer_id) AS order_count
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '90 days'
  AND o.order_total > (SELECT AVG(order_total) FROM orders)
  AND c.customer_id NOT IN (SELECT customer_id FROM returns)
ORDER BY o.order_total DESC;