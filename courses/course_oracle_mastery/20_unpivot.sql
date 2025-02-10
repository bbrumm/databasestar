/*
Unpivot
*/

--SQL 01
CREATE TABLE country_summary (
  country_name VARCHAR2(200),
  orders_2022 INTEGER,
  orders_2023 INTEGER,
  orders_2024 INTEGER,
  orders_2025 INTEGER
);

--SQL 02
INSERT INTO country_summary (country_name, orders_2022, orders_2023, orders_2024, orders_2025)
VALUES ('Afghanistan', 7, 16, 14, 5);
INSERT INTO country_summary (country_name, orders_2022, orders_2023, orders_2024, orders_2025)
VALUES ('Albania', 6, 16, 4, 6);
INSERT INTO country_summary (country_name, orders_2022, orders_2023, orders_2024, orders_2025)
VALUES ('Argentina', 16, 27, 28, 6);
INSERT INTO country_summary (country_name, orders_2022, orders_2023, orders_2024, orders_2025)
VALUES ('Armenia', 23, 35, 33, 18);
INSERT INTO country_summary (country_name, orders_2022, orders_2023, orders_2024, orders_2025)
VALUES ('Australia', 2, 1, 3, 3);
INSERT INTO country_summary (country_name, orders_2022, orders_2023, orders_2024, orders_2025)
VALUES ('Azerbaijan', 6, 16, 16, 5);

--SQL 03
SELECT *
FROM country_summary;

--SQL 04
--Using UNPIVOT
SELECT *
FROM country_summary
UNPIVOT (
  total_orders
  FOR order_year
  IN (orders_2022, orders_2023, orders_2024, orders_2025)
);



--SQL 05
--Rename order_year values
SELECT *
FROM country_summary
UNPIVOT (
  total_orders
  FOR order_year
  IN (
    orders_2022 AS 2022, 
    orders_2023 AS 2023, 
    orders_2024 AS 2024,
    orders_2025 AS 2025
  )
);

