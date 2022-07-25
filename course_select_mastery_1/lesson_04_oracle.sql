/*
Lesson 04
Oracle
*/

SELECT
id,
person_id,
order_date,
order_value
FROM sales_order
WHERE order_date < DATE '20210101'
AND order_date >= DATE '20200101';