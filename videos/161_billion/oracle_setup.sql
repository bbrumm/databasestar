/*
Oracle script for creating an external table
and querying the data
*/
DROP DIRECTORY ext_data;
CREATE DIRECTORY ext_data AS 'C:\app\bbrum\product\21c\ext_data\';

GRANT READ, WRITE ON DIRECTORY ext_data TO SYS;

 SELECT * FROM all_directories;

/*
Query it without loading it
*/

SELECT *
FROM EXTERNAL
(
    (
        city_name VARCHAR2(500),
        measurement DECIMAL(10,4)
    )
    TYPE oracle_loader
    DEFAULT DIRECTORY ext_data
    ACCESS PARAMETERS (
      RECORDS DELIMITED BY '\n'
      FIELDS CSV WITHOUT EMBEDDED TERMINATED BY ';'
    )
    LOCATION ('measurements.txt')
    REJECT LIMIT UNLIMITED
 ) measurements;


SELECT
city_name,
MIN(measurement) AS min_temp,
MAX(measurement) AS max_temp,
AVG(measurement) AS avg_temp 
FROM EXTERNAL
(
    (
        city_name VARCHAR2(500),
        measurement DECIMAL(10,4)
    )
    TYPE oracle_loader
    DEFAULT DIRECTORY ext_data
    ACCESS PARAMETERS (
      RECORDS DELIMITED BY NEWLINE
      FIELDS CSV WITHOUT EMBEDDED TERMINATED BY ';'
    )
    LOCATION ('smallfile.txt')
    REJECT LIMIT UNLIMITED
 ) measurements
GROUP BY city_name;
 

/*
Create table
*/
CREATE TABLE measurements AS
SELECT *
FROM EXTERNAL
(
    (
        city_name VARCHAR2(500),
        measurement DECIMAL(10,4)
    )
    TYPE oracle_loader
    DEFAULT DIRECTORY ext_data
    ACCESS PARAMETERS (
      RECORDS DELIMITED BY '\n'
      FIELDS CSV WITHOUT EMBEDDED TERMINATED BY ';'
    )
    LOCATION ('measurements.txt')
    REJECT LIMIT UNLIMITED
 ) measurements;