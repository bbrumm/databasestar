CREATE TABLE country_summary (
  country_name (200),
  orders_2022 INTEGER,
  orders_2023 INTEGER,
  orders_2024 INTEGER,
  orders_2025 INTEGER
);


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


SELECT country_name, total_orders, order_year
FROM country_summary
UNPIVOT (
  total_orders
  FOR order_year
  IN (orders_2022, orders_2023, orders_2024, orders_2025)
) AS unpvt;


SELECT
country_name,
total_orders,
CASE order_year
	WHEN 'orders_2022' THEN 2022
	WHEN 'orders_2023' THEN 2023
	WHEN 'orders_2024' THEN 2024
	WHEN 'orders_2025' THEN 2025
END AS order_year
FROM country_summary
UNPIVOT (
  total_orders
  FOR order_year
  IN (orders_2022, orders_2023, orders_2024, orders_2025)
) AS unpvt