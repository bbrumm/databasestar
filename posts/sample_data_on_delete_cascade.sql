/*
Sample data for the On Delete Cascade post
*/

/*
Create and populate tables
*/

CREATE TABLE category (
    id INT,
    category_name VARCHAR(50),
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE product (
    id INT,
    category_id INT,
    product_name VARCHAR(50),
    CONSTRAINT pk_product PRIMARY KEY (id),
    CONSTRAINT fk_prod_category
      FOREIGN KEY (category_id) REFERENCES category(id)
);

INSERT INTO category (id, category_name) VALUES
(1, 'Electronics'),
(2, 'Furniture');

INSERT INTO product (id, category_id, product_name) VALUES
(1, 2, 'Desk Chair'),
(2, 2, 'Couch'),
(3, 1, 'TV'),
(4, 1, 'Coffee Machine');

/*
Delete parent row
*/

DELETE FROM category WHERE id = 1;

/*
You should see an error like this (MySQL error shown):
Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`my_new_db`.`product`, CONSTRAINT `fk_prod_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`))
*/

/*
Drop and recreate tables with ON DELETE CASCADE
*/

DROP TABLE product;
DROP TABLE category;

CREATE TABLE category (
    id INT,
    category_name VARCHAR(50),
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE product (
    id INT,
    category_id INT,
    product_name VARCHAR(50),
    CONSTRAINT pk_product PRIMARY KEY (id),
    CONSTRAINT fk_prod_category 
      FOREIGN KEY (category_id) REFERENCES category(id)
      ON DELETE CASCADE
);

INSERT INTO category (id, category_name) VALUES
(1, 'Electronics'),
(2, 'Furniture');

INSERT INTO product (id, category_id, product_name) VALUES
(1, 2, 'Desk Chair'),
(2, 2, 'Couch'),
(3, 1, 'TV'),
(4, 1, 'Coffee Machine');


/*
Delete parent row
*/

DELETE FROM category WHERE id = 1;

/*
Select from the tables
*/

SELECT id, category_name
FROM category;

SELECT id, category_id, product_name
FROM product;
