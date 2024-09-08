SELECT COUNT(*)
FROM yellow_tripdata;

SELECT *
FROM yellow_tripdata;

/*
Query goal:
Find the trips that are outliers:
trips that are higher than the average for the day.
This means, higher than the average cost or average distance
*/

/*
Find the average trip_distance and average total_amount for each day
Day = pickup day
Runtime approx 7s
*/

SELECT
CAST(tpep_pickup_datetime AS date) AS pickup_date,
AVG(trip_distance) AS avg_trip_distance,
AVG(total_amount) AS avg_total_amount
FROM yellow_tripdata
GROUP BY pickup_date;

/*
 * Find trips that are higher aver the average
 * Using a CTE 
 * Runtime is 25 seconds
 * There are only 87 rows. I was expecting much more
 */
WITH avg_per_day AS (
	SELECT
	CAST(tpep_pickup_datetime AS date) AS pickup_date,
	AVG(trip_distance) AS avg_trip_distance,
	AVG(total_amount) AS avg_total_amount
	FROM yellow_tripdata
	GROUP BY pickup_date
)
SELECT
CAST(t.tpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
CAST(t.tpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
CAST(tpep_pickup_datetime AS date) AS pickup_date,
t.passenger_count,
t.trip_distance,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount 
FROM yellow_tripdata t
INNER JOIN avg_per_day a ON CAST(t.tpep_pickup_datetime AS TIMESTAMP) = a.pickup_date
WHERE t.total_amount > a.avg_total_amount
OR t.trip_distance > a.avg_trip_distance;

/*
 * Verification
 * Date 2015-01-01
 * Avg trip distance is 3.235
 * Avg total amount is 15.296
 * 
 * Find all trips on 2015-01-01
 * Lots more here than the above query
 */

SELECT
CAST(t.tpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
CAST(t.tpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
CAST(tpep_pickup_datetime AS date) AS pickup_date,
t.passenger_count,
t.trip_distance,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount 
FROM yellow_tripdata t
WHERE CAST(tpep_pickup_datetime AS date) = '2015-01-01';


/*
 * Add columns from the join to the view
 */

WITH avg_per_day AS (
	SELECT
	CAST(tpep_pickup_datetime AS date) AS pickup_date,
	AVG(trip_distance) AS avg_trip_distance,
	AVG(total_amount) AS avg_total_amount
	FROM yellow_tripdata
	GROUP BY pickup_date
)
SELECT
CAST(t.tpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
CAST(t.tpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
CAST(tpep_pickup_datetime AS date) AS pickup_date,
t.passenger_count,
t.trip_distance,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount,
a.avg_total_amount,
a.avg_trip_distance
FROM yellow_tripdata t
INNER JOIN avg_per_day a ON CAST(t.tpep_pickup_datetime AS DATE) = a.pickup_date
/*WHERE t.total_amount > a.avg_total_amount
OR t.trip_distance > a.avg_trip_distance;*/
;

/*
 * Issue: join was using timestamp and not date
 * Use the date
 * It works, but there are 4M rows.
 * How can we reduce the number of rows?
 * Maybe the top 100 by total amount
 * Run time for top 100 = 18 seconds
 * Cost: 2,129,722
*/

WITH avg_per_day AS (
	SELECT
	CAST(tpep_pickup_datetime AS date) AS pickup_date,
	AVG(trip_distance) AS avg_trip_distance,
	AVG(total_amount) AS avg_total_amount
	FROM yellow_tripdata
	GROUP BY pickup_date
)
SELECT
CAST(t.tpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
CAST(t.tpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
CAST(tpep_pickup_datetime AS date) AS pickup_date,
t.passenger_count,
t.trip_distance,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount 
FROM yellow_tripdata t
INNER JOIN avg_per_day a ON CAST(t.tpep_pickup_datetime AS DATE) = a.pickup_date
WHERE t.total_amount > a.avg_total_amount
OR t.trip_distance > a.avg_trip_distance
ORDER BY t.total_amount DESC
LIMIT 100;

/*
 * Create indexes on total amount and trip distance
 */

CREATE INDEX idx_trip_totalamt ON yellow_tripdata (total_amount);
CREATE INDEX idx_trip_tripdist ON yellow_tripdata (trip_distance);

/*
 * Rerun above query:
 * Cost: 790,332
 * Runtime: 7 seconds
 * Now has a green Index Scan
 * 
 * What else can I try?
 * Maybe adding a new column with the date instead of casting on execution
 * Maybe using window functions instead of a CTE
 * 
 * Try add a new column
 */


/*
 * Add new column
 * Update data
 * Update runtime: 170 seconds
 */
ALTER TABLE yellow_tripdata 
ADD COLUMN trip_pickup_date TIMESTAMP;

UPDATE yellow_tripdata 
SET trip_pickup_date = CAST(tpep_pickup_datetime AS date);

/*
Same query but using the new column
Runtime: 3.9 seconds
Cost: 644,348
*/

WITH avg_per_day AS (
	SELECT
	trip_pickup_date,
	AVG(trip_distance) AS avg_trip_distance,
	AVG(total_amount) AS avg_total_amount
	FROM yellow_tripdata
	GROUP BY trip_pickup_date
)
SELECT
CAST(t.tpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
CAST(t.tpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
t.trip_pickup_date,
t.passenger_count,
t.trip_distance,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount 
FROM yellow_tripdata t
INNER JOIN avg_per_day a ON t.trip_pickup_date = a.trip_pickup_date
WHERE t.total_amount > a.avg_total_amount
OR t.trip_distance > a.avg_trip_distance
ORDER BY t.total_amount DESC
LIMIT 100;

/*
 * Add an index on this new column
 * Run the main query above again
 * Runtime: 4.2 seconds
 * Cost: 546,332
 * Most of the cost is the Parralel Seq Scan which gets all rows before aggregating
 */

CREATE INDEX idx_trip_pickupdate ON yellow_tripdata (trip_pickup_date);

/*
 * Just the aggregate query
 */

SELECT
trip_pickup_date,
AVG(trip_distance) AS avg_trip_distance,
AVG(total_amount) AS avg_total_amount
FROM yellow_tripdata
GROUP BY trip_pickup_date;

/*
Can we create partitions?
Want to avoid the materialised view at the moment
Indexes won't help this because we are getting all data from the table
Partitions unlikely to help with performance, and there would be a lot of them
*/

/*
 * Create a materialised view
 * Runtime: X seconds
 */

CREATE MATERIALIZED VIEW mv_avg_per_day AS 
SELECT
trip_pickup_date,
AVG(trip_distance) AS avg_trip_distance,
AVG(total_amount) AS avg_total_amount
FROM yellow_tripdata
GROUP BY trip_pickup_date;


/*
 * Update the main query to use the MV
 * Runtime: 65 ms
 * Cost: 725
 */

SELECT
CAST(t.tpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
CAST(t.tpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
t.trip_pickup_date,
t.passenger_count,
t.trip_distance,
t.payment_type,
t.fare_amount,
t.extra,
t.mta_tax,
t.tip_amount,
t.tolls_amount,
t.improvement_surcharge,
t.total_amount 
FROM yellow_tripdata t
INNER JOIN mv_avg_per_day a ON t.trip_pickup_date = a.trip_pickup_date
WHERE t.total_amount > a.avg_total_amount
OR t.trip_distance > a.avg_trip_distance
ORDER BY t.total_amount DESC
LIMIT 100;

/*
This feels like I could have just used an MV from the start and made it run fast.
Is there another query I can use that looks at this data but doesn't just use the MV?
*/

/*
 * Reset table
 */


DROP INDEX idx_trip_totalamt;
DROP INDEX idx_trip_tripdist;
DROP INDEX idx_trip_pickupdate;

ALTER TABLE yellow_tripdata 
DROP COLUMN trip_pickup_date;

DROP MATERIALIZED VIEW mv_avg_per_day;
