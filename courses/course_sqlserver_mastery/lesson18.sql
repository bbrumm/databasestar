SELECT
DATEPART(YEAR, co.order_date) AS order_year,
c.country_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY DATEPART(YEAR, co.order_date), c.country_name
ORDER BY DATEPART(YEAR, co.order_date) ASC, c.country_name ASC;


SELECT
c.country_name,
CASE WHEN DATEPART(YEAR, co.order_date) = 2022 THEN 1 ELSE 0 END AS orders_2022,
CASE WHEN DATEPART(YEAR, co.order_date) = 2023 THEN 1 ELSE 0 END AS orders_2023,
CASE WHEN DATEPART(YEAR, co.order_date) = 2024 THEN 1 ELSE 0 END AS orders_2024,
CASE WHEN DATEPART(YEAR, co.order_date) = 2025 THEN 1 ELSE 0 END AS orders_2025
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
ORDER BY c.country_name ASC;


SELECT
co.order_id,
c.country_name,
CASE WHEN DATEPART(YEAR, co.order_date) = 2022 THEN 1 ELSE 0 END AS orders_2022,
CASE WHEN DATEPART(YEAR, co.order_date) = 2023 THEN 1 ELSE 0 END AS orders_2023,
CASE WHEN DATEPART(YEAR, co.order_date) = 2024 THEN 1 ELSE 0 END AS orders_2024,
CASE WHEN DATEPART(YEAR, co.order_date) = 2025 THEN 1 ELSE 0 END AS orders_2025
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
ORDER BY c.country_name ASC;


SELECT
c.country_name,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2022 THEN 1 ELSE 0 END) AS orders_2022,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2023 THEN 1 ELSE 0 END) AS orders_2023,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2024 THEN 1 ELSE 0 END) AS orders_2025
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name
ORDER BY c.country_name ASC;