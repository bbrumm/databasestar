CREATE TABLE cust_order (
	order_id INT,
	order_date DATE,
	customer_id INT,
	order_status ENUM(
	  'In Progress', 'Pending', 'Complete'
	),
	order_status VARCHAR(50)
	  CHECK order_status IN (
	    'In Progress', 'Pending', 'Complete'
	  ),
	order_status_id INT,
	CONSTRAINT fk_orderstatus 
	  FOREIGN KEY order_status_id
	  REFERENCES order_status (order_status_id)
);