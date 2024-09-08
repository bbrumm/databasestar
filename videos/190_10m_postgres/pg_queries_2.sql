/*
 * Categorise each trip based on some factors
 * Then filter on some factors
 * Maybe have a UNION that we convert to a CASE
 * 
 * We want to find good or profitable trips.
 * This could be:
 *   A trip that had a high total amount ($20) for a single passenger, and more than 10 miles
 *   A trip that has a high tip amount ($5), and more than 10 miles
 *   A trip that has a high total amount ($25) for more than one passenger, and more than 10 miles
 */

ALTER TABLE yellow_tripdata
RENAME COLUMN "RateCodeID" TO ratecodeid;

SELECT *
FROM yellow_tripdata;

SELECT COUNT(*)
FROM yellow_tripdata;

/*
 * SQL 01
 * Starting query
 * Runtime: 15 seconds
 * Cost: 2,224,823 (tbc again)
 */
SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.total_amount > 20
AND t.passenger_count = 1
UNION
SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.tip_amount > 5
UNION
SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.passenger_count > 1
AND t.total_amount > 25
ORDER BY tpep_pickup_datetime
LIMIT 100;


/* SQL 02 */

SELECT COUNT(*)
FROM yellow_tripdata;

/* SQL 03 */

SELECT *
FROM yellow_tripdata;


/*
 * SQL 04
 * Create indexes 
 */

CREATE INDEX idx_trip_dist ON yellow_tripdata (trip_distance);
CREATE INDEX idx_trip_totalamt ON yellow_tripdata (total_amount);
CREATE INDEX idx_trip_tipamt ON yellow_tripdata (tip_amount);
CREATE INDEX idx_trip_pass ON yellow_tripdata (passenger_count);

/*
 * Stats for main query after indexes:
 * Cost: 688,333
 * Runtime: 
 * All three indexes are used
 */ 


/*
 * Count of records:
 * 1.6m with trip distance more than 5
 * 580k with more than 10
 */
SELECT
COUNT(*)
FROM yellow_tripdata
WHERE trip_distance > 10;


/* 
 * SQL 05
 * Change UNION to UNION ALL
 * Runtime: error when running
 * Cost: 650,144
 */


SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
'High single-passenger fare' AS reason
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.total_amount > 20
AND t.passenger_count = 1
UNION ALL
SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
'High tip amount'
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.tip_amount > 5
UNION ALL
SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
'High multi-passenger fare'
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.passenger_count > 1
AND t.total_amount > 25
ORDER BY tpep_pickup_datetime
LIMIT 100;


/* SQL 06
 * Change union to case
 * Cost: 834,079
 * Runtime: 
 */


SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
CASE
	WHEN t.trip_distance > 10
	AND t.total_amount > 20
	AND t.passenger_count = 1
	THEN 'High single-passenger fare'
	WHEN t.trip_distance > 10
    AND t.tip_amount > 5
	THEN 'High tip amount'
	WHEN t.trip_distance > 10
	AND t.passenger_count > 1
	AND t.total_amount > 25
	THEN 'High multi-passenger fare'
END AS reason
FROM yellow_tripdata t
ORDER BY t.tpep_pickup_datetime
LIMIT 100;

/*
 * SQL 07
Try adding a WHERE to the overall query for common filters
Cost: 580,434
Runtime: 10 sec
*/

SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
CASE
	WHEN t.trip_distance > 10
	AND t.total_amount > 20
	AND t.passenger_count = 1
	THEN 'High single-passenger fare'
	WHEN t.trip_distance > 10
    AND t.tip_amount > 5
	THEN 'High tip amount'
	WHEN t.trip_distance > 10
	AND t.passenger_count > 1
	AND t.total_amount > 25
	THEN 'High multi-passenger fare'
END AS reason
FROM yellow_tripdata t
WHERE t.trip_distance > 10
ORDER BY t.tpep_pickup_datetime
LIMIT 100;

/* SQL 08
 * Are there any rows where total amount is < 5 and tip_amount is > 5?
 * If not, we can also filter on total amount
 * Result: 0
 * So, we can add t.total_amount > 5 to the main query
*/

SELECT COUNT(*)
FROM yellow_tripdata t
WHERE t.total_amount < 5
AND t.tip_amount > 5;


/* SQL 09
 * Add total amount filter
 * Cost: 592,115
 * Runtime: 24 sec
 */

SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
CASE
	WHEN t.trip_distance > 10
	AND t.total_amount > 20
	AND t.passenger_count = 1
	THEN 'High single-passenger fare'
	WHEN t.trip_distance > 10
    AND t.tip_amount > 5
	THEN 'High tip amount'
	WHEN t.trip_distance > 10
	AND t.passenger_count > 1
	AND t.total_amount > 25
	THEN 'High multi-passenger fare'
END AS reason
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.total_amount > 5
ORDER BY t.tpep_pickup_datetime
LIMIT 100;

/*
 * SQL 10
 * Create an index on both columns
 * No change to cost
 */

CREATE INDEX idx_trip_distamt ON yellow_tripdata (trip_distance, total_amount);

/* SQL 11
 * Alter the base table to add the reason
 * Then remove the case and select the column
 * Then filter where reason is not null
 * Then add index on reason and rerun
 */

ALTER TABLE yellow_tripdata
ADD COLUMN reason TEXT;

/* SQL 12 */

UPDATE yellow_tripdata
SET reason = 'High single-passenger fare'
WHERE trip_distance > 10
AND total_amount > 20
AND passenger_count = 1;
	
UPDATE yellow_tripdata
SET reason = 'High tip amount'
WHERE  trip_distance > 10
AND tip_amount > 5; 
	
	
UPDATE yellow_tripdata
SET reason = 'High multi-passenger fare'
WHERE  trip_distance > 10
AND passenger_count > 1
AND total_amount > 25;

/* SQL 13
 * Select the new column
 * Runtime: 57 sec
 * Cost: 587,513
 */

SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
t.reason
FROM yellow_tripdata t
WHERE t.trip_distance > 10
AND t.total_amount > 5
ORDER BY t.tpep_pickup_datetime
LIMIT 100;

/*
 * SQL 14
 * Change filter where reason is not null
 * Runtime: 21 sec
 * Cost: 579,099
 */

SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
t.reason
FROM yellow_tripdata t
WHERE t.reason IS NOT NULL
ORDER BY t.tpep_pickup_datetime
LIMIT 100;

/*
 * SQL 15
 * Add index
 */

CREATE INDEX idx_trip_reason ON yellow_tripdata (reason);

/*
Main query after index
Cost: 579,099 - a bit better
Runtime: 19 sec
*/


/* SQL 16
 * Create an index on the order by column
 */

CREATE INDEX idx_trip_orderby ON yellow_tripdata (tpep_pickup_datetime);

/*
 * Rerun main query after this
 * Runtime under one second
 * Cost is X
 * 
 */

/*
REVIEW:
Original query: 25 s
With indexes on WHERE clause: 21 s
Union to Union All: 20 s
Case instead of Union: 10 s
Case with WHERE: 5.4 s
Compound index: 5.4 s
Populate and select reason column: 11 s
Filter on reason: 4.8 s
Index on reason: 4.2 s
Index on order by: 0.1 s
*/


/*
 * *************************
 * 
 */


/*
Maybe here we fail the challenge as it runs in 21 seconds and not 1 second
Rather than getting all 500k records, let's assume  we can use pagination

Add the order by and limit
As we have no PK, assume a trip is unique if it has a unique pickup location, dropoff location, and pickup and dropoff datetime
Cost: 756,646
Runtime: 4.4 s
*/

SELECT
t.tpep_pickup_datetime,
t.tpep_dropoff_datetime,
t.passenger_count,
t.trip_distance,
t.pickup_longitude,
t.pickup_latitude,
t.ratecodeid,
t.dropoff_longitude,
t.dropoff_latitude,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
t.reason
FROM yellow_tripdata t
WHERE t.reason IS NOT NULL
ORDER BY t.tpep_pickup_datetime ASC, tpep_dropoff_datetime ASC,
pickup_longitude ASC,
pickup_latitude ASC,
dropoff_longitude ASC,
dropoff_latitude ASC
LIMIT 1000;

/*
 * Is this a valid order by?
 * Is there a pickup and dropoff that have a count of >1?
 * Result: 
 */

SELECT
tpep_pickup_datetime,
tpep_dropoff_datetime,
pickup_longitude,
pickup_latitude,
dropoff_longitude,
dropoff_latitude,
COUNT(*)
FROM yellow_tripdata t
GROUP BY tpep_pickup_datetime, tpep_dropoff_datetime, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude
HAVING COUNT(*) > 1;



/*
 * Then add index
*/

CREATE INDEX idx_trip_orderby ON yellow_tripdata (tpep_pickup_datetime, tpep_dropoff_datetime, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude);

/*
Stats on main query after index:
Cost: 497
Runtime: 457 MS
PASS - under 1 second
*/

/*
 * Reset
*/

ALTER TABLE yellow_tripdata
DROP COLUMN reason;

DROP INDEX idx_trip_reason;
DROP INDEX idx_trip_distamt;
DROP INDEX idx_trip_dist;
DROP INDEX idx_trip_totalamt;
DROP INDEX idx_trip_tipamt;
DROP INDEX idx_trip_orderby;
DROP INDEX idx_trip_pass;



