/*
Lesson 14
*/

SELECT product_name, price
FROM product
WHERE price > 80;

SELECT product_name, price
FROM product
WHERE price > 80
AND price < 120;

SELECT product_name, price
FROM product
WHERE price > 80
AND product_name != 'Shirt';


SELECT product_name, price
FROM product
WHERE price = 80
OR product_name = 'Shirt';

/*
Insert more rows
*/

INSERT INTO product (product_name, price)
VALUES ('Running shoes', 120);
INSERT INTO product (product_name, price)
VALUES ('Kids shoes', 40);
INSERT INTO product (product_name, price)
VALUES ('Black jumper', 45);
INSERT INTO product (product_name, price)
VALUES ('Red jumper', 45);
INSERT INTO product (product_name, price)
VALUES ('Dark blue jeans', 130);
INSERT INTO product (product_name, price)
VALUES ('Light blue jeans', 125);
INSERT INTO product (product_name, price)
VALUES ('Wide-brim hat', 15);
INSERT INTO product (product_name, price)
VALUES ('Long socks 2pk', 8);
INSERT INTO product (product_name, price)
VALUES ('Ankle socks 2pk', 5);
INSERT INTO product (product_name, price)
VALUES ('Ankle socks 5pk', 10);
INSERT INTO product (product_name, price)
VALUES ('Skirt, grey', 65);
INSERT INTO product (product_name, price)
VALUES ('Skirt, blue', 65);
INSERT INTO product (product_name, price)
VALUES ('Running shoes red', 145);
INSERT INTO product (product_name, price)
VALUES ('T-shirt black', 20);
INSERT INTO product (product_name, price)
VALUES ('T-shirt white', 20);
INSERT INTO product (product_name, price)
VALUES ('Long dress', 90);
INSERT INTO product (product_name, price)
VALUES ('Jacket', 150);
INSERT INTO product (product_name, price)
VALUES ('Trenchcoat', 180);
INSERT INTO product (product_name, price)
VALUES ('Leather jacket', 280);
INSERT INTO product (product_name, price)
VALUES ('Boots', 260);
INSERT INTO product (product_name, price)
VALUES ('Brown boots', 160);


SELECT product_name, price
FROM product
WHERE price = 80
OR product_name = 'Shirt'
OR price = 100;

SELECT product_name, price
FROM product
WHERE (price = 80
AND product_name = 'Shirt')
OR price = 100;

SELECT product_name, price
FROM product
WHERE price = 80
AND (product_name = 'Shirt'
OR price = 100);

SELECT product_name, price
FROM product
WHERE price = 80
OR price = 90
OR price = 100;


SELECT product_name, price
FROM product
WHERE price IN (80, 90, 100);