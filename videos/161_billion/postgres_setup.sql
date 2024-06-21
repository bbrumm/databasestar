/*
Postgres commands to import the file
*/

CREATE TABLE measurements (
  city_name VARCHAR(500),
  measurement DECIMAL(10,4)
);


COPY measurements(city_name, measurement)
FROM 'C:/Users/bbrum/databasestar/1brc/measurements.txt'
DELIMITER ';';

select *
from measurements;

SELECT
city_name,
MIN(measurement) AS min_temp,
MAX(measurement) AS max_temp,
AVG(measurement) AS avg_temp
FROM measurements
GROUP BY city_name;