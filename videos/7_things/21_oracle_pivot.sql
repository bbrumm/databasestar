/*
Oracle Pivot
*/

SELECT *
FROM cust_sales
PIVOT (
  SUM(sale_amount)
  FOR customer_id
  IN (1, 2, 3, 4, 5, 6)
);