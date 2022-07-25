SELECT * FROM sales_order;

INSERT INTO sales_order (order_id, customer_id, order_source)
VALUES (3, 4, 'Online');

INSERT INTO sales_order (order_id, customer_id, order_source, order_date)
VALUES (4, 4, 'Online', TO_DATE('10-MAR-2019', 'DD-MON-YYYY'));

INSERT INTO sales_order (order_id, customer_id, order_source)
VALUES (5, 9, 'In Store');

SELECT * FROM sales_order_copy;