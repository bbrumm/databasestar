/*
SQL Server commands to import the file
*/

CREATE TABLE measurements (
  city_name VARCHAR(500),
  measurement DECIMAL(10,4)
);


BULK INSERT dbo.measurements
FROM 'C:/Users/bbrum/OneDrive/Documents/import/smallfile.txt'
WITH
(
  FIELDTERMINATOR =';'
);

SELECT
city_name,
MIN(measurement) AS min_temp,
MAX(measurement) AS max_temp,
AVG(measurement) AS avg_temp
FROM measurements
GROUP BY city_name;