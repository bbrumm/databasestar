/*
SQL Server commands to import the file 
*/

CREATE TABLE measurements (
  city_name VARCHAR(500),
  measurement VARCHAR(500)
);


BULK INSERT dbo.measurements
FROM 'C:/Users/bbrum/databasestar/1brc/measurements.txt'
WITH
(
  FIELDTERMINATOR =';',
  ROWTERMINATOR = '0x0a'
);

SELECT
city_name,
MIN(measurement) AS min_temp,
MAX(measurement) AS max_temp,
AVG(measurement) AS avg_temp
FROM measurements
GROUP BY city_name;