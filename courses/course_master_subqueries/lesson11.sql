/*
Create table
*/
DROP TABLE order_summary;

CREATE TABLE order_summary (
	order_date DATE,
	order_count INT,
    order_amount INT
);

/*
Select some data
*/
SELECT
order_date,
order_id
FROM cust_order
WHERE DATE(order_date) = '2020-01-01';


INSERT INTO order_summary (order_date, order_count)
VALUES ('2020-01-01', (
  SELECT COUNT(*)
  FROM cust_order
  WHERE DATE(order_date) = '2020-01-01'
  )
);

SELECT
order_date,
order_count,
order_amount
FROM order_summary;