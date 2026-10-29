--1. Create a new table
DROP MATERIALIZED VIEW sensor_daily;
DROP MATERIALIZED VIEW sensor_hourly;
DROP MATERIALIZED VIEW sensor_hourly_realtime;
DROP TABLE sensor_readings;

CREATE TABLE sensor_readings (
    id          BIGSERIAL,
    recorded_at TIMESTAMPTZ NOT NULL,
    device_id   INT NOT NULL,
    temperature NUMERIC(5,2),
    humidity    NUMERIC(5,2)
);


-- 2. Convert to hypertable immediately, while empty
SELECT create_hypertable('sensor_readings', 'recorded_at');

SELECT COUNT(*) FROM (
	SELECT
	time,
	device_id,
	random()*100 AS temperature,
	random()*100 AS humidity
	FROM
	generate_series('2020-01-01', '2026-06-30', INTERVAL '10 minutes') AS time,
	generate_series(1,20,1) AS device_id
);

--These are the volumes of the series that will result in 1 billion rows
--1.077m below
SELECT COUNT(*) FROM (
	SELECT
	1
	FROM
	generate_series('2010-01-01', '2026-06-30', INTERVAL '5 minutes') AS time,
	generate_series(1,500,1) AS device_id
);

SELECT COUNT(*) FROM (
	SELECT
	1
	FROM
	generate_series('2006-01-01', '2006-12-31', INTERVAL '5 minutes')
);

/*
--A smaller sample for testing
SELECT
time,
device_id,
random ()*100 AS temperature,
random ()*100 AS humidity
FROM
generate_series('2020-01-01', '2026-06-30', INTERVAL '5 minutes') AS time,
generate_series(1,5,1) AS device_id;



-- 3. Insert some sensor data. 3.4m rows
INSERT INTO sensor_readings (recorded_at, device_id, temperature, humidity)
SELECT
time,
device_id,
random ()*100 AS temperature,
random ()*100 AS humidity
FROM
generate_series('2020-01-01', '2026-06-30', INTERVAL '5 minutes') AS time,
generate_series(1,5,1) AS device_id;


-- Or, Insert some sensor data. 1b rows
INSERT INTO sensor_readings (recorded_at, device_id, temperature, humidity)
SELECT
time,
device_id,
random ()*100 AS temperature,
random ()*100 AS humidity
FROM
generate_series('2006-01-01', '2026-06-30', INTERVAL '5 minutes') AS time,
generate_series(1,500,1) AS device_id;



--This took too long. Try to insert one year at a time.
INSERT INTO sensor_readings (recorded_at, device_id, temperature, humidity)
SELECT
time,
device_id,
random ()*100 AS temperature,
random ()*100 AS humidity
FROM
generate_series('2006-01-01', '2006-12-31', INTERVAL '5 minutes') AS time,
generate_series(1,500,1) AS device_id;
*/



--Create hourly MV
--Took about 8 seconds
CREATE MATERIALIZED VIEW sensor_hourly
WITH (timescaledb.continuous) AS
SELECT
    time_bucket('1 hour', recorded_at) AS hour,
    device_id,
    AVG(temperature)  AS avg_temp,
    MAX(temperature)  AS max_temp,
    MIN(temperature)  AS min_temp,
    COUNT(*)          AS reading_count
FROM sensor_readings
GROUP BY hour, device_id;


SELECT *
FROM sensor_hourly
ORDER BY hour DESC
LIMIT 20;


SELECT add_continuous_aggregate_policy('sensor_hourly',
    start_offset    => INTERVAL '3 days',
    end_offset      => INTERVAL '1 hour',
    schedule_interval => INTERVAL '1 hour'
);


CREATE MATERIALIZED VIEW sensor_daily
WITH (timescaledb.continuous) AS
SELECT
    time_bucket('1 day', hour) AS day,
    device_id,
    AVG(avg_temp)   AS avg_temp,
    MAX(max_temp)   AS max_temp,
    MIN(min_temp)   AS min_temp,
    SUM(reading_count) AS reading_count
FROM sensor_hourly
GROUP BY day, device_id;


SELECT *
FROM sensor_daily
ORDER BY day DESC
LIMIT 50;



CREATE MATERIALIZED VIEW sensor_hourly_realtime
WITH (
    timescaledb.continuous,
    timescaledb.materialized_only = false
) AS
SELECT
    time_bucket('1 hour', recorded_at) AS hour,
    device_id,
    AVG(temperature)  AS avg_temp,
    MAX(temperature)  AS max_temp,
    MIN(temperature)  AS min_temp,
    COUNT(*)          AS reading_count
FROM sensor_readings
GROUP BY hour, device_id;


SELECT *
FROM sensor_hourly_realtime
ORDER BY hour DESC
LIMIT 10;