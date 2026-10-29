CREATE TABLE sensor_readings (
    id          BIGSERIAL,
    recorded_at TIMESTAMPTZ NOT NULL,
    device_id   INT NOT NULL,
    temperature NUMERIC(5,2),
    humidity    NUMERIC(5,2)
);

CREATE INDEX ON sensor_readings (recorded_at);

DROP INDEX sensor_readings_recorded_at_idx

TRUNCATE sensor_readings;