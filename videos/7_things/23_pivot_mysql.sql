/*
Pivot - MySQL
*/
SELECT
product_name,
SUM(CASE
  WHEN store_location = 'North' THEN num_sales ELSE 0 END
) AS north,
SUM(CASE
  WHEN store_location = 'Central' THEN num_sales ELSE 0 END
) AS central,
SUM(CASE
  WHEN store_location = 'South' THEN num_sales ELSE 0 END
) AS south,
SUM(CASE
  WHEN store_location = 'West' THEN num_sales ELSE 0 END
) AS west
FROM product_sales
GROUP BY product_name;
