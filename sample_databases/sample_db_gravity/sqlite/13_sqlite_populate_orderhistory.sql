/* Add order received for all orders older than 12 hours */
INSERT INTO order_history (order_id, status_id, status_date)
SELECT 
	o.order_id,
	1 AS satus_id,
	DATETIME (
		o.order_date,
		CAST(( ABS(RANDOM()) % 60 ) * 60 * 12 AS TEXT ) || ' seconds'
	) status_date
FROM
	cust_order o
WHERE o.order_date < DATE('now','-12 hours');

/*Add Pending Delivery for most of these orders, within 2 days after the previous step, where orders are older than 2 days */
INSERT INTO order_history (order_id, status_id, status_date)
SELECT 
	o.order_id,
	2 AS satus_id,
	DATETIME (
		o.order_date,
		CAST(( ABS(RANDOM()) % 60 ) * 60 * 12 AS TEXT ) || ' seconds'
	) status_date
FROM
	cust_order o
WHERE o.order_date < DATE('now','-2 days') 
ORDER BY RANDOM()
LIMIT 6800;

/*Add Delivery In Progress for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO order_history (order_id, status_id, status_date)
SELECT 
	o.order_id,
	3 AS satus_id,
	DATETIME (
		o.status_date,
		CAST(( ABS(RANDOM()) % 60 ) * 60 * 12 AS TEXT ) || ' seconds'
	) status_date
FROM order_history o
WHERE o.status_date < DATE('now','-2 days') 
AND o.status_id = 2
ORDER BY RANDOM()
LIMIT 4000;

/* Add Delivered for orders that have a status of 2 and at least a few days in the past */
INSERT INTO order_history (order_id, status_id, status_date)
SELECT 
	o.order_id,
	4 AS satus_id,
	DATETIME (
		o.status_date,
		CAST(( ABS(RANDOM()) % 60 ) * 60 * 12 AS TEXT ) || ' seconds'
	) status_date
FROM order_history o
WHERE o.status_date < DATE('now','-6 days') 
AND o.status_id = 3
ORDER BY RANDOM()
LIMIT 3500;

/*#Add some Cancelled orders*/
INSERT INTO order_history (order_id, status_id, status_date)
SELECT 
	o.order_id,
	5 AS satus_id,
	DATETIME (
		o.status_date,
		CAST(( ABS(RANDOM()) % 60 ) * 60 * 12 AS TEXT ) || ' seconds'
	) status_date
FROM order_history o
WHERE o.status_date < DATE('now','-6 days') 
AND o.status_id = 1
AND NOT EXISTS (
   SELECT 1
   FROM order_history oh
   WHERE oh.order_id = o.order_id
   and oh.status_id = 2
)
ORDER BY RANDOM()
LIMIT 300;

/*#Add some Returned orders*/
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
   o.order_id,
   6 status_id,
	DATETIME (
		o.status_date,
		CAST(( ABS(RANDOM()) % 60 ) * 60 * 12 AS TEXT ) || ' seconds'
	) status_date
FROM
   order_history o
WHERE o.status_id = 1
AND EXISTS (
   SELECT 1
   FROM order_history oh
   WHERE oh.order_id = o.order_id
   AND oh.status_id = 4
)
AND o.status_date < DATE('now', '-7 days')
ORDER BY RANDOM()
LIMIT 200;