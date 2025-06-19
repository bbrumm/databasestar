SELECT
c.country_name,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2022 THEN 1 ELSE 0 END) AS orders_2022,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2023 THEN 1 ELSE 0 END) AS orders_2023,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
SUM(CASE WHEN DATEPART(YEAR, co.order_date) = 2025 THEN 1 ELSE 0 END) AS orders_2025
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name
ORDER BY c.country_name ASC;


SELECT *
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
PIVOT (
  COUNT(*)
  FOR (DATEPART(YEAR, co.order_date))
  IN (2022, 2023, 2024, 2025)
);


SELECT *
FROM (
	SELECT
	co.order_id,
    c.country_name,
    DATEPART(YEAR, co.order_date) AS order_year
    FROM cust_order co
    INNER JOIN address a ON co.dest_address_id = a.address_id 
    INNER JOIN country c ON a.country_id = c.country_id
) p
PIVOT (
  COUNT(order_id)
  FOR order_year
  IN ([2022], [2023], [2024], [2025])
) AS pvt
ORDER BY pvt.country_name ASC;


