/*
Pivot and Filter
*/

--SQL 01
SELECT
c.country_name,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2021 THEN 1 ELSE 0 END) AS orders_2021,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2022 THEN 1 ELSE 0 END) AS orders_2022,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2023 THEN 1 ELSE 0 END) AS orders_2023,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2024 THEN 1 ELSE 0 END) AS orders_2024
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name
ORDER BY c.country_name ASC;


--SQL 02
SELECT
c.country_name,
COUNT(*) FILTER(WHERE EXTRACT('year' FROM co.order_date) = 2021) AS orders_2021,
COUNT(*) FILTER(WHERE EXTRACT('year' FROM co.order_date) = 2022) AS orders_2022,
COUNT(*) FILTER(WHERE EXTRACT('year' FROM co.order_date) = 2023) AS orders_2023,
COUNT(*) FILTER(WHERE EXTRACT('year' FROM co.order_date) = 2024) AS orders_2024
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name
ORDER BY c.country_name ASC;