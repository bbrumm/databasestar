--Set up sample data
CREATE TABLE sample_genres (
  genres VARCHAR(500)
);

INSERT INTO sample_genres (genres) VALUES ('[''drama'', ''action'', ''romance'', ''family'', ''fantasy'']');

--Select query (works)
SELECT
g.genres,
j.value AS genre_value
FROM sample_genres g
CROSS APPLY OPENJSON(REPLACE(g.genres, '''', '"')) j;