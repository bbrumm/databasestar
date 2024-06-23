/*
MySQL commands to import a file
*/

/*
Adjust settings
*/
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile=1;

DROP TABLE measurements;

CREATE TABLE measurements (
  city_name VARCHAR(500),
  measurement VARCHAR(500)
);


/*
Import the 1B row file
*/
LOAD DATA LOCAL INFILE  
'C:/Users/bbrum/databasestar/1brc/measurements.txt'
INTO TABLE measurements  
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
(city_name,measurement);

TRUNCATE TABLE measurements;


SELECT COUNT(*)
FROM measurements;

SELECT *
FROM measurements
LIMIT 10;

SELECT
city_name,
MIN(measurement) AS min_temp,
MAX(measurement) AS max_temp,
AVG(measurement) AS avg_temp
FROM measurements
GROUP BY city_name;