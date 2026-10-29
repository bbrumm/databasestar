--------------------------------------------------------------------------
-- 04_verify_setup.sql
-- Quick sanity checks after running 03_generate_bulk_data.sql.
--------------------------------------------------------------------------

SELECT 'REGIONS' AS table_name, COUNT(*) AS row_count FROM regions
UNION ALL
SELECT 'COUNTRIES', COUNT(*) FROM countries
UNION ALL
SELECT 'PRODUCT_CATEGORIES', COUNT(*) FROM product_categories
UNION ALL
SELECT 'WAREHOUSES', COUNT(*) FROM warehouses
UNION ALL
SELECT 'SALES_REPS', COUNT(*) FROM sales_reps
UNION ALL
SELECT 'CUSTOMERS', COUNT(*) FROM customers
UNION ALL
SELECT 'PRODUCTS', COUNT(*) FROM products
UNION ALL
SELECT 'ORDERS', COUNT(*) FROM orders
UNION ALL
SELECT 'ORDER_ITEMS', COUNT(*) FROM order_items
ORDER BY 1;

-- Spot-check: a few customers and their most recent order
SELECT c.customer_id, c.first_name, c.last_name, c.city,
       o.order_id, o.order_date, o.status, o.order_total
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE c.customer_id <= 5
ORDER BY c.customer_id, o.order_date DESC;

-- Spot-check: order with its line items
SELECT oi.order_id, oi.line_item_id, p.product_name, oi.quantity,
       oi.unit_price, oi.discount
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
WHERE oi.order_id = 1;

-- Sanity check: order_total should match the sum of its line items
SELECT o.order_id, o.order_total,
       (SELECT ROUND(SUM(quantity * unit_price * (1 - discount)), 2)
        FROM order_items oi WHERE oi.order_id = o.order_id) AS calculated_total
FROM orders o
WHERE ROWNUM <= 10;
