--Set up sample data
CREATE TABLE sample_genres (
  genres VARCHAR(500)
);

INSERT INTO sample_genres (genres) VALUES ('[''drama'', ''action'', ''romance'', ''family'', ''fantasy'']');

/* Testing queries */
select * from json_array_elements('[1,true, [2,false]]');

--works
SELECT REPLACE(g.genres, '''', '"')::json
FROM sample_genres g;

--works
SELECT json_array_elements_text(REPLACE(g.genres, '''', '"')::json) AS genre_value
FROM sample_genres g;


--Select data (works)
SELECT
g.genres,
j.value AS genre_value
FROM sample_genres g
CROSS JOIN LATERAL JSON_ARRAY_ELEMENTS_TEXT(
  REPLACE(g.genres, '''', '"')::json
) j
