INSERT INTO test_json (id, some_data)
VALUES (5, '
{
  "id":"1",
  "name":"Running Shoes",
  "colors":["blue", "red", "black"]
}
');


SELECT id, some_data
FROM test_json;


INSERT INTO test_json (id, some_data)
VALUES (6, '
{
  "id":"2",
  "name":"Casual Shoes",
  "sizes":[5, 6, 7, 7.5, 8, 8.5, 9, 10]
}
');