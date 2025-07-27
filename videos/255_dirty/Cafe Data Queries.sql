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


