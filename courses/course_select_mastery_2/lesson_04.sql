/*
Lesson 04
*/

SELECT
s.id,
s.person_id,
s.order_date,
s.order_value,
p.first_name,
p.last_name,
c.company_name
FROM sales_order s
INNER JOIN person p ON s.person_id = p.person_id
LEFT JOIN company c ON p.company_id = c.company_id
WHERE s.order_date = '20210109';
