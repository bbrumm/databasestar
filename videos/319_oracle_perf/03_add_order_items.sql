-- Adds 2–5 line items per order, then recalculates order_total
DECLARE
  v_product_id  oe.product_information.product_id%TYPE;
  v_unit_price  oe.order_items.unit_price%TYPE;
  v_quantity    NUMBER;
  v_line_item   NUMBER;

  CURSOR c_orders IS
    SELECT o.order_id
    FROM   oe.orders o
    WHERE  NOT EXISTS (
      SELECT 1 FROM oe.order_items oi WHERE oi.order_id = o.order_id
    );
BEGIN
  FOR rec IN c_orders LOOP
    v_line_item := 1;

    FOR k IN 1..TRUNC(DBMS_RANDOM.VALUE(2, 6)) LOOP
      SELECT product_id, list_price
      INTO   v_product_id, v_unit_price
      FROM   oe.product_information
      WHERE  list_price IS NOT NULL
        AND  ROWNUM = 1
      ORDER BY DBMS_RANDOM.VALUE;

      v_quantity := TRUNC(DBMS_RANDOM.VALUE(1, 10));

      INSERT INTO oe.order_items (
        order_id,
        line_item_id,
        product_id,
        unit_price,
        quantity
      ) VALUES (
        rec.order_id,
        v_line_item,
        v_product_id,
        v_unit_price,
        v_quantity
      );

      v_line_item := v_line_item + 1;
    END LOOP;

    -- Update order total to match line items
    UPDATE oe.orders
    SET    order_total = (
      SELECT SUM(unit_price * quantity)
      FROM   oe.order_items
      WHERE  order_id = rec.order_id
    )
    WHERE  order_id = rec.order_id;

    IF MOD(rec.order_id, 1000) = 0 THEN
      COMMIT;
    END IF;
  END LOOP;
  COMMIT;
END;
/