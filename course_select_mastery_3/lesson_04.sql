/*
Lesson 04
*/

SELECT
c.company_name,
SUM(s.order_value) AS total_order_value,
COUNT(*) AS num_orders,
AVG(s.order_value) AS average_order_value
FROM company c
INNER JOIN person p ON c.company_id = p.company_id
INNER JOIN sales_order s ON p.person_id = s.person_id
GROUP BY c.company_name;