SELECT
oh.order_id,
co.order_date,
oh.status_id,
os.status_value 
FROM order_history oh
INNER JOIN order_status os ON oh.status_id = os.status_id 
INNER JOIN cust_order co ON co.order_id = oh.order_id
WHERE oh.status_date = (
  SELECT MAX(oh2.status_date)
  FROM order_history oh2
  WHERE oh2.order_id = oh.order_id 
);




CREATE TABLE #order_latest_status (
  order_id INT,
  order_date DATETIME,
  status_id INT,
  status_value VARCHAR(100)
);



INSERT INTO #order_latest_status(order_id, order_date, status_id, status_value)
SELECT
oh.order_id,
co.order_date,
oh.status_id,
os.status_value 
FROM order_history oh
INNER JOIN order_status os ON oh.status_id = os.status_id 
INNER JOIN cust_order co ON co.order_id = oh.order_id
WHERE oh.status_date = (
  SELECT MAX(oh2.status_date)
  FROM order_history oh2
  WHERE oh2.order_id = oh.order_id 
);



SELECT
order_id,
order_date,
status_id,
status_value
FROM #order_latest_status;