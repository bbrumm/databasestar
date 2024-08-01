/*
Unpivot
*/

--SQL 01
CREATE TABLE country_summary (
  country_name TEXT,
  orders_2021 INTEGER,
  orders_2022 INTEGER,
  orders_2023 INTEGER,
  orders_2024 INTEGER
);

--SQL 02
INSERT INTO country_summary (country_name, orders_2021, orders_2022, orders_2023, orders_2024) VALUES
('Afghanistan', 7, 16, 14, 5),
('Albania', 6, 16, 4, 6),
('Argentina', 16, 27, 28, 6),
('Armenia', 23, 35, 33, 18),
('Australia', 2, 1, 3, 3),
('Azerbaijan', 6, 16, 16, 5);

--SQL 03
SELECT *
FROM country_summary;

--SQL 04
--Using unnest
SELECT
country_name,
UNNEST(ARRAY['orders_2021', 'orders_2022', 'orders_2023', 'orders_2024']) AS order_year,
UNNEST(ARRAY[orders_2021, orders_2022, orders_2023, orders_2024]) AS order_count
FROM country_summary
ORDER BY country_name;

--SQL 05
SELECT
country_name,
UNNEST(ARRAY['2021', '2022', '2023', '2024']) AS order_year,
UNNEST(ARRAY[orders_2021, orders_2022, orders_2023, orders_2024]) AS order_count
FROM country_summary
ORDER BY country_name;

--SQL 06
SELECT
country_name,
UNNEST(ARRAY[2021, 2022, 2023, 2024]) AS order_year,
UNNEST(ARRAY[orders_2021, orders_2022, orders_2023, orders_2024]) AS order_count
FROM country_summary
ORDER BY country_name;