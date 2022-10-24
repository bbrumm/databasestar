/*
Oracle - Sequence
*/

CREATE SEQUENCE prod_sequence;

INSERT INTO product (product_id, product_name, price)
VALUES (prod_sequence.nextval, 'Desk chair', 50);

INSERT ALL
INTO product(product_id, product_name, price) VALUES (prod_sequence.nextval, 'Couch', 200)
INTO product(product_id, product_name, price) VALUES (prod_sequence.nextval, 'Chair', 150)
INTO product(product_id, product_name, price) VALUES (prod_sequence.nextval, 'Dining table', 400)
SELECT * FROM dual;