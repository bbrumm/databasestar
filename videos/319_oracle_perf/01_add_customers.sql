-- Adds ~10,000 customers based on existing data patterns
BEGIN
  FOR i IN 1..10000 LOOP
    INSERT INTO oe.customers (
      customer_id,
      cust_first_name,
      cust_last_name,
      cust_email,
      credit_limit,
      cust_street_address1,
      cust_postal_code,
      cust_city,
      cust_state_province,
      country_id,
      nls_language,
      nls_territory,
      account_mgr_id
    )
    SELECT
      oe.customers_seq.NEXTVAL,
      'FirstName' || i,
      'LastName' || i,
      'customer' || i || '@example.com',
      ROUND(DBMS_RANDOM.VALUE(500, 10000), 2),
      i || ' Main Street',
      LPAD(MOD(i, 90000) + 10000, 5, '0'),
      'City' || MOD(i, 100),
      'State' || MOD(i, 50),
      country_id,
      nls_language,
      nls_territory,
      account_mgr_id
    FROM oe.customers
    WHERE customer_id = (
      SELECT MIN(customer_id) + MOD(i, (SELECT COUNT(*) FROM oe.customers))
      FROM oe.customers
    );
  END LOOP;
  COMMIT;
END;
/