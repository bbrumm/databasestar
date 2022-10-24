/*
Pivot - SQL Server
*/

SELECT
product_name,
North, Central, South, West
FROM (
  SELECT product_name, store_location, num_sales
  FROM product_sales
) AS alias_for_select
PIVOT
(
  SUM(num_sales)
  FOR store_location IN (North, Central, South, West)
) AS pivot_table;