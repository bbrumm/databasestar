/*
Chinook Postgres Data Generator (Customers + Invoices + InvoiceLines)

How to use:
1) Adjust the settings in the "CONFIG" section.
2) Run the whole script.

Notes:
- Uses temp tables to capture inserted IDs and then generate dependent rows.
- Calculates Invoice.Total from generated InvoiceLines.
- Generates random TrackId selections and realistic-ish quantities and dates.
*/

BEGIN;

DO $$
DECLARE
  v_customers_to_add        integer := 50000;  -- <<<<<< EDIT
  v_invoices_per_customer   integer := 10;     -- <<<<<< EDIT (average; exact fixed per customer in this script)
  v_lines_per_invoice       integer := 5;      -- <<<<<< EDIT (exact fixed per invoice in this script)

  v_min_invoice_days_ago    integer := 365*5;  -- invoices spread over last ~5 years
  v_max_invoice_days_ago    integer := 0;

  v_track_count             integer;
  v_rep_count               integer;

  v_existing_customer_max   integer;
BEGIN
  -- Basic safety checks
  IF v_customers_to_add <= 0 THEN
    RAISE EXCEPTION 'v_customers_to_add must be > 0';
  END IF;
  IF v_invoices_per_customer <= 0 THEN
    RAISE EXCEPTION 'v_invoices_per_customer must be > 0';
  END IF;
  IF v_lines_per_invoice <= 0 THEN
    RAISE EXCEPTION 'v_lines_per_invoice must be > 0';
  END IF;

  SELECT COUNT(*) INTO v_track_count FROM track;
  IF v_track_count = 0 THEN
    RAISE EXCEPTION 'Track table is empty; cannot generate InvoiceLines';
  END IF;

  SELECT COUNT(*) INTO v_rep_count FROM employee;
  IF v_rep_count = 0 THEN
    -- Chinook typically has Employee and Customer.SupportRepId references EmployeeId
    RAISE NOTICE 'Employee table is empty; SupportRepId will be NULL';
  END IF;

  SELECT COALESCE(MAX(customer_id), 0) INTO v_existing_customer_max FROM customer;

  -- Temp tables to hold new IDs
  CREATE TEMP TABLE tmp_new_customers (customer_id integer) ON COMMIT DROP;
  CREATE TEMP TABLE tmp_new_invoices (invoice_id integer, customer_id integer) ON COMMIT DROP;

  -- ---------------------------------------------------------
  -- 1) Insert Customers
  -- ---------------------------------------------------------
  WITH inserted AS (
      INSERT INTO customer
          (
           first_name, last_name, company, address, city, state, country, postal_code,
           phone, fax, email, support_rep_id
              )
          SELECT 'First' || (v_existing_customer_max + gs)                                                                                                  AS first_name,
                 'Last' || (v_existing_customer_max + gs)                                                                                                   AS last_name,
                 CASE
                     WHEN random() < 0.30 THEN 'Company ' || (v_existing_customer_max + gs)
                     ELSE NULL END                                                                                                                          AS company,
                 (100 + (random() * 900)::int)::text || ' Example St'                                                                                       AS address,
                 (ARRAY ['Edinburgh','London','Glasgow','Manchester','Bristol','Leeds','Birmingham','Dublin','Cardiff','Belfast'])[1 + (random() * 9)::int] AS city,
                 NULL                                                                                                                                       AS state,
                 (ARRAY ['United Kingdom','Ireland'])[1 + (random() * 1)::int]                                                                              AS country,
                 lpad(((random() * 99999)::int)::text, 5, '0')                                                                                              AS postal_code,
                 '+44 ' || (100000000 + (random() * 899999999)::bigint)::text                                                                               AS phone,
                 NULL                                                                                                                                       AS fax,
                 'user' || (v_existing_customer_max + gs) || '@example.com'                                                                                 AS email,
                 CASE
                     WHEN v_rep_count = 0 THEN NULL
                     ELSE (SELECT employee_id FROM employee ORDER BY random() LIMIT 1)
                     END                                                                                                                                    AS support_rep_id
          FROM generate_series(1, v_customers_to_add) gs
          RETURNING customer_id)
  INSERT INTO tmp_new_customers
  SELECT customer_id
  FROM inserted;

  -- ---------------------------------------------------------
  -- 2) Insert Invoices for new customers
  -- ---------------------------------------------------------
  WITH inserted AS (
      INSERT INTO invoice
          (
           customer_id, invoice_date,
           billing_address, billing_city, billing_state, billing_country, billing_postal_code, total
              )
          SELECT c.customer_id,
                 -- Random date between v_min_invoice_days_ago and v_max_invoice_days_ago
                 (now() -
                  ((v_min_invoice_days_ago + (random() * (v_max_invoice_days_ago - v_min_invoice_days_ago))::int) ||
                   ' days')::interval)
                     - ((random() * 86400)::int || ' seconds')::interval AS invoice_date,

                 -- Copy billing-ish fields from customer (simple + realistic)
                 cu.address                                              AS billing_address,
                 cu.city                                                 AS billing_city,
                 cu.state                                                AS billing_state,
                 cu.country                                              AS billing_country,
                 cu.postal_code                                          AS billing_postal_code,
                 0.00::numeric(10, 2)                                    AS total
          FROM tmp_new_customers c
                   JOIN customer cu ON cu.customer_id = c.customer_id
                   CROSS JOIN generate_series(1, v_invoices_per_customer) invn
          RETURNING invoice_id, customer_id)
  INSERT INTO tmp_new_invoices
  SELECT invoice_id, customer_id
  FROM inserted;

  -- ---------------------------------------------------------
  -- 3) Insert InvoiceLines for those invoices
  -- ---------------------------------------------------------
  -- We pick random tracks, use track.UnitPrice, random quantity 1..3
  INSERT INTO invoice_line
  (
    invoice_id, track_id, unit_price, quantity
  )
SELECT
    sub.invoice_id,
    sub.random_track_id AS track_id,
    t.unit_price,
    sub.quantity
FROM (SELECT i.invoice_id,
             (random() * (v_track_count - 1))::int AS random_track_id,
             (1 + (random() * 2)::int)    AS quantity
      FROM invoice i
               CROSS JOIN generate_series(1, 5) ln) sub
INNER JOIN track t ON sub.random_track_id = t.track_id;

  -- ---------------------------------------------------------
  -- 4) Update Invoice totals based on its InvoiceLines
  -- ---------------------------------------------------------
  UPDATE invoice inv
  SET total = sub.total
  FROM (
    SELECT il.invoice_id,
           ROUND(SUM(il.unit_price * il.quantity)::numeric, 2) AS total
    FROM invoice_line il
    JOIN tmp_new_invoices ni ON ni.invoice_id= il.invoice_id
    GROUP BY il.invoice_id
  ) sub
  WHERE inv.invoice_id = sub.invoice_id;

  RAISE NOTICE 'Inserted % customers, % invoices, % invoice lines',
    v_customers_to_add,
    (v_customers_to_add * v_invoices_per_customer),
    (v_customers_to_add * v_invoices_per_customer * v_lines_per_invoice);

END $$;

COMMIT;

-- Helpful for performance demos: gather stats after bulk insert
ANALYZE customer;
ANALYZE invoice;
ANALYZE invoice_line;