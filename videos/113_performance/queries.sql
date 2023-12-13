/*
Original query
*/

WITH cte_source_data AS (
	SELECT 
    publication_date AS activity_date,
    COUNT(*) AS total
    FROM book
    GROUP BY publication_date
    
    UNION
    
    SELECT 
    order_date,
    COUNT(*) AS total
    FROM cust_order
    GROUP BY order_date
    
    UNION
    
    SELECT 
    status_date,
    COUNT(*) AS total
    FROM order_history
    GROUP BY status_date

)
SELECT
activity_date,
SUM(total) AS total
FROM cte_source_data
GROUP BY activity_date;


/*
Updated query
*/

WITH cte_source_data AS (
	SELECT 
    publication_date AS activity_date
    FROM book
    
    
    UNION
    
    SELECT 
    order_date
    FROM cust_order
    
    
    UNION
    
    SELECT 
    status_date
    
    FROM order_history
    

)
SELECT
activity_date,
COUNT(*) AS total
FROM cte_source_data
GROUP BY activity_date;