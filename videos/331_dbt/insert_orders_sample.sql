INSERT INTO `raw_data.orders` (order_id, customer_id, order_date, status, amount_usd)
VALUES
  (1001, 201, TIMESTAMP '2024-01-05 09:15:00', 'delivered', 94),
  (1002, 202, TIMESTAMP '2024-01-07 14:22:00', 'delivered', 210),
  (1003, 203, TIMESTAMP '2024-01-09 11:03:00', 'shipped', 45),
  (1004, 201, TIMESTAMP '2024-01-10 16:45:00', 'shipped', 130),
  (1005, 204, TIMESTAMP '2024-01-12 08:30:00', 'placed', 67),
  (1006, 205, TIMESTAMP '2024-01-13 10:10:00', 'placed', 310),
  (1007, 206, TIMESTAMP '2024-01-14 13:55:00', 'cancelled', 88),
  (1008, 207, TIMESTAMP '2024-01-15 17:20:00', 'cancelled', 52),
  (1009, 208, TIMESTAMP '2024-01-16 09:00:00', 'delivered', 175),
  (1010, 202, TIMESTAMP '2024-01-17 12:35:00', 'placed', 99);