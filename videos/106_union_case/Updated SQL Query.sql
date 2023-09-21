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




/*
Step 1 - Get all of the product and order columns needed,
using a combination of the criteria above
*/

SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
p.product_category_id,
p.product_name,
p.retail_price,
p.status,
c.order_id
FROM customer_order c
INNER JOIN order_line ol ON c.order_id = ol.order_id
INNER JOIN product p ON ol.product_id = p.product_id 
WHERE (
    p.product_category_id = 5
    AND p.status = 'A'
) OR (
    p.product_category_id = 1
    AND p.retail_price > 15
) OR (
    p.product_category_id = 3
    AND p.product_name LIKE '%Pasta%'
);

/*
Step 2 - Add CASE statements to determine a value
for each of the groups to be counted
*/


SELECT
order_month,
CASE WHEN sub.product_category_id = 5 AND sub.status = 'A' THEN sub.order_id ELSE NULL END order_id_a,
CASE WHEN sub.product_category_id = 1 AND sub.retail_price > 15 THEN sub.order_id ELSE NULL END order_id_b,
CASE WHEN sub.product_category_id = 3 AND sub.product_name LIKE '%Pasta%' THEN sub.order_id ELSE NULL END order_id_c
FROM (
    SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
    p.product_category_id,
    p.product_name,
    p.retail_price,
    p.status,
    c.order_id
    FROM customer_order c
    INNER JOIN order_line ol ON c.order_id = ol.order_id
    INNER JOIN product p ON ol.product_id = p.product_id 
    WHERE (
        p.product_category_id = 5
        AND p.status = 'A'
    ) OR (
        p.product_category_id = 1
        AND p.retail_price > 15
    ) OR (
        p.product_category_id = 3
        AND p.product_name LIKE '%Pasta%'
    )
) sub;



/*
Step 3 - Select the COUNT by month for each group
*/

SELECT
order_month,
COUNT(DISTINCT order_id_a) AS count_a,
COUNT(DISTINCT order_id_b) AS count_b,
COUNT(DISTINCT order_id_c) AS count_c
FROM (
    SELECT
    order_month,
    CASE WHEN sub.product_category_id = 5 AND sub.status = 'A' THEN sub.order_id ELSE NULL END order_id_a,
    CASE WHEN sub.product_category_id = 1 AND sub.retail_price > 15 THEN sub.order_id ELSE NULL END order_id_b,
    CASE WHEN sub.product_category_id = 3 AND sub.product_name LIKE '%Pasta%' THEN sub.order_id ELSE NULL END order_id_c
    FROM (
        SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
        p.product_category_id,
        p.product_name,
        p.retail_price,
        p.status,
        c.order_id
        FROM customer_order c
        INNER JOIN order_line ol ON c.order_id = ol.order_id
        INNER JOIN product p ON ol.product_id = p.product_id 
        WHERE (
            p.product_category_id = 5
            AND p.status = 'A'
        ) OR (
            p.product_category_id = 1
            AND p.retail_price > 15
        ) OR (
            p.product_category_id = 3
            AND p.product_name LIKE '%Pasta%'
        )
    ) sub
) sub2
GROUP BY order_month;




/*
Step 4 - Select the average for each group, and round it to 2 places
*/

SELECT 
ROUND(AVG(count_a), 2) AS avg_a,
ROUND(AVG(count_b), 2) AS avg_b,
ROUND(AVG(count_c), 2) AS avg_c
FROM (
    SELECT
    order_month,
    COUNT(DISTINCT order_id_a) AS count_a,
    COUNT(DISTINCT order_id_b) AS count_b,
    COUNT(DISTINCT order_id_c) AS count_c
    FROM (
        SELECT
        order_month,
        CASE WHEN sub.product_category_id = 5 AND sub.status = 'A' THEN sub.order_id ELSE NULL END order_id_a,
        CASE WHEN sub.product_category_id = 1 AND sub.retail_price > 15 THEN sub.order_id ELSE NULL END order_id_b,
        CASE WHEN sub.product_category_id = 3 AND sub.product_name LIKE '%Pasta%' THEN sub.order_id ELSE NULL END order_id_c
        FROM (
            SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
            p.product_category_id,
            p.product_name,
            p.retail_price,
            p.status,
            c.order_id
            FROM customer_order c
            INNER JOIN order_line ol ON c.order_id = ol.order_id
            INNER JOIN product p ON ol.product_id = p.product_id 
            WHERE (
                p.product_category_id = 5
                AND p.status = 'A'
            ) OR (
                p.product_category_id = 1
                AND p.retail_price > 15
            ) OR (
                p.product_category_id = 3
                AND p.product_name LIKE '%Pasta%'
            )
        ) sub
    ) sub2
    GROUP BY order_month    
) sub3;



/*
Step 5 - Use UNPIVOT to translate into rows
*/


SELECT
CASE data_group
	WHEN 'avg_a' THEN 'Group A'
	WHEN 'avg_b' THEN 'Group B'
	WHEN 'avg_c' THEN 'Group C'
END AS data_group,
avg_val
FROM (
    SELECT 
    ROUND(AVG(count_a), 2) AS avg_a,
    ROUND(AVG(count_b), 2) AS avg_b,
    ROUND(AVG(count_c), 2) AS avg_c
    FROM (
        SELECT
        order_month,
        COUNT(DISTINCT order_id_a) AS count_a,
        COUNT(DISTINCT order_id_b) AS count_b,
        COUNT(DISTINCT order_id_c) AS count_c
        FROM (
            SELECT
            order_month,
            CASE WHEN sub.product_category_id = 5 AND sub.status = 'A' THEN sub.order_id ELSE NULL END order_id_a,
            CASE WHEN sub.product_category_id = 1 AND sub.retail_price > 15 THEN sub.order_id ELSE NULL END order_id_b,
            CASE WHEN sub.product_category_id = 3 AND sub.product_name LIKE '%Pasta%' THEN sub.order_id ELSE NULL END order_id_c
            FROM (
                SELECT FORMAT(order_date, 'yyyy-MM') AS order_month,
                p.product_category_id,
                p.product_name,
                p.retail_price,
                p.status,
                c.order_id
                FROM customer_order c
                INNER JOIN order_line ol ON c.order_id = ol.order_id
                INNER JOIN product p ON ol.product_id = p.product_id 
                WHERE (
                    p.product_category_id = 5
                    AND p.status = 'A'
                ) OR (
                    p.product_category_id = 1
                    AND p.retail_price > 15
                ) OR (
                    p.product_category_id = 3
                    AND p.product_name LIKE '%Pasta%'
                )
            ) sub
        ) sub2
        GROUP BY order_month    
    ) sub3
) AS pivoted_table
UNPIVOT (
  avg_val FOR data_group IN (avg_a, avg_b, avg_c)
  ) AS unpivot_table;

