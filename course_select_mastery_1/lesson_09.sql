/*
Lesson 08
*/

SELECT
s.id,
s.order_date,
s.order_value,
p.person_id
p.first_name,
p.last_name,
c.company_name,
p.active_status
FROM sales_order s
INNER JOIN person p ON s.person_id = p.person_id
LEFT JOIN company c ON p.company_id = c.company_id
WHERE active_status != 'Inactive'
AND active_status IS NOT NULL
ORDER BY order_value DESC;