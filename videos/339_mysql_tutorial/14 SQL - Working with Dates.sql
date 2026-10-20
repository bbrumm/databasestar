-- Video 339, Section 14: Working with Dates
-- Run the statements in order. Generated from the section script.


-- ---- Section 14: Working with Dates ----
USE online_store;


-- ---- Adding a Date Column ----
ALTER TABLE customers
ADD COLUMN signup_date DATE;


-- ---- Filling in the Dates ----
UPDATE customers SET signup_date = '2023-03-15' WHERE customer_id = 1;
UPDATE customers SET signup_date = '2023-07-22' WHERE customer_id = 2;
UPDATE customers SET signup_date = '2024-01-10' WHERE customer_id = 3;
UPDATE customers SET signup_date = '2024-05-30' WHERE customer_id = 4;
UPDATE customers SET signup_date = '2024-11-02' WHERE customer_id = 5;
UPDATE customers SET signup_date = '2025-02-14' WHERE customer_id = 6;
UPDATE customers SET signup_date = '2025-08-19' WHERE customer_id = 7;
UPDATE customers SET signup_date = '2026-01-05' WHERE customer_id = 8;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1292: Incorrect date value (MySQL needs YYYY-MM-DD)
-- UPDATE customers
-- SET signup_date = '15/03/2023'
-- WHERE customer_id = 1;

SELECT name, signup_date
FROM customers
WHERE signup_date >= '2025-01-01';


-- ---- CURDATE and DATEDIFF ----
SELECT CURDATE();

SELECT name,
       signup_date,
       DATEDIFF(CURDATE(), signup_date) AS days_since_signup
FROM customers;


-- ---- YEAR ----
SELECT name,
       signup_date,
       YEAR(signup_date) AS signup_year
FROM customers;

SELECT YEAR(signup_date) AS signup_year,
       COUNT(*) AS customers
FROM customers
GROUP BY YEAR(signup_date)
ORDER BY signup_year;


-- ---- Mini-Challenge ----
ALTER TABLE products
ADD COLUMN date_added DATE;

UPDATE products SET date_added = '2025-06-01' WHERE product_id IN (1, 2, 3);
UPDATE products SET date_added = '2026-02-20' WHERE product_id IN (4, 5, 6);

SELECT name,
       date_added,
       DATEDIFF(CURDATE(), date_added) AS days_since_added
FROM products
WHERE date_added IS NOT NULL;
