/*
Original query
*/

SELECT 
'Group A' AS data_group,
avg_val
FROM (
    SELECT
    ROUND(AVG(sub.val_count),2) AS avg_val
    FROM (
        SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
        COUNT(*) AS val_count
        FROM customer_order c
        WHERE order_id IN (
            SELECT order_id
            FROM order_line ol
            INNER JOIN product p ON ol.product_id = p.product_id 
            WHERE p.product_category_id = 5
            AND p.status = 'A'
        )
        GROUP BY FORMAT(order_date,'yyyy-MM')
    ) AS sub
) AS d         
UNION ALL
SELECT 
'Group B',
avg_val
FROM (
    SELECT 
    ROUND(AVG(sub.val_count),2) AS avg_val
    FROM (
        SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
        COUNT(*) AS val_count
        FROM customer_order c
        WHERE order_id IN (
            SELECT order_id
            FROM order_line ol
            INNER JOIN product p ON ol.product_id = p.product_id 
            WHERE p.product_category_id = 1
            AND p.retail_price > 15
        )
        GROUP BY FORMAT(order_date,'yyyy-MM')
    ) AS sub
) AS d
UNION ALL
SELECT
'Group C',
avg_val
FROM (
    SELECT 
    ROUND(AVG(sub.val_count),2) AS avg_val
    FROM (
        SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
        COUNT(*) AS val_count
        FROM customer_order c
        WHERE order_id IN (
            SELECT order_id
            FROM order_line ol
            INNER JOIN product p ON ol.product_id = p.product_id 
            WHERE p.product_category_id = 3
            AND p.product_name LIKE '%Pasta%'
        )
        GROUP BY FORMAT(order_date,'yyyy-MM')
    ) AS sub
) AS d
ORDER BY 1;


