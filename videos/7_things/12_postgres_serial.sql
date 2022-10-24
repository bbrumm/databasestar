/*
Postgres Serial
*/

CREATE TABLE product (
  product_id INT SERIAL PRIMARY KEY,
  product_name VARCHAR(200),
  price INT
);
