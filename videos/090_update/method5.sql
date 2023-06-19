/*
Method 5: create table as select
*/

CREATE TABLE comments_v2 AS
SELECT
id,
postid,
score,
REPLACE(text, '&quot;', '''') AS text,
creationdate,
userid,
contentlicense
FROM comments_2m;

ALTER TABLE comments_2m RENAME TO comments_old;
ALTER TABLE comments_v2 RENAME TO comments_2m;