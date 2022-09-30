/*
Sample data for the SQL IN and SQL NOT IN post
*/

CREATE TABLE food (
    id INT,
    product_name VARCHAR(50),
    price INT
);

INSERT INTO food (id, product_name, price) VALUES (1, 'Apple', 2);
INSERT INTO food (id, product_name, price) VALUES (2, 'Chocolate', 3);
INSERT INTO food (id, product_name, price) VALUES (3, 'Pie', 12);
INSERT INTO food (id, product_name, price) VALUES (4, 'Bread', 5);
INSERT INTO food (id, product_name, price) VALUES (5, 'Banana', 1);
INSERT INTO food (id, product_name, price) VALUES (6, 'Pear', 2);

CREATE TABLE bakery (
    food_name VARCHAR(50)
);

INSERT INTO bakery (food_name) VALUES ('Bread');
INSERT INTO bakery (food_name) VALUES ('Cake');
INSERT INTO bakery (food_name) VALUES ('Pie');
INSERT INTO bakery (food_name) VALUES ('Cookie');



SELECT id, product_name, price
FROM food
WHERE product_name IN (
    SELECT food_name
    FROM bakery
);

SELECT id, product_name, price
FROM food
WHERE product_name NOT IN (
    SELECT food_name
    FROM bakery
);


SELECT id, product_name, price
FROM food
WHERE product_name NOT IN (
SELECT food_name
FROM bakery
WHERE food_name IS NOT NULL
);

