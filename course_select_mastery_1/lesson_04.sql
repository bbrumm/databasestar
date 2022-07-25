/*
Lesson 04
*/

SELECT
id,
person_id,
order_date,
order_value
FROM sales_order
WHERE order_date < '20210101'
AND order_date >= '20200101';