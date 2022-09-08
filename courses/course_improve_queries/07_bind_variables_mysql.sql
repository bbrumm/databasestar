/*
Lesson 07
MySQL
*/

SELECT
p.person_id,
c.company_name,
p.first_name,
p.last_name,
s.id AS sales_order_id,
s.order_date,
s.order_value
FROM person p
INNER JOIN sales_order s ON p.person_id = s.person_id
INNER JOIN company c ON p.company_id = c.company_id
WHERE s.order_date = '2020-12-05';


SELECT
p.person_id,
c.company_name,
p.first_name,
p.last_name,
s.id AS sales_order_id,
s.order_date,
s.order_value
FROM person p
INNER JOIN sales_order s ON p.person_id = s.person_id
INNER JOIN company c ON p.company_id = c.company_id
WHERE s.order_date = ?;

