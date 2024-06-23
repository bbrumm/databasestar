/*
eCommerce Database Sample Data

This was created for MySQL, but will work for other databases with some minor changes.

You'll first need to create a new database on MySQL to store these tables.
*/

/*
Drop tables so we can rerun the script
*/
DROP TABLE IF EXISTS review_rating_type;
DROP TABLE IF EXISTS rating_type;
DROP TABLE IF EXISTS product_variation;
DROP TABLE IF EXISTS size_option;
DROP TABLE IF EXISTS size_category;
DROP TABLE IF EXISTS product_review;
DROP TABLE IF EXISTS product_item;
DROP TABLE IF EXISTS product_image;
DROP TABLE IF EXISTS product_attribute;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS colour;
DROP TABLE IF EXISTS brand;
DROP TABLE IF EXISTS attribute_option;
DROP TABLE IF EXISTS attribute_type;


/*
Attribute Type
*/

CREATE TABLE attribute_type (
  attribute_type_id int NOT NULL,
  attribute_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (attribute_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO attribute_type VALUES (1,'Sale/New Season'),(2,'Length'),(3,'Body Fit'),(4,'Colour'),(5,'Style'),(6,'Sleeve Length'),(7,'Neckline');

/*
Attribute Option
*/

CREATE TABLE attribute_option (
  attribute_option_id int NOT NULL,
  attribute_type_id int DEFAULT NULL,
  attribute_option_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (attribute_option_id),
  KEY fk_atop_attype (attribute_type_id),
  CONSTRAINT fk_atop_attype FOREIGN KEY (attribute_type_id) REFERENCES attribute_type (attribute_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO attribute_option VALUES (1,1,'New Season'),(2,1,'Sale'),(3,2,'Maxi'),(4,2,'Midi'),(5,2,'Mini'),(6,2,'Over the Knee'),(7,3,'Main Collection'),(8,3,'Plus Size'),(9,3,'Petite'),(10,7,'V Neck'),(11,7,'Crew Neck');


/*
Brand
*/


CREATE TABLE brand (
  brand_id int NOT NULL,
  brand_name varchar(200) DEFAULT NULL,
  brand_description varchar(2000) DEFAULT NULL,
  PRIMARY KEY (brand_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO brand VALUES
(1,'Jack & Jones','Founded in the 90s as a jeanswear brand, Danish label Jack & Jones has since gone on to expand its sartorial offering to include everything from jumpers, jackets and T-shirts to shoes, underwear and accessories (alongside more of its flex-worthy denim, of course). Scroll the Jack & Jones at ASOS edit to check out our latest drop of the brand’s laid-back pieces.'),
(2,'ASOS DESIGN','This is ASOS DESIGN – your go-to for all the latest trends, no matter who you are, where you’re from and what you’re up to. Exclusive to ASOS, our universal brand is here for you, and comes in Plus and Tall. Created by us, styled by you.');

/*
Colour
*/

CREATE TABLE colour (
  colour_id int NOT NULL,
  colour_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (colour_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO colour VALUES (1,'Navy Blazer'),(2,'Black'),(3,'Rosin'),(4,'Brown'),(5,'Burgundy');

/*
Product Category
*/

CREATE TABLE product_category (
  product_category_id int NOT NULL,
  category_name varchar(100) DEFAULT NULL,
  category_image varchar(400) DEFAULT NULL,
  category_description varchar(2000) DEFAULT NULL,
  parent_product_category_id int DEFAULT NULL,
  PRIMARY KEY (product_category_id),
  KEY fk_prodcat_parent (parent_product_category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_category VALUES 
(1,'Dresses','/images/dresses_women.png',NULL,14),
(2,'Coats + Jackets','/images/coats_women.png',NULL,14),
(3,'Shoes + Sneaks','/images/shoes_women.png','Shoes – we understand. At least when you''re looking up sale shoes from this edit, keeping up with the latest trends doesn''t mean breaking the bank. Discover wardrobe staples and seasonal designs in our sale shoes edit and put your best foot forward at work, the weekend, or in the gym. For summer-ready sale sandals, ASOS DESIGN has you covered with statement-making block heels, espadrilles and everyday sliders in memorable shades. Need a new pair of work shoes? We''ve got plenty of suitable options, including smart leather brogues and versatile flats with cut-outs and buckle detailing. Filter by adidas Originals for women''s sale trainers that''ll work for both workouts and weekends. Choose chunky designs in seasonal prints and standout finishes, or shop classic fitness performance trainers and elevate your workout. New boots? Turn to Truffle Collection for durable ankle boots in leather-look finishes and over-the-knee options in soft faux suede that''ll have you feeling fresh year-round. Whether you''re after flats, boots,or a pair of new heels, keep scrolling for discounted pieces in our women''s shoe sale.',14),
(4,'Sports Stuff','/images/sports_women.png',NULL,14),
(5,'Gifts','/images/gifts_women.png',NULL,14),
(6,'£ 10 and Under','/images/10_under_women.png',NULL,14),
(7,'Coats + Jackets','/images/coats_men.png','Layer up for less with key outerwear in our men''s sale. We''ve got all the essentials, from smart coats that''ll serve you well for work and formal events to sale jackets to add to your casualwear rotation. For new-season looks with affordable price tags, turn to our own ASOS DESIGN range. Pick out cool utility designs for those transitional times of year, plus bomber jackets in soft jersey materials. Wedding on the agenda? Find that dress-code-appropriate suit jacket in a fabric, colour and print to suit your individual style. When it comes to casual everyday outerwear, you can''t beat men''s sale coats from Brave Soul. Shop for hooded parkas and padded coats for colder days or find that staple lightweight raincoat in a versatile shade. Been holding out for a rocker jacket? Filter by Barney''s Originals for cool men''s leather jacket sale options in smooth real leather, suedette and faux finishes. You''ll find classic black styles as well as those featuring coloured panels and snug borg collars. Nab your ideal top layers with options from all the top menswear brands in our men''s coat sale edit.',13),
(8,'Suits','/images/suits_men.png',NULL,13),
(9,'Shirts','/images/shirts_men.png',NULL,13),
(10,'Shoes + Sneaks','/images/shoes_men.png',NULL,13),
(11,'£ 10 and Under','/images/10_under_men.png',NULL,13),
(12,'Gifts','/images/gifts_man.png',NULL,13),
(13,'Men','/images/men.png',NULL,NULL),
(14,'Women','/images/women.png',NULL,NULL);

ALTER TABLE  product_category
ADD CONSTRAINT fk_prodcat_parent FOREIGN KEY (parent_product_category_id) REFERENCES product_category (product_category_id);

/*
Product
*/

CREATE TABLE product (
  product_id int NOT NULL,
  product_name varchar(500) DEFAULT NULL,
  product_category_id int DEFAULT NULL,
  product_description varchar(1000) DEFAULT NULL,
  brand_id int DEFAULT NULL,
  model_height varchar(50) DEFAULT NULL,
  model_wearing varchar(50) DEFAULT NULL,
  care_instructions varchar(200) DEFAULT NULL,
  about varchar(200) DEFAULT NULL,
  PRIMARY KEY (product_id),
  KEY fk_prod_prodcategory (product_category_id),
  KEY fk_prod_brand (brand_id),
  CONSTRAINT fk_prod_brand FOREIGN KEY (brand_id) REFERENCES brand (brand_id),
  CONSTRAINT fk_prod_prodcategory FOREIGN KEY (product_category_id) REFERENCES product_category (product_category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO product VALUES 
(1,'Jack & Jones parka with faux fur hood in navy',7,'Your go-to for cooler climes. Fixed hood. Faux-fur trim. Zip and press-stud fastening. Functional pockets. Regular fit',1,'183cm / 6 ft 0 in','Medium','Machine wash according to instructions on care label','Plain-woven fabric. Main: 100% Polyester.'),
(2,'ASOS DESIGN oversized wool mix overcoat in brown',7,'It''s the outerwear for us. Peak lapels. Button placket. Centre vent. Oversized fit',2,'185cm / 6 ft 1 in','Medium','Dry clean only','Wool-mix fabric. Lining: 100% Polyester, Main: 51% Polyester, 16% Wool, 13% Acrylic, 10% Viscose, 7% Polyamide, 3% Cotton.'),
(3,'ASOS DESIGN puffer gilet in brown',7,'Low-key layering. Funnel neck. Zip fastening. Side pockets. Regular fit',2,'185cm / 6 ft 1 in','Medium','Machine wash according to instructions on care label','Smooth woven fabric: padded for warmth. Lining: 100% Polyester, Shell: 100% Polyester, Wadding: 100% Polyester.'),
(4,'ASOS DESIGN lightweight bomber jacket in burgundy',7,'Stand out, stay warm. Notch collar. Button placket. Tie waist. Side pockets. Oversized fit',2,'185cm / 6 ft 1 in','Medium',NULL,'Twill: semi-structured fabric with a parallel-rib pattern. Lining: 100% Polyester, Main: 65% Polyester, 35% Cotton.');

/*
Product Attribute
*/

CREATE TABLE product_attribute (
  product_id int DEFAULT NULL,
  attribute_option_id int DEFAULT NULL,
  KEY fk_prodat_prod (product_id),
  KEY fk_prodat_prod_atop (attribute_option_id),
  CONSTRAINT fk_prodat_prod FOREIGN KEY (product_id) REFERENCES product (product_id),
  CONSTRAINT fk_prodat_prod_atop FOREIGN KEY (attribute_option_id) REFERENCES attribute_option (attribute_option_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_attribute VALUES (1,2),(1,5),(1,10),(2,2),(2,4),(2,11);

/*
Product Image
*/

CREATE TABLE product_image (
  image_id int NOT NULL,
  product_id int DEFAULT NULL,
  image_filename varchar(400) DEFAULT NULL,
  product_item_id int DEFAULT NULL,
  PRIMARY KEY (image_id),
  KEY fk_prodimage_product (product_id),
  CONSTRAINT fk_prodimage_product FOREIGN KEY (product_id) REFERENCES product (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_image VALUES (1,2,'image004.png',2),(2,2,'image009.png',2),(3,1,'image013.png',1),(4,1,'image020.png',1),(5,4,'image006.png',4),(6,4,'image001.png',4),(7,3,'image019.png',3),(8,3,'image042.png',3);


/*
Product Item
*/

CREATE TABLE product_item (
  product_item_id int NOT NULL,
  product_id int DEFAULT NULL,
  colour_id int DEFAULT NULL,
  original_price int DEFAULT NULL,
  sale_price int DEFAULT NULL,
  product_code varchar(20) DEFAULT NULL,
  PRIMARY KEY (product_item_id),
  KEY fk_proditem_product (product_id),
  KEY fk_proditem_colour (colour_id),
  CONSTRAINT fk_proditem_colour FOREIGN KEY (colour_id) REFERENCES colour (colour_id),
  CONSTRAINT fk_proditem_product FOREIGN KEY (product_id) REFERENCES product (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_item VALUES (1,1,1,6500,3900,'129299186'),(2,1,2,6500,3900,'129299185'),(3,1,3,6500,3600,'129299187'),(4,2,4,7500,4500,'128900088'),(5,3,4,3200,1450,'128825389'),(6,4,5,2800,1500,'122554464');

/*
Product Review
*/

CREATE TABLE product_review (
  review_id int NOT NULL,
  product_id int DEFAULT NULL,
  review_title varchar(100) DEFAULT NULL,
  review_rating int DEFAULT NULL,
  review_comment varchar(500) DEFAULT NULL,
  review_date date DEFAULT NULL,
  PRIMARY KEY (review_id),
  KEY fk_prodreview_product (product_id),
  CONSTRAINT fk_prodreview_product FOREIGN KEY (product_id) REFERENCES product (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_review VALUES (1,1,'Great',5,'I bought this coat for my partner. He was very happy with his coat. The size was good also. True to size. I would definitely recommend this Parker','2024-01-04'),(2,1,'Great jacket!',5,'I am very satisfied with the quality and the price','2023-12-29'),(3,1,'Nice!',5,'Nice and warm, comfy, good size, husband happy with it.','2023-12-05');

/*
Size Category
*/

CREATE TABLE size_category (
  category_id int DEFAULT NULL,
  category_name varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO size_category VALUES (1,'Men Clothing'),(2,'Men Shoes');

/*
Size Option
*/

CREATE TABLE size_option (
  size_id int NOT NULL,
  size_name varchar(100) DEFAULT NULL,
  sort_order int DEFAULT NULL,
  size_category_id int DEFAULT NULL,
  PRIMARY KEY (size_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO size_option VALUES (1,'XS - Chest 92cm',1,NULL),(2,'S - Chest 96cm',2,NULL),(3,'M - Chest 100cm',3,NULL),(4,'L - Chest 104cm',4,NULL),(5,'XL - Chest 112cm',5,NULL),(6,'XXL - Chest 120cm',6,NULL),(7,'3XL',7,NULL);

/*
Product Variation
*/

CREATE TABLE product_variation (
  variation_id int NOT NULL,
  product_item_id int DEFAULT NULL,
  size_id int DEFAULT NULL,
  qty_in_stock int DEFAULT NULL,
  PRIMARY KEY (variation_id),
  KEY fk_prodvar_proditem (product_item_id),
  KEY fk_prodvar_size (size_id),
  CONSTRAINT fk_prodvar_proditem FOREIGN KEY (product_item_id) REFERENCES product_item (product_item_id),
  CONSTRAINT fk_prodvar_size FOREIGN KEY (size_id) REFERENCES size_option (size_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_variation VALUES (1,1,7,4),(2,2,7,7),(3,3,7,0),(4,4,NULL,NULL),(5,5,NULL,NULL),(6,6,NULL,NULL),(7,1,1,15),(8,1,2,8),(9,1,3,10),(10,1,4,35),(11,1,5,41),(12,1,6,0),(13,2,1,4),(14,2,2,19),(15,2,3,0),(16,2,4,0),(17,2,5,5),(18,2,6,24),(19,3,1,3),(20,3,2,9),(21,3,3,0),(22,3,4,42),(23,3,5,18),(24,3,6,62);

/*
Rating Type
*/


CREATE TABLE rating_type (
  rating_type_id int NOT NULL,
  rating_name varchar(20) DEFAULT NULL,
  label_min varchar(20) DEFAULT NULL,
  label_max varchar(20) DEFAULT NULL,
  PRIMARY KEY (rating_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO rating_type VALUES (1,'Fit','Runs Small','Runs Large'),(2,'Quality','Poor','Great');

/*
Review Rating Type
*/

CREATE TABLE review_rating_type (
  review_id int DEFAULT NULL,
  rating_type_id int DEFAULT NULL,
  rating_value int DEFAULT NULL,
  KEY fk_rrt_review (review_id),
  KEY fk_rrt_ratingtype (rating_type_id),
  CONSTRAINT fk_rrt_ratingtype FOREIGN KEY (rating_type_id) REFERENCES rating_type (rating_type_id),
  CONSTRAINT fk_rrt_review FOREIGN KEY (review_id) REFERENCES product_review (review_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO review_rating_type VALUES (1,1,5),(2,1,6),(3,1,7),(1,2,10),(2,2,10),(3,2,10);


