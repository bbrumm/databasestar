/*
Connect By
*/

--SQL 01
SELECT
category_id,
category_name,
parent_category_id
FROM book_category
START WITH parent_category_id IS NULL
CONNECT BY parent_category_id = PRIOR category_id;

--SQL 02
--Add level
SELECT
category_id,
category_name,
parent_category_id,
LEVEL
FROM book_category
START WITH parent_category_id IS NULL
CONNECT BY parent_category_id = PRIOR category_id;

--SQL 03
--Add path
SELECT
category_id,
category_name,
parent_category_id,
LEVEL,
SYS_CONNECT_BY_PATH(category_id, '.') AS category_path
FROM book_category
START WITH parent_category_id IS NULL
CONNECT BY parent_category_id = PRIOR category_id;

--SQL 04
--Indent
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + level, '-') AS category_name,
parent_category_id,
LEVEL,
SYS_CONNECT_BY_PATH(category_id, '.') AS category_path
FROM book_category
START WITH parent_category_id IS NULL
CONNECT BY parent_category_id = PRIOR category_id;

--SQL 05
--Order siblings
SELECT
category_id,
category_name,
parent_category_id,
LEVEL,
SYS_CONNECT_BY_PATH(category_id, '.') AS category_path
FROM book_category
START WITH parent_category_id IS NULL
CONNECT BY parent_category_id = PRIOR category_id
ORDER SIBLINGS BY category_name;