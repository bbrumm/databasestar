/*
Pivot - Postgres
*/

SELECT *
FROM   crosstab(
  'SELECT product_name, store_location, num_sales
  FROM   product_sales
  ORDER  BY 1,2'
) AS num_sales (
    "Product_Name" text, 
    "North" text, 
    "Central" text,
    "South" text, 
    "West" text
);