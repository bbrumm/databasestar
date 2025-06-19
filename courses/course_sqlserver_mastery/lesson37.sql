SELECT id, some_data
FROM test_json;


DECLARE @json VARCHAR(MAX);

SET @json = '[
{"id":"1", "color":"blue", "size":"large"},
{"id":"2", "color":"red", "size":"medium"}
]';

SELECT *
FROM OPENJSON(@json) WITH (
	id INT '$.id',
	color VARCHAR(100) '$.color',
	size VARCHAR(100) '$.size'
);



SELECT id, color
FROM OPENJSON(@json) WITH (
	id INT '$.id',
	color VARCHAR(100) '$.color',
	size VARCHAR(100) '$.size'
);