/*
Create a copy of the table
*/
CREATE TABLE comments_2m_backup AS
SELECT *
FROM comments_2m;

/*
Reset tables
*/
DROP TABLE IF EXISTS ids_to_update;

DROP TABLE IF EXISTS comments_old;
DROP TABLE IF EXISTS comments_v2;

DROP TABLE IF EXISTS comments_2m;
CREATE TABLE comments_2m AS
SELECT *
FROM comments_2m_backup;