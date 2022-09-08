/*
Lesson 08
*/

CREATE VIEW latest_order_details AS
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
WHERE s.order_date = (
    SELECT MAX(order_date)
    FROM sales_order
);


SELECT
id,
person_id,
order_date,
order_value,
first_name,
last_name,
company_name
FROM latest_order_details;
