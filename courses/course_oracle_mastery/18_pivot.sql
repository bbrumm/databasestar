/*
Pivot
*/


--SQL 01
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
c.country_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY EXTRACT(YEAR FROM co.order_date), c.country_name
ORDER BY EXTRACT(YEAR FROM co.order_date) ASC, c.country_name ASC;

--SQL 02
SELECT
c.country_name,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2021 THEN 1 ELSE 0 END AS orders_2021,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2022 THEN 1 ELSE 0 END AS orders_2022,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2023 THEN 1 ELSE 0 END AS orders_2023,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2024 THEN 1 ELSE 0 END AS orders_2024
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
ORDER BY c.country_name ASC;


--SQL 03
SELECT
co.order_id,
c.country_name,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2021 THEN 1 ELSE 0 END AS orders_2021,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2022 THEN 1 ELSE 0 END AS orders_2022,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2023 THEN 1 ELSE 0 END AS orders_2023,
CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2024 THEN 1 ELSE 0 END AS orders_2024
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
ORDER BY c.country_name ASC;


--SQL 04
SELECT
c.country_name,
SUM(CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2021 THEN 1 ELSE 0 END) AS orders_2021,
SUM(CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2022 THEN 1 ELSE 0 END) AS orders_2022,
SUM(CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2023 THEN 1 ELSE 0 END) AS orders_2023,
SUM(CASE WHEN EXTRACT(YEAR FROM co.order_date) = 2024 THEN 1 ELSE 0 END) AS orders_2024
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name
ORDER BY c.country_name ASC;
