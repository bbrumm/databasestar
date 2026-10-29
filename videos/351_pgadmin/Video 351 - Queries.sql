-- ============================================
-- Video 351 — How to Use pgAdmin: A 2026 Beginner Walkthrough
-- PostgreSQL
-- ============================================
-- Database: shop (created in pgAdmin during the video)
-- Table: public.customers (5 rows)
-- Run each section on its own by highlighting it, then pressing F5.
-- ============================================


-- ============================================
-- Reference only: the table is created with the pgAdmin dialog in the video.
-- This is the equivalent SQL. Compare it to the SQL tab in the dialog.
-- ============================================
-- CREATE TABLE public.customers
-- (
--     customer_id integer NOT NULL,
--     first_name character varying(100) NOT NULL,
--     last_name character varying(100) NOT NULL,
--     email character varying(255),
--     PRIMARY KEY (customer_id)
-- );


-- ============================================
-- 1. Insert some rows
-- ============================================
INSERT INTO customers (customer_id, first_name, last_name, email)
VALUES
  (1, 'Maria', 'Lopez', 'maria.lopez@example.com'),
  (2, 'James', 'Smith', 'james.smith@example.com'),
  (3, 'Priya', 'Patel', 'priya.patel@example.com'),
  (4, 'Chen', 'Wei', 'chen.wei@example.com'),
  (5, 'Sam', 'Taylor', 'sam.taylor@example.com');


-- ============================================
-- 2. Your first query
-- ============================================
SELECT *
FROM customers;


-- ============================================
-- 3. Filter with WHERE
-- ============================================
SELECT *
FROM customers
WHERE last_name = 'Smith';


-- ============================================
-- 4. Sort with ORDER BY
-- ============================================
SELECT *
FROM customers
ORDER BY last_name;


-- ============================================
-- 5. Run just part of the code
-- Add this below the query in step 4, then highlight only one query to run it.
-- ============================================
SELECT first_name, email
FROM customers;


-- ============================================
-- 6. Format SQL and Toggle Comment
-- Paste this messy query, then use Edit > Format SQL.
-- Then click the WHERE line and use Edit > Toggle Comment.
-- ============================================
select first_name,last_name,email from customers where last_name='Smith' order by first_name;
