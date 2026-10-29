-- Video 339, Section 4: Your First Database
-- Run the statements in order. Generated from the section script.


-- ---- CREATE DATABASE ----
CREATE DATABASE online_store;

-- Run it a second time on camera to show error 1007: Can't create database 'online_store'; database exists

CREATE DATABASE IF NOT EXISTS online_store;


-- ---- SHOW DATABASES ----
SHOW DATABASES;


-- ---- USE ----
USE online_store;


-- ---- DROP DATABASE ----
CREATE DATABASE test_db;

DROP DATABASE test_db;

DROP DATABASE IF EXISTS test_db;


-- ---- Mini-Challenge Solution ----
CREATE DATABASE practice_db;

SHOW DATABASES;

DROP DATABASE practice_db;
