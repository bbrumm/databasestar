/*
Lesson 06
*/

CREATE TABLE currency_convert (
  from_currency VARCHAR(5),
  to_currency VARCHAR(5),
  conversion_rate DECIMAL(20, 4)
);


INSERT INTO currency_convert
(from_currency, to_currency, conversion_rate)
VALUES ('USD', 'GBP', 0.73);


SELECT
c.company_name,
ROUND(SUM(s.order_value * cc.conversion_rate), 2) AS total_order_value,
COUNT(*) AS num_orders,
ROUND(AVG(s.order_value * cc.conversion_rate), 2) AS average_order_value
FROM company c
INNER JOIN person p ON c.company_id = p.company_id
INNER JOIN sales_order s ON p.person_id = s.person_id
INNER JOIN currency_convert cc ON cc.from_currency = 'USD'
WHERE cc.to_currency = 'GBP'
GROUP BY c.company_name;
