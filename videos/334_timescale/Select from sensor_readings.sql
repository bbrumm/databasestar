SELECT COUNT(*) FROM sensor_readings;

EXPLAIN ANALYZE
SELECT
    device_id,
    AVG(temperature) AS avg_temp,
    MAX(temperature) AS max_temp,
    MIN(temperature) AS min_temp
FROM sensor_readings
WHERE recorded_at >= NOW() - INTERVAL '7 days'
GROUP BY device_id
ORDER BY device_id;