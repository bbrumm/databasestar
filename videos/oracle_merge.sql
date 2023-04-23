
DROP TABLE product_merge;
DROP TABLE new_product_merge;

CREATE TABLE product_merge (
    product_id NUMBER(10),
    product_name VARCHAR2(100),
    price NUMBER(8,2),
    qty_on_hand NUMBER(10),
    supplier_id NUMBER(10)
);


CREATE TABLE new_product_merge (
    product_name VARCHAR2(100),
    qty NUMBER(10)
);



INSERT INTO new_product_merge (product_name, qty) VALUES ('Pot Plant', 4);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Sink Taps', 12);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Toolbox', 3);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Large Washers', 57);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Drill', 14);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Saw Blades', 8);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Small Hammer', 21);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Glue 200ml', 43);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Hammer Large', 10);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Nails 10pk', 30);
INSERT INTO new_product_merge (product_name, qty) VALUES ('Small Screws', 15);


INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (1, 'Large Hammer', 49.95, 12, 2);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (2, 'Small Hammer', 17.50, 28, 3);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (3, 'Wheelbarrow', 70, 6, 1);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (4, 'Regular Spanner', 13.95, 18, 1);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (5, 'Saw', 8.70, 31, 2);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (6, 'Drill', 25.00, 19, 3);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (7, 'Pot Plant', 19.95, 2, 4);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (8, 'Small Screws', 3.20, 65, 6);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (9, 'Long Nails', 4.35, 40, 6);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (10, 'Large Screws', 8.10, 38, 4);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (11, 'Medium Nails', 4.00, 93, 5);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (12, 'Small Nails', 2.50, 71, 4);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (13, 'Shelf Set', 120, 8, 2);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (14, 'Toolbox', 45.95, 21, 1);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (15, 'Wood Plank 2m', 21.45, 9, 2);
INSERT INTO product_merge (product_id, product_name, price, qty_on_hand, supplier_id) VALUES (16, 'Fertiliser Large', 68.90, 16, 3);


SELECT *
FROM product_merge;

SELECT *
FROM new_product_merge;

MERGE INTO product_merge p
    USING new_product_merge n
    ON (p.product_name = n.product_name)
WHEN MATCHED THEN
    UPDATE SET p.qty_on_hand = p.qty_on_hand + n.qty
WHEN NOT MATCHED THEN
    INSERT (product_id, product_name, price, qty_on_hand, supplier_id)
    VALUES (NULL, n.product_name, NULL, n.qty, 9);

SELECT *
FROM product_merge;

