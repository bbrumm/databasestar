/*
Postgres commands to import the file
*/

CREATE TABLE measurements (
  city_name VARCHAR(500),
  measurement DECIMAL(10,4)
);


COPY measurements(city_name, measurement)
FROM 'C:/Users/bbrum/OneDrive/Documents/import/smallfile.txt'
DELIMITER ';';

select *
from measurements;