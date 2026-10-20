-- Video 339, Section 13: String Functions
-- Run the statements in order. Generated from the section script.


-- ---- Section 13: String Functions ----
USE online_store;


-- ---- What Is a Function? ----
SELECT UPPER('hello');


-- ---- LENGTH ----
SELECT name, LENGTH(name) AS name_length
FROM customers;

SELECT name, LENGTH(name) AS name_length
FROM customers
WHERE LENGTH(name) > 10;


-- ---- UPPER and LOWER ----
SELECT name,
       UPPER(name) AS upper_name,
       LOWER(name) AS lower_name
FROM customers;


-- ---- The Data Hasn't Changed ----
SELECT name FROM customers;


-- ---- Mini-Challenge ----
SELECT name,
       LENGTH(name) AS name_length,
       UPPER(name) AS upper_name
FROM products;

SELECT name,
       LENGTH(name) AS name_length,
       UPPER(name) AS upper_name
FROM products
WHERE LENGTH(name) > 8;
