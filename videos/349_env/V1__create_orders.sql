CREATE TABLE orders (
  order_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_id  INT NOT NULL,
  order_date   DATE NOT NULL,
  total_amount NUMERIC(8,2) NOT NULL
);
