SELECT
oh.order_id,
oh.status_id,
os.status_value 
FROM order_history oh
INNER JOIN order_status os ON oh.status_id = os.status_id 
WHERE oh.status_date = (
  SELECT MAX(oh2.status_date)
  FROM order_history oh2
  WHERE oh2.order_id = oh.order_id 
);



SELECT
status_value,
COUNT(*)
FROM (
	SELECT
	oh.order_id,
	oh.status_id,
	os.status_value 
	FROM order_history oh
	INNER JOIN order_status os ON oh.status_id = os.status_id 
	WHERE oh.status_date = (
	  SELECT MAX(oh2.status_date)
	  FROM order_history oh2
	  WHERE oh2.order_id = oh.order_id 
	)
) s
GROUP BY status_value;


WITH order_latest_status AS (
SELECT
	oh.order_id,
	oh.status_id,
	os.status_value 
	FROM order_history oh
	INNER JOIN order_status os ON oh.status_id = os.status_id 
	WHERE oh.status_date = (
	  SELECT MAX(oh2.status_date)
	  FROM order_history oh2
	  WHERE oh2.order_id = oh.order_id 
	)
)
SELECT
status_value,
COUNT(*)
FROM order_latest_status
GROUP BY status_value;