/*
Pivot Keyword
*/

--SQL 01
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

--SQL 02
-- Has an error because the PIVOT column is too complicated
SELECT *
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
PIVOT (
  COUNT(*)
  FOR (EXTRACT(YEAR FROM co.order_date))
  IN (2021, 2022, 2023, 2024)
);

--SQL 03
WITH orders_country_year AS (
    SELECT
    c.country_name,
    EXTRACT(YEAR FROM co.order_date) AS order_year
    FROM cust_order co
    INNER JOIN address a ON co.dest_address_id = a.address_id 
    INNER JOIN country c ON a.country_id = c.country_id
)
SELECT *
FROM orders_country_year
PIVOT (
  COUNT(*)
  FOR order_year
  IN (2021, 2022, 2023, 2024)
)
ORDER BY country_name ASC;