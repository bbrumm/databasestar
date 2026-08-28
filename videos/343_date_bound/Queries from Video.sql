SELECT id, order_date, total_amount
FROM cust_order
order by order_date asc;

CREATE SEQUENCE order_id_seq START WITH 51;



INSERT INTO cust_order (id, customer_id, order_date, total_amount)
VALUES
  (nextval('order_id_seq'), 7,  '2024-01-01 09:15:00',  45.99),
  (nextval('order_id_seq'),12,  '2024-01-02 14:30:00', 128.50),
  (nextval('order_id_seq'), 3,  '2024-01-03 11:45:00',  67.25),
  (nextval('order_id_seq'),25,  '2024-01-04 16:20:00', 189.99),
  (nextval('order_id_seq'),18,  '2024-01-05 08:00:00',  34.75),
  (nextval('order_id_seq'), 9,  '2024-01-07 13:10:00',  95.50),
  (nextval('order_id_seq'),22,  '2024-01-08 17:45:00', 152.30),
  (nextval('order_id_seq'), 5,  '2024-01-09 10:30:00',  78.90),
  (nextval('order_id_seq'),14,  '2024-01-10 15:00:00',  43.20),
  (nextval('order_id_seq'),28,  '2024-01-11 09:45:00', 175.60),
  (nextval('order_id_seq'), 1,  '2024-01-12 12:15:00',  56.80),
  (nextval('order_id_seq'),17,  '2024-01-14 14:00:00', 110.45),
  (nextval('order_id_seq'), 6,  '2024-01-15 07:30:00',  88.15),
  (nextval('order_id_seq'),30,  '2024-01-16 16:50:00', 199.00),
  (nextval('order_id_seq'),11,  '2024-01-17 11:20:00',  62.40),
  (nextval('order_id_seq'),24,  '2024-01-18 13:35:00', 141.75),
  (nextval('order_id_seq'), 2,  '2024-01-19 09:00:00',  29.50),
  (nextval('order_id_seq'),19,  '2024-01-21 15:45:00',  83.60),
  (nextval('order_id_seq'), 8,  '2024-01-22 10:10:00', 167.20),
  (nextval('order_id_seq'),26,  '2024-01-23 14:25:00',  51.90),
  (nextval('order_id_seq'),13,  '2024-01-24 08:40:00', 118.35),
  (nextval('order_id_seq'), 4,  '2024-01-25 17:00:00',  74.80),
  (nextval('order_id_seq'),20,  '2024-01-26 12:30:00', 193.45),
  (nextval('order_id_seq'),15,  '2024-01-28 09:20:00',  38.70),
  (nextval('order_id_seq'),29,  '2024-01-29 15:55:00', 147.25),
  (nextval('order_id_seq'),10,  '2024-01-30 11:05:00',  92.60),
  (nextval('order_id_seq'),23,  '2024-01-31 07:15:00',  65.35),
  (nextval('order_id_seq'),16,  '2024-01-31 18:30:00', 182.10),
  (nextval('order_id_seq'),27,  '2024-02-01 00:30:00',  47.85),  -- boundary: early
  (nextval('order_id_seq'), 3,  '2024-02-01 09:45:00', 133.60),  -- boundary: mid-day
  (nextval('order_id_seq'),21,  '2024-02-01 23:50:00',  78.25),  -- boundary: late
  (nextval('order_id_seq'), 7,  '2024-02-02 14:00:00', 156.90),
  (nextval('order_id_seq'),18,  '2024-02-03 10:20:00',  42.15),
  (nextval('order_id_seq'),12,  '2024-02-05 16:40:00',  97.80),
  (nextval('order_id_seq'),25,  '2024-02-06 08:55:00', 171.30),
  (nextval('order_id_seq'), 9,  '2024-02-07 13:10:00',  59.45),
  (nextval('order_id_seq'),22,  '2024-02-08 17:25:00', 124.70),
  (nextval('order_id_seq'), 5,  '2024-02-09 11:40:00',  88.55),
  (nextval('order_id_seq'),14,  '2024-02-10 09:05:00',  36.20),
  (nextval('order_id_seq'),28,  '2024-02-12 15:30:00', 163.85),
  (nextval('order_id_seq'), 1,  '2024-02-13 07:50:00',  74.40),
  (nextval('order_id_seq'),17,  '2024-02-14 12:15:00', 198.60),
  (nextval('order_id_seq'), 6,  '2024-02-15 14:35:00',  53.75),
  (nextval('order_id_seq'),30,  '2024-02-16 10:00:00', 107.90),
  (nextval('order_id_seq'),11,  '2024-02-19 16:20:00',  82.35),
  (nextval('order_id_seq'),24,  '2024-02-20 08:45:00', 145.60),
  (nextval('order_id_seq'), 2,  '2024-02-21 13:00:00',  67.15),
  (nextval('order_id_seq'),19,  '2024-02-23 17:40:00', 178.80),
  (nextval('order_id_seq'), 8,  '2024-02-26 11:55:00',  24.50),
  (nextval('order_id_seq'),26,  '2024-02-29 14:10:00', 139.25);