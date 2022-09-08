/*
Lesson 05
*/

SELECT
c.company_name,
ROUND(SUM(s.order_value) * 0.73, 2) AS total_order_value,
COUNT(*) AS num_orders,
ROUND(AVG(s.order_value) * 0.73, 2) AS average_order_value
FROM company c
INNER JOIN person p ON c.company_id = p.company_id
INNER JOIN sales_order s ON p.person_id = s.person_id
GROUP BY c.company_name;
