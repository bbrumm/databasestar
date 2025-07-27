SELECT COUNT(*) FROM dirty_cafe_sales;

SELECT * FROM dirty_cafe_sales;

--Look for duplicates
SELECT
"Transaction ID",
item,
quantity,
"Price Per Unit",
"Total Spent",
"Payment Method",
location,
"Transaction Date",
count(*)
FROM dirty_cafe_sales
group by "Transaction ID",
item,
quantity,
"Price Per Unit",
"Total Spent",
"Payment Method",
location,
"Transaction Date"
order by count(*) DESC;


SELECT "Transaction ID", COUNT(*)
FROM dirty_cafe_sales
GROUP BY "Transaction ID";

SELECT COUNT(*)
FROM dirty_cafe_sales
WHERE "Transaction ID" IS NULL;

SELECT item, COUNT(*)
FROM dirty_cafe_sales
GROUP BY item;


SELECT quantity, COUNT(*)
FROM dirty_cafe_sales
GROUP BY quantity;

SELECT "Price Per Unit", COUNT(*)
FROM dirty_cafe_sales
GROUP BY "Price Per Unit";


SELECT "Total Spent", COUNT(*)
FROM dirty_cafe_sales
GROUP BY "Total Spent";


SELECT "Payment Method", COUNT(*)
FROM dirty_cafe_sales
GROUP BY "Payment Method";

SELECT location, COUNT(*)
FROM dirty_cafe_sales
GROUP BY location;

SELECT "Transaction Date", COUNT(*)
FROM dirty_cafe_sales
GROUP BY "Transaction Date";

--Alter column names
ALTER TABLE dirty_cafe_sales RENAME "Transaction ID" TO transaction_id;
ALTER TABLE dirty_cafe_sales RENAME "Price Per Unit" TO price_per_unit;
ALTER TABLE dirty_cafe_sales RENAME "Total Spent" TO total_spent;
ALTER TABLE dirty_cafe_sales RENAME "Payment Method" TO payment_method;
ALTER TABLE dirty_cafe_sales RENAME "Transaction Date" TO transaction_date;



UPDATE dirty_cafe_sales
SET payment_method = NULL
WHERE payment_method IN ('ERROR', 'UNKNOWN');

UPDATE dirty_cafe_sales
SET location = NULL
WHERE location IN ('ERROR', 'UNKNOWN');

UPDATE dirty_cafe_sales
SET transaction_date = NULL
WHERE transaction_date IN ('ERROR', 'UNKNOWN');


SELECT
column_name,
data_type,
ordinal_position
FROM information_schema.columns
WHERE table_name = 'dirty_cafe_sales';

--Update data types
ALTER TABLE dirty_cafe_sales
ADD COLUMN transaction_date_new DATE;

SELECT transaction_id, transaction_date
FROM dirty_cafe_sales;

SELECT transaction_id,
       transaction_date,
       TO_DATE(transaction_date, 'YYYY-MM-DD')
FROM dirty_cafe_sales;

UPDATE dirty_cafe_sales
SET transaction_date_new = TO_DATE(transaction_date, 'YYYY-MM-DD');

SELECT * FROM dirty_cafe_sales;

ALTER TABLE dirty_cafe_sales
DROP COLUMN transaction_date;

ALTER TABLE dirty_cafe_sales
RENAME transaction_date_new TO transaction_date;

SELECT * FROM dirty_cafe_sales;

SELECT *
FROM dirty_cafe_sales
WHERE (quantity IS NOT NULL AND quantity NOT IN ('ERROR', 'UNKNOWN'))
AND (price_per_unit IS NOT NULL AND price_per_unit NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NULL OR total_spent IN ('ERROR', 'UNKNOWN'));


UPDATE dirty_cafe_sales
SET total_spent = quantity * price_per_unit
WHERE (quantity IS NOT NULL AND quantity NOT IN ('ERROR', 'UNKNOWN'))
AND (price_per_unit IS NOT NULL AND price_per_unit NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NULL OR total_spent IN ('ERROR', 'UNKNOWN'));


UPDATE dirty_cafe_sales
SET total_spent = CAST(quantity AS DECIMAL) * CAST(price_per_unit AS DECIMAL)
WHERE (quantity IS NOT NULL AND quantity NOT IN ('ERROR', 'UNKNOWN'))
AND (price_per_unit IS NOT NULL AND price_per_unit NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NULL OR total_spent IN ('ERROR', 'UNKNOWN'));


SELECT *
FROM dirty_cafe_sales
WHERE (quantity IS NOT NULL AND quantity NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NOT NULL AND total_spent NOT IN ('ERROR', 'UNKNOWN'))
AND (price_per_unit IS NULL OR price_per_unit IN ('ERROR', 'UNKNOWN'));

UPDATE dirty_cafe_sales
SET price_per_unit = CAST(total_spent AS DECIMAL) / CAST(quantity AS DECIMAL)
WHERE (quantity IS NOT NULL AND quantity NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NOT NULL AND total_spent NOT IN ('ERROR', 'UNKNOWN'))
AND (price_per_unit IS NULL OR price_per_unit IN ('ERROR', 'UNKNOWN'));

SELECT *
FROM dirty_cafe_sales
WHERE (price_per_unit IS NOT NULL AND price_per_unit NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NOT NULL AND total_spent NOT IN ('ERROR', 'UNKNOWN'))
AND (quantity IS NULL OR quantity IN ('ERROR', 'UNKNOWN'));


UPDATE dirty_cafe_sales
SET quantity = CAST(total_spent AS DECIMAL) / CAST(price_per_unit AS DECIMAL)
WHERE (price_per_unit IS NOT NULL AND price_per_unit NOT IN ('ERROR', 'UNKNOWN'))
AND (total_spent IS NOT NULL AND total_spent NOT IN ('ERROR', 'UNKNOWN'))
AND (quantity IS NULL OR quantity IN ('ERROR', 'UNKNOWN'));

SELECT *
FROM dirty_cafe_sales;

SELECT quantity, COUNT(*)
FROM dirty_cafe_sales
GROUP BY quantity;

SELECT price_per_unit, COUNT(*)
FROM dirty_cafe_sales
GROUP BY price_per_unit;


SELECT total_spent, COUNT(*)
FROM dirty_cafe_sales
GROUP BY total_spent;

UPDATE dirty_cafe_sales
SET quantity = NULL
WHERE quantity IN ('ERROR', 'UNKNOWN');

UPDATE dirty_cafe_sales
SET price_per_unit = NULL
WHERE price_per_unit IN ('ERROR', 'UNKNOWN');

UPDATE dirty_cafe_sales
SET total_spent = NULL
WHERE total_spent IN ('ERROR', 'UNKNOWN');

ALTER TABLE dirty_cafe_sales
ALTER COLUMN quantity TYPE INTEGER;

ALTER TABLE dirty_cafe_sales
ALTER COLUMN quantity TYPE INTEGER USING quantity::integer;

UPDATE dirty_cafe_sales
SET quantity = '1'
WHERE quantity = '1.00000000000000000000';

UPDATE dirty_cafe_sales
SET quantity = '2'
WHERE quantity = '2.0000000000000000';

UPDATE dirty_cafe_sales
SET quantity = '3'
WHERE quantity = '3.0000000000000000';

UPDATE dirty_cafe_sales
SET quantity = '4'
WHERE quantity = '4.0000000000000000';

UPDATE dirty_cafe_sales
SET quantity = '5'
WHERE quantity = '5.0000000000000000';


SELECT price_per_unit, COUNT(*)
FROM dirty_cafe_sales
GROUP BY price_per_unit;

UPDATE dirty_cafe_sales
SET price_per_unit = NULL
WHERE price_per_unit IN ('ERROR', 'UNKNOWN');

ALTER TABLE dirty_cafe_sales
ALTER COLUMN price_per_unit TYPE DECIMAL USING price_per_unit::decimal;


SELECT total_spent, COUNT(*)
FROM dirty_cafe_sales
GROUP BY total_spent;


UPDATE dirty_cafe_sales
SET total_spent = NULL
WHERE total_spent IN ('ERROR', 'UNKNOWN');

ALTER TABLE dirty_cafe_sales
ALTER COLUMN total_spent TYPE DECIMAL USING total_spent::decimal;

--Final query
SELECT
transaction_id,
item,
quantity,
price_per_unit,
total_spent,
payment_method,
location,
transaction_date
FROM dirty_cafe_sales;