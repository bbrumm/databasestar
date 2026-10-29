# OE-Style Order Entry Database

I've created this Order-Entry-style schema for Oracle - CUSTOMERS, PRODUCTS,
ORDERS, ORDER_ITEMS, plus small lookup tables (REGIONS, COUNTRIES,
PRODUCT_CATEGORIES, WAREHOUSES, SALES_REPS).

It's built to avoid the dependency headaches of Oracle's official OE/HR sample install, and to
scale to whatever row count you need for performance demos and testing.

No SQL\*Plus-only syntax (no `DEFINE`, no `ACCEPT` prompts), so every script runs the same way in SQL*Plus, DataGrip, or any other client.

## Files To Run

Run these files in order

1. **01_create_schema.sql** - creates all tables, sequences, and indexes.
2. **02_seed_reference_data.sql** - loads the lookup tables (regions,
   countries, categories, warehouses, sales reps) plus small "seed"
   tables (names, cities, product name parts) used purely for generating
   realistic-looking data in step 3.
3. **03_generate_bulk_data.sql** - the main script. A single PL/SQL block
   that set-based generates CUSTOMERS, PRODUCTS, ORDERS, and ORDER_ITEMS
   at whatever scale you set at the top of the file.
4. **04_verify_setup.sql** - row counts and a few checks to confirm
   everything loaded correctly.
5. **05_drop_all.sql** - drops everything, in case you want to re-run
   with different scale settings.

## How to run

Open your favourite SQL editor.

Then run each script in order:

```sql
01_create_schema.sql
02_seed_reference_data.sql
03_generate_bulk_data.sql
04_verify_setup.sql
```

## Adjusting scale

Open **03_generate_bulk_data.sql** and edit the variables at the top of
the `DECLARE` block:

```sql
v_customer_count   NUMBER := 20000;
v_product_count    NUMBER := 2000;
v_order_count      NUMBER := 200000;
v_max_items        NUMBER := 5;
```

Rough guide:

| Scale  | Customers | Orders    | Order items (approx) |
|--------|-----------|-----------|-----------------------|
| Small  | 1,000     | 5,000     | ~15,000               |
| Medium | 20,000    | 200,000   | ~600,000              |
| Large  | 100,000   | 2,000,000 | ~6,000,000            |

ORDER_ITEMS will always be the biggest table (each order has 1 to
`v_max_items` lines), which is realistic and gives a natural table
for join/index performance demos.

If you want to regenerate at a different scale, run `05_drop_all.sql`
first, then start again from `01_create_schema.sql`.
