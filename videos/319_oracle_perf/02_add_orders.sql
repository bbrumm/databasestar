-- Adds ~300,000 orders spread across all customers
DECLARE
  v_customer_id  oe.customers.customer_id%TYPE;
  v_order_date   DATE;
  v_sales_rep_id oe.orders.sales_rep_id%TYPE;

  CURSOR c_customers IS
    SELECT customer_id FROM oe.customers;
BEGIN
  FOR rec IN c_customers LOOP
    FOR j IN 1..30 LOOP
      v_order_date := SYSDATE - DBMS_RANDOM.VALUE(1, 730);

      SELECT sales_rep_id
      INTO   v_sales_rep_id
      FROM   oe.orders
      WHERE  ROWNUM = 1;

      INSERT INTO oe.orders (
        order_id,
        order_date,
        order_mode,
        customer_id,
        order_status,
        order_total,
        sales_rep_id
      ) VALUES (
        oe.orders_seq.NEXTVAL,
        v_order_date,
        CASE MOD(j, 3)
          WHEN 0 THEN 'online'
          WHEN 1 THEN 'direct'
          ELSE 'telephone'
        END,
        rec.customer_id,
        MOD(j, 6),
        0,  -- updated in Script 3
        v_sales_rep_id
      );
    END LOOP;

    -- Commit in batches to avoid undo space issues
    IF MOD(rec.customer_id, 500) = 0 THEN
      COMMIT;
    END IF;
  END LOOP;
  COMMIT;
END;
/