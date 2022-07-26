/*
Lesson 04
*/

SELECT
person.person_id,
person.first_name,
person.last_name,
sales_order.id,
sales_order.order_date,
sales_order.order_value
FROM person
INNER JOIN sales_order ON person.person_id = sales_order.person_id;


SELECT
p.person_id,
p.first_name,
p.last_name,
s.id,
s.order_date,
s.order_value
FROM person p
INNER JOIN sales_order s ON p.person_id = s.person_id;

