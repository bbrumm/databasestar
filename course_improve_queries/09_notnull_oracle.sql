/*
Lesson 09
Oracle
*/

ALTER TABLE sales_order
MODIFY order_date (DATE NOT NULL);

UPDATE sales_order
SET order_date = '2020-12-18'
WHERE id = 6;

/*
Shows an error
*/
UPDATE sales_order
SET order_date = NULL
WHERE id = 3;

/*
Shows an error
*/
INSERT INTO sales_order
(id, person_id, order_date, order_value)
VALUES (7, 4, NULL, 85);

/*
Shows an error
*/
INSERT INTO sales_order
(id, person_id, order_value)
VALUES (7, 4, 85);