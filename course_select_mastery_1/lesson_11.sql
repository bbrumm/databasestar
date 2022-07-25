/*
Lesson 11
*/

SELECT
p.person_id,
p.first_name,
p.last_name,
c.company_name,
SUM(s.order_value) AS order_total
FROM sales_order s
INNER JOIN person p ON s.person_id = p.person_id
LEFT JOIN company c ON p.company_id = c.company_id
WHERE active_status != 'Inactive'
AND active_status IS NOT NULL
GROUP BY p.person_id, p.first_name, p.last_name, c.company_name
HAVING SUM(s.order_value) > 100
ORDER BY SUM(s.order_value) DESC;



