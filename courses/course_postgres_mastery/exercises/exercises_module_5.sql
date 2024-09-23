/*
Exercises from the PostgreSQL Mastery course
Module 5
*/

/* 34-01 */

SELECT
h.history_id,
h.order_id,
h.status_id,
h.status_date,
s.status_value 
FROM order_history h
INNER JOIN order_status s ON h.status_id = s.status_id 
WHERE order_id = 5468;

/* 34-02 */

CREATE TABLE order_history_range (
  history_id INTEGER,
  order_id INTEGER,
  status_id INTEGER,
  status_range DATERANGE
);

INSERT INTO order_history_range (history_id, order_id, status_id, status_range) VALUES
(5466, 5468, 1, '[2023-08-24, 2023-08-25)'),
(12028, 5468, 2, '[2023-08-25, 2023-08-26)'),
(17352, 5468, 3, '[2023-08-26, 2023-08-31)'),
(21643, 5468, 4, '[2023-08-31, 9999-12-12)');

SELECT
history_id,
order_id,
status_id,
status_range
FROM order_history_range;