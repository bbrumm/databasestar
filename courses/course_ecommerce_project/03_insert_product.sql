/*
Product Data Insert

Inserts data into a few product-related tables
*/

DELETE FROM product_attribute;
DELETE FROM attribute_option;
DELETE FROM attribute;
DELETE FROM value_type;
DELETE FROM product_category;
DELETE FROM product_item;
DELETE FROM product;
DELETE FROM category;


INSERT INTO category (id, name, parent_id) VALUES
-- Level 1: Top-level categories
(1, 'Electronics', NULL),
(2, 'Clothing', NULL),
(3, 'Home & Kitchen', NULL),
(4, 'Sports & Outdoors', NULL),
(5, 'Books', NULL),
(6, 'Beauty & Personal Care', NULL),
(7, 'Toys & Games', NULL),
(8, 'Automotive', NULL),
(9, 'Grocery & Food', NULL),

-- Level 2: Electronics subcategories
(10, 'Computers & Tablets', 1),
(11, 'Mobile Phones', 1),
(12, 'TV & Video', 1),
(13, 'Audio Equipment', 1),
(14, 'Cameras & Photography', 1),

-- Level 3: Electronics deeper subcategories
(15, 'Laptops', 10),
(16, 'Desktops', 10),
(17, 'Computer Accessories', 10),
(18, 'Smartphones', 11),
(19, 'Phone Accessories', 11),
(20, 'Headphones', 13),
(21, 'Speakers', 13),
(22, 'DSLR Cameras', 14),
(23, 'Action Cameras', 14),

-- Level 2: Clothing subcategories
(24, 'Men''s Clothing', 2),
(25, 'Women''s Clothing', 2),
(26, 'Kids'' Clothing', 2),

-- Level 3: Clothing deeper subcategories
(27, 'T-Shirts', 24),
(28, 'Jeans', 24),
(29, 'Dresses', 25),
(30, 'Activewear', 25),
(31, 'Baby Clothes', 26),

-- Level 2: Home & Kitchen subcategories
(32, 'Furniture', 3),
(33, 'Appliances', 3),
(34, 'Home Decor', 3),
(35, 'Kitchen & Dining', 3),

-- Level 3: Home & Kitchen deeper subcategories
(36, 'Sofas', 32),
(37, 'Beds', 32),
(38, 'Cookware', 35),
(39, 'Tableware', 35),

-- Level 2: Sports & Outdoors subcategories
(40, 'Fitness Equipment', 4),
(41, 'Outdoor Gear', 4),
(42, 'Cycling', 4),

-- Level 3: Sports & Outdoors deeper subcategories
(43, 'Treadmills', 40),
(44, 'Camping Tents', 41),
(45, 'Bicycles', 42);


INSERT INTO product (id, name, description, is_active, created_at, updated_at) VALUES
(1, 'Apple MacBook Air 13-inch (M2)', 'Lightweight laptop featuring Apple M2 chip, 8-core CPU, and 18-hour battery life. Perfect for productivity and portability.', true, '2023-02-05 10:15:22', '2024-11-01 14:40:10'),
(2, 'Dell XPS 15 Laptop', 'Premium Windows laptop with Intel Core i7, 16GB RAM, and a vibrant 15-inch InfinityEdge display.', true, '2023-03-12 08:33:10', '2024-10-12 10:05:21'),
(3, 'Samsung Galaxy S23', 'Flagship Android smartphone with stunning display, pro-grade camera, and long battery life.', true, '2023-04-18 11:50:55', '2024-09-28 09:30:12'),
(4, 'Sony WH-1000XM5 Wireless Headphones', 'Noise-cancelling over-ear headphones with 30-hour battery life and industry-leading sound quality.', true, '2023-05-25 15:03:33', '2025-01-10 13:50:00'),
(5, 'Canon EOS R8 Mirrorless Camera', 'Full-frame mirrorless camera for photography enthusiasts with fast autofocus and 4K video.', true, '2023-06-09 09:12:00', '2024-06-10 08:50:10'),
(6, 'Apple iPad Pro 11-inch', 'Powerful tablet with M2 chip and Liquid Retina display — ideal for drawing, note-taking, and multitasking.', true, '2023-07-01 13:22:19', '2024-07-01 13:22:19'),
(7, 'Logitech MX Master 3S Mouse', 'Ergonomic wireless mouse with fast scrolling, quiet clicks, and customizable buttons for productivity.', true, '2023-07-15 09:44:44', '2024-09-11 11:33:20'),
(8, 'Amazon Echo Dot (5th Gen)', 'Compact smart speaker with Alexa for hands-free control, music, and home automation.', true, '2023-08-08 10:00:00', '2024-08-08 10:00:00'),
(9, 'Apple Watch Series 9', 'Advanced smartwatch with heart rate, fitness tracking, and Siri integration.', true, '2023-09-22 08:55:11', '2025-01-25 14:12:45'),
(10, 'HP Envy 6055e Printer', 'All-in-one inkjet printer ideal for home and small office use with wireless printing.', true, '2023-10-05 14:40:02', '2024-10-05 14:40:02'),

(11, 'Men''s Cotton Crew Neck T-Shirt', 'Classic short-sleeve cotton T-shirt made from soft, breathable fabric. Available in multiple colors.', true, '2023-02-10 12:00:00', '2024-07-20 09:40:00'),
(12, 'Levi''s 511 Slim Fit Jeans', 'Iconic slim-fit jeans made from durable stretch denim for all-day comfort.', true, '2023-04-18 10:45:00', '2024-08-10 12:00:00'),
(13, 'Women''s Activewear Leggings', 'High-waisted stretch leggings designed for yoga, running, and everyday comfort.', true, '2023-05-22 09:00:00', '2024-05-22 09:00:00'),
(14, 'Nike Air Zoom Pegasus 40', 'Lightweight running shoes with responsive cushioning for daily training.', true, '2023-06-01 10:15:00', '2024-10-10 10:00:00'),
(15, 'Adidas Ultraboost 23', 'Performance running shoes with Boost cushioning and knit upper for superior comfort.', true, '2023-06-10 11:22:33', '2024-06-15 11:22:33'),
(16, 'Women''s Floral Summer Dress', 'Lightweight sleeveless dress made from breathable fabric, perfect for warm weather.', true, '2023-07-15 08:10:00', '2024-07-15 08:10:00'),
(17, 'Men''s Waterproof Jacket', 'Versatile outdoor jacket with waterproof membrane and breathable mesh lining.', true, '2023-09-01 09:45:00', '2024-09-01 09:45:00'),
(18, 'Children''s Cotton Pajama Set', 'Two-piece soft cotton pajama set with fun printed patterns.', true, '2023-09-20 12:00:00', '2024-09-20 12:00:00'),
(19, 'Women''s Wool Coat', 'Elegant long coat crafted from premium wool blend with button closure.', true, '2023-11-10 10:30:00', '2024-12-20 14:00:00'),
(20, 'Men''s Leather Belt', 'Genuine leather belt with classic silver buckle — ideal for formal or casual wear.', true, '2023-12-05 08:22:00', '2024-12-05 08:22:00'),

(21, 'IKEA Hemnes Sofa', 'Three-seater wooden sofa with washable fabric cushions and modern Scandinavian design.', true, '2023-03-05 09:11:00', '2024-06-05 09:11:00'),
(22, 'Dyson V15 Detect Vacuum Cleaner', 'Cordless vacuum cleaner with laser detection for hidden dust and intelligent suction control.', true, '2023-04-01 13:33:00', '2024-09-01 13:33:00'),
(23, 'KitchenAid Stand Mixer', 'Professional-grade stand mixer with stainless steel bowl and 10-speed settings.', true, '2023-05-02 08:00:00', '2024-05-02 08:00:00'),
(24, 'Nespresso Vertuo Coffee Maker', 'Automatic coffee and espresso machine with capsule brewing and milk frother.', true, '2023-06-11 10:00:00', '2024-06-11 10:00:00'),
(25, 'Philips Air Fryer XXL', 'Large-capacity air fryer that cooks crispy food with minimal oil using Rapid Air technology.', true, '2023-07-01 09:00:00', '2024-07-01 09:00:00'),
(26, 'Instant Pot Duo 7-in-1', 'Multi-use pressure cooker, slow cooker, and rice cooker in one compact appliance.', true, '2023-08-14 10:20:00', '2024-08-14 10:20:00'),
(27, 'Cuisinart 12-Piece Cookware Set', 'Stainless steel pots and pans with tempered glass lids — dishwasher safe.', true, '2023-09-02 09:45:00', '2024-09-02 09:45:00'),
(28, 'SONGMICS Standing Desk', 'Adjustable height sit-stand desk with smooth motor lift system for ergonomic work.', true, '2023-10-20 10:50:00', '2024-10-20 10:50:00'),
(29, 'Oxo 10-Piece Storage Container Set', 'Airtight plastic containers perfect for organizing kitchen staples and snacks.', true, '2023-11-10 11:20:00', '2024-11-10 11:20:00'),
(30, 'Smeg Retro Toaster', 'Two-slice toaster with vintage 1950s design and six browning levels.', true, '2024-01-05 08:30:00', '2024-09-01 09:00:00'),

(31, 'Wilson Evolution Basketball', 'Official-size indoor basketball with microfiber composite leather cover.', true, '2023-03-11 11:00:00', '2024-03-11 11:00:00'),
(32, 'Callaway Golf Set', 'Complete golf club set including driver, irons, and putter with premium carry bag.', true, '2023-04-20 09:00:00', '2024-08-10 10:00:00'),
(33, 'Fitbit Charge 6 Fitness Tracker', 'Advanced fitness tracker with heart rate monitoring, sleep tracking, and GPS.', true, '2023-06-02 08:00:00', '2024-09-12 08:00:00'),
(34, 'Coleman Skydome Camping Tent', 'Six-person camping tent with weatherproof construction and easy setup.', true, '2023-07-14 08:30:00', '2024-08-14 08:30:00'),
(35, 'Raleigh Mountain Bike', 'Durable 21-speed mountain bike suitable for trails and off-road rides.', true, '2023-08-21 09:00:00', '2024-09-21 09:00:00'),
(36, 'Adidas Gym Bag', 'Spacious sports duffel bag with multiple compartments and shoulder strap.', true, '2023-09-10 10:30:00', '2024-09-10 10:30:00'),
(37, 'Garmin Forerunner 265', 'GPS running watch with training readiness and accurate pace tracking.', true, '2023-10-15 09:00:00', '2025-01-10 09:00:00'),
(38, 'Reebok Yoga Mat', 'Non-slip, high-density mat for yoga and floor exercises.', true, '2023-11-08 08:00:00', '2024-11-08 08:00:00'),
(39, 'North Face Hiking Backpack', '35L capacity backpack with water-resistant material and airflow padding.', true, '2024-01-15 10:10:00', '2024-10-01 09:00:00'),
(40, 'Everlast Adjustable Dumbbells', 'Set of adjustable dumbbells ranging from 5 to 52 lbs, ideal for home workouts.', true, '2024-02-10 10:45:00', '2024-10-20 10:45:00'),

(41, 'The Pragmatic Programmer', 'Classic programming book with tips on writing better, maintainable software.', true, '2023-03-03 09:30:00', '2024-09-03 09:30:00'),
(42, 'Atomic Habits', 'Bestselling self-improvement book by James Clear on building better habits.', true, '2023-04-01 10:00:00', '2024-04-01 10:00:00'),
(43, 'Harry Potter and the Philosopher''s Stone', 'First book in the Harry Potter series by J.K. Rowling.', true, '2023-05-10 12:00:00', '2024-09-01 12:00:00'),
(44, 'Clean Code', 'Essential software engineering book on writing clean, readable, and maintainable code.', true, '2023-06-02 11:00:00', '2024-09-15 11:00:00'),
(45, 'Project Hail Mary', 'Science fiction novel by Andy Weir, author of The Martian.', true, '2023-07-01 10:00:00', '2024-07-01 10:00:00'),
(46, 'CeraVe Hydrating Facial Cleanser', 'Gentle, non-foaming cleanser with ceramides and hyaluronic acid.', true, '2023-08-01 10:00:00', '2024-08-01 10:00:00'),
(47, 'L''Oreal Paris Elvive Shampoo', 'Nourishing shampoo that restores shine and strength to damaged hair.', true, '2023-09-10 10:00:00', '2024-09-10 10:00:00'),
(48, 'Maybelline Fit Me Foundation', 'Matte and poreless foundation available in multiple shades.', true, '2023-10-05 09:00:00', '2024-10-05 09:00:00'),
(49, 'LEGO Classic Creative Bricks Set', '500-piece LEGO building set that encourages creativity and imagination.', true, '2023-11-20 09:00:00', '2024-11-20 09:00:00'),
(50, 'Hot Wheels 20-Car Gift Pack', 'Collection of 20 die-cast cars perfect for young collectors and racers.', false, '2023-12-15 09:00:00', '2024-12-15 09:00:00');


INSERT INTO product_item (id, product_id, sku, price, stock_qty, is_active, created_at, updated_at) VALUES
-- Electronics
(1, 1, 'MBA13-M2-256GB', 1199.00, 25, true, '2023-02-05 10:15:22', '2024-11-01 14:40:10'),
(2, 1, 'MBA13-M2-512GB', 1399.00, 15, true, '2023-02-05 10:15:22', '2024-11-01 14:40:10'),
(3, 2, 'DELLXPS15-I7-512GB', 1799.00, 10, true, '2023-03-12 08:33:10', '2024-10-12 10:05:21'),
(4, 2, 'DELLXPS15-I9-1TB', 2199.00, 6, true, '2023-03-12 08:33:10', '2024-10-12 10:05:21'),
(5, 3, 'SGS23-128GB-BLK', 899.00, 50, true, '2023-04-18 11:50:55', '2024-09-28 09:30:12'),
(6, 3, 'SGS23-256GB-SLV', 999.00, 35, true, '2023-04-18 11:50:55', '2024-09-28 09:30:12'),
(7, 3, 'SGS23-512GB-GRN', 1099.00, 10, false, '2023-04-18 11:50:55', '2024-09-28 09:30:12'),
(8, 4, 'SONYWH1000XM5-BLK', 399.00, 80, true, '2023-05-25 15:03:33', '2025-01-10 13:50:00'),
(9, 4, 'SONYWH1000XM5-SLV', 399.00, 45, true, '2023-05-25 15:03:33', '2025-01-10 13:50:00'),
(10, 5, 'CANON-R8-KIT', 1499.00, 20, true, '2023-06-09 09:12:00', '2024-06-10 08:50:10'),
(11, 6, 'IPADPRO11-128GB', 899.00, 30, true, '2023-07-01 13:22:19', '2024-07-01 13:22:19'),
(12, 6, 'IPADPRO11-512GB', 1099.00, 15, true, '2023-07-01 13:22:19', '2024-07-01 13:22:19'),
(13, 7, 'LOGIMX3S-GRAPHITE', 99.00, 70, true, '2023-07-15 09:44:44', '2024-09-11 11:33:20'),
(14, 7, 'LOGIMX3S-PALEGRAY', 99.00, 60, true, '2023-07-15 09:44:44', '2024-09-11 11:33:20'),
(15, 8, 'ECHODOT5-BLK', 49.99, 120, true, '2023-08-08 10:00:00', '2024-08-08 10:00:00'),
(16, 8, 'ECHODOT5-WHT', 49.99, 95, true, '2023-08-08 10:00:00', '2024-08-08 10:00:00'),
(17, 9, 'APPLEWATCH9-41MM', 399.00, 35, true, '2023-09-22 08:55:11', '2025-01-25 14:12:45'),
(18, 9, 'APPLEWATCH9-45MM', 429.00, 25, true, '2023-09-22 08:55:11', '2025-01-25 14:12:45'),
(19, 10, 'HPENVY6055E', 159.00, 40, true, '2023-10-05 14:40:02', '2024-10-05 14:40:02'),

-- Clothing
(20, 11, 'MTEE-WHT-M', 19.99, 100, true, '2023-02-10 12:00:00', '2024-07-20 09:40:00'),
(21, 11, 'MTEE-BLK-L', 19.99, 120, true, '2023-02-10 12:00:00', '2024-07-20 09:40:00'),
(22, 12, 'LEVIS511-32', 69.99, 40, true, '2023-04-18 10:45:00', '2024-08-10 12:00:00'),
(23, 12, 'LEVIS511-34', 69.99, 35, true, '2023-04-18 10:45:00', '2024-08-10 12:00:00'),
(24, 13, 'WLEGGINGS-BLK-S', 39.99, 60, true, '2023-05-22 09:00:00', '2024-05-22 09:00:00'),
(25, 13, 'WLEGGINGS-GRY-M', 39.99, 45, true, '2023-05-22 09:00:00', '2024-05-22 09:00:00'),
(26, 14, 'NIKEPEG40-M8', 129.99, 30, true, '2023-06-01 10:15:00', '2024-10-10 10:00:00'),
(27, 14, 'NIKEPEG40-M9', 129.99, 25, true, '2023-06-01 10:15:00', '2024-10-10 10:00:00'),
(28, 15, 'ADIDASUB23-M8', 149.99, 28, true, '2023-06-10 11:22:33', '2024-06-15 11:22:33'),
(29, 15, 'ADIDASUB23-M9', 149.99, 32, true, '2023-06-10 11:22:33', '2024-06-15 11:22:33'),
(30, 16, 'WDRS-FLRL-S', 59.99, 25, true, '2023-07-15 08:10:00', '2024-07-15 08:10:00'),
(31, 16, 'WDRS-FLRL-M', 59.99, 20, true, '2023-07-15 08:10:00', '2024-07-15 08:10:00'),
(32, 17, 'MWJKT-NVY-M', 99.99, 18, true, '2023-09-01 09:45:00', '2024-09-01 09:45:00'),
(33, 18, 'KIDSPJS-RED-6Y', 24.99, 40, true, '2023-09-20 12:00:00', '2024-09-20 12:00:00'),
(34, 19, 'WCOAT-GRY-M', 179.99, 12, true, '2023-11-10 10:30:00', '2024-12-20 14:00:00'),
(35, 20, 'MBELT-BRN-34', 39.99, 25, true, '2023-12-05 08:22:00', '2024-12-05 08:22:00'),
(36, 20, 'MBELT-BLK-36', 39.99, 18, true, '2023-12-05 08:22:00', '2024-12-05 08:22:00'),

-- Home & Kitchen
(37, 21, 'HEMNES-SOFA-GRY', 499.00, 8, true, '2023-03-05 09:11:00', '2024-06-05 09:11:00'),
(38, 22, 'DYSONV15', 749.00, 20, true, '2023-04-01 13:33:00', '2024-09-01 13:33:00'),
(39, 23, 'KITCHENAID-STDMXR-RED', 399.00, 22, true, '2023-05-02 08:00:00', '2024-05-02 08:00:00'),
(40, 24, 'NESPRESSO-VERTUO', 249.00, 25, true, '2023-06-11 10:00:00', '2024-06-11 10:00:00'),
(41, 25, 'PHILIPS-AIRFRYER-XXL', 299.00, 18, true, '2023-07-01 09:00:00', '2024-07-01 09:00:00'),
(42, 26, 'INSTANTPOT-DUO7', 129.00, 35, true, '2023-08-14 10:20:00', '2024-08-14 10:20:00'),
(43, 27, 'CUISINART-COOKSET-12', 249.00, 14, true, '2023-09-02 09:45:00', '2024-09-02 09:45:00'),
(44, 28, 'SONGMICS-DESK-WHT', 299.00, 10, true, '2023-10-20 10:50:00', '2024-10-20 10:50:00'),
(45, 29, 'OXO-STORAGE10', 69.99, 60, true, '2023-11-10 11:20:00', '2024-11-10 11:20:00'),
(46, 30, 'SMEG-TOASTER-RED', 199.00, 22, true, '2024-01-05 08:30:00', '2024-09-01 09:00:00'),

-- Sports & Outdoors
(47, 31, 'WILSON-BBALL', 59.99, 35, true, '2023-03-11 11:00:00', '2024-03-11 11:00:00'),
(48, 32, 'CALLAWAY-GOLFSET', 999.00, 10, true, '2023-04-20 09:00:00', '2024-08-10 10:00:00'),
(49, 33, 'FITBIT-CHG6-BLK', 149.99, 45, true, '2023-06-02 08:00:00', '2024-09-12 08:00:00'),
(50, 34, 'COLEMAN-TENT-6P', 179.00, 25, true, '2023-07-14 08:30:00', '2024-08-14 08:30:00'),
(51, 35, 'RALEIGH-MTNBK-29', 599.00, 15, true, '2023-08-21 09:00:00', '2024-09-21 09:00:00'),
(52, 36, 'ADIDAS-GYMBAG', 39.99, 75, true, '2023-09-10 10:30:00', '2024-09-10 10:30:00'),
(53, 37, 'GARMIN-FR265-BLK', 449.00, 18, true, '2023-10-15 09:00:00', '2025-01-10 09:00:00'),
(54, 38, 'REEBOK-YOGAMAT', 34.99, 55, true, '2023-11-08 08:00:00', '2024-11-08 08:00:00'),
(55, 39, 'NFACE-BPACK35', 129.00, 28, true, '2024-01-15 10:10:00', '2024-10-01 09:00:00'),
(56, 40, 'EVERLAST-DBSET', 399.00, 12, true, '2024-02-10 10:45:00', '2024-10-20 10:45:00'),

-- Books
(57, 41, 'BOOK-PRAGMATIC', 42.00, 100, true, '2023-03-03 09:30:00', '2024-09-03 09:30:00'),
(58, 42, 'BOOK-ATOMICHABITS', 22.00, 80, true, '2023-04-01 10:00:00', '2024-04-01 10:00:00'),
(59, 43, 'BOOK-HP1', 14.99, 150, true, '2023-05-10 12:00:00', '2024-09-01 12:00:00'),
(60, 44, 'BOOK-CLEANCODE', 39.99, 60, true, '2023-06-02 11:00:00', '2024-09-15 11:00:00'),
(61, 45, 'BOOK-PROJECTHAILMARY', 18.99, 75, true, '2023-07-01 10:00:00', '2024-07-01 10:00:00'),

-- Beauty & Personal Care
(62, 46, 'CERAVE-CLEANSER-473ML', 14.99, 120, true, '2023-08-01 10:00:00', '2024-08-01 10:00:00'),
(63, 47, 'LOREAL-ELVIVE-400ML', 9.99, 150, true, '2023-09-10 10:00:00', '2024-09-10 10:00:00'),
(64, 48, 'MAYBELLINE-FITME-115', 13.49, 80, true, '2023-10-05 09:00:00', '2024-10-05 09:00:00'),
(65, 48, 'MAYBELLINE-FITME-220', 13.49, 65, true, '2023-10-05 09:00:00', '2024-10-05 09:00:00'),

-- Toys & Games
(66, 49, 'LEGO-CLASSIC-500PC', 39.99, 45, true, '2023-11-20 09:00:00', '2024-11-20 09:00:00'),
(67, 49, 'LEGO-CLASSIC-1000PC', 69.99, 25, true, '2023-11-20 09:00:00', '2024-11-20 09:00:00'),
(68, 50, 'HOTWHEELS-20PACK', 29.99, 60, false, '2023-12-15 09:00:00', '2024-12-15 09:00:00');


INSERT INTO product_category (product_id, category_id) VALUES
-- Electronics
(1, 15),  -- MacBook Air → Laptops
(2, 16),  -- Dell XPS 15 → Desktops
(3, 18),  -- Samsung Galaxy S23 → Smartphones
(4, 20),  -- Sony Headphones → Headphones
(5, 22),  -- Canon Camera → DSLR Cameras
(6, 15),  -- iPad Pro → Laptops (tablet crossover)
(7, 17),  -- Logitech Mouse → Computer Accessories
(8, 21),  -- Amazon Echo → Speakers
(9, 18),  -- Apple Watch → Smartphones (smart accessories)
(10, 17), -- HP Printer → Computer Accessories

-- Clothing
(11, 27), -- Men’s T-Shirt → T-Shirts
(12, 28), -- Levi’s Jeans → Jeans
(13, 30), -- Women’s Leggings → Activewear
(14, 30), -- Nike Pegasus → Activewear
(15, 30), -- Adidas Ultraboost → Activewear
(16, 29), -- Women’s Summer Dress → Dresses
(17, 28), -- Men’s Waterproof Jacket → Jeans (or upper wear, reused category)
(18, 31), -- Kids Pajamas → Baby Clothes
(19, 29), -- Women’s Wool Coat → Dresses (outerwear)
(20, 27), -- Men’s Leather Belt → T-Shirts (closest accessory subcat placeholder)

-- Home & Kitchen
(21, 36), -- IKEA Sofa → Sofas
(22, 33), -- Dyson Vacuum → Appliances
(23, 38), -- KitchenAid Mixer → Cookware
(24, 38), -- Nespresso → Cookware
(25, 38), -- Philips Air Fryer → Cookware
(26, 33), -- Instant Pot → Appliances
(27, 38), -- Cuisinart Cookware Set → Cookware
(28, 32), -- Standing Desk → Furniture
(29, 38), -- OXO Containers → Cookware (storage)
(30, 33), -- Smeg Toaster → Appliances

-- Sports & Outdoors
(31, 40), -- Basketball → Fitness Equipment
(32, 41), -- Golf Set → Outdoor Gear
(33, 40), -- Fitbit → Fitness Equipment
(34, 44), -- Camping Tent → Camping Tents
(35, 45), -- Mountain Bike → Bicycles
(36, 40), -- Gym Bag → Fitness Equipment
(37, 40), -- Garmin Watch → Fitness Equipment
(38, 40), -- Yoga Mat → Fitness Equipment
(39, 41), -- Hiking Backpack → Outdoor Gear
(40, 40), -- Dumbbells → Fitness Equipment

-- Books
(41, 5),  -- Pragmatic Programmer → Books
(42, 5),  -- Atomic Habits → Books
(43, 5),  -- Harry Potter → Books
(44, 5),  -- Clean Code → Books
(45, 5),  -- Project Hail Mary → Books

-- Beauty & Personal Care
(46, 6),  -- CeraVe Cleanser
(47, 6),  -- L’Oreal Shampoo
(48, 6),  -- Maybelline Foundation

-- Toys & Games
(49, 7),  -- LEGO Classic
(50, 7);  -- Hot Wheels


INSERT INTO value_type (id, type_name) VALUES
(1, 'text'),
(2, 'number'),
(3, 'date');

INSERT INTO attribute (id, name, value_type_id) VALUES
-- General Attributes
(1, 'Brand', 1),
(2, 'Model', 1),
(3, 'Color', 1),
(4, 'Material', 1),
(5, 'Weight (kg)', 2),
(6, 'Dimensions (cm)', 1),
(7, 'Release Date', 3),
(8, 'Warranty Period (months)', 2),
(9, 'Country of Origin', 1),
(10, 'Barcode (EAN/UPC)', 1),

-- Electronics
(11, 'Screen Size (inches)', 2),
(12, 'Storage Capacity (GB)', 2),
(13, 'RAM (GB)', 2),
(14, 'Battery Life (hours)', 2),
(15, 'Processor Type', 1),
(16, 'Operating System', 1),
(17, 'Camera Resolution (MP)', 2),
(18, 'Connectivity', 1),
(19, 'Power Consumption (W)', 2),
(20, 'Audio Output Type', 1),

-- Clothing & Apparel
(21, 'Size', 1),
(22, 'Fit Type', 1),
(23, 'Pattern', 1),
(24, 'Fabric Type', 1),
(25, 'Sleeve Length', 1),
(26, 'Neck Style', 1),
(27, 'Care Instructions', 1),
(28, 'Shoe Size (EU)', 2),
(29, 'Gender', 1),
(30, 'Season', 1),

-- Home & Kitchen
(31, 'Capacity (L)', 2),
(32, 'Voltage (V)', 2),
(33, 'Energy Rating', 1),
(34, 'Number of Pieces', 2),
(35, 'Installation Type', 1),
(36, 'Dishwasher Safe', 1),

-- Beauty & Personal Care
(37, 'Skin Type', 1),
(38, 'Hair Type', 1),
(39, 'Fragrance', 1),
(40, 'Expiration Date', 3);


INSERT INTO attribute_option (id, attribute_id, value, is_active) VALUES
-- Color (attribute_id = 3)
(1, 3, 'Black', true),
(2, 3, 'White', true),
(3, 3, 'Gray', true),
(4, 3, 'Silver', true),
(5, 3, 'Blue', true),
(6, 3, 'Red', true),
(7, 3, 'Green', true),
(8, 3, 'Yellow', true),
(9, 3, 'Pink', true),
(10, 3, 'Beige', true),

-- Material (attribute_id = 4)
(11, 4, 'Cotton', true),
(12, 4, 'Polyester', true),
(13, 4, 'Leather', true),
(14, 4, 'Wool', true),
(15, 4, 'Denim', true),
(16, 4, 'Nylon', true),
(17, 4, 'Metal', true),
(18, 4, 'Plastic', true),
(19, 4, 'Glass', true),
(20, 4, 'Wood', true),

-- Operating System (attribute_id = 16)
(21, 16, 'Windows 11', true),
(22, 16, 'macOS', true),
(23, 16, 'Android', true),
(24, 16, 'iOS', true),
(25, 16, 'Linux', true),

-- Connectivity (attribute_id = 18)
(26, 18, 'Wi-Fi', true),
(27, 18, 'Bluetooth', true),
(28, 18, 'Wi-Fi + Bluetooth', true),
(29, 18, 'USB-C', true),
(30, 18, 'HDMI', true),

-- Fit Type (attribute_id = 22)
(31, 22, 'Slim Fit', true),
(32, 22, 'Regular Fit', true),
(33, 22, 'Relaxed Fit', true),
(34, 22, 'Loose Fit', true),

-- Pattern (attribute_id = 23)
(35, 23, 'Solid', true),
(36, 23, 'Striped', true),
(37, 23, 'Checked', true),
(38, 23, 'Printed', true),
(39, 23, 'Floral', true),

-- Fabric Type (attribute_id = 24)
(40, 24, 'Cotton', true),
(41, 24, 'Polyester', true),
(42, 24, 'Wool Blend', true),
(43, 24, 'Denim', true),
(44, 24, 'Linen', true),

-- Sleeve Length (attribute_id = 25)
(45, 25, 'Short Sleeve', true),
(46, 25, 'Long Sleeve', true),
(47, 25, 'Sleeveless', true),
(48, 25, 'Three-Quarter Sleeve', true),

-- Neck Style (attribute_id = 26)
(49, 26, 'Crew Neck', true),
(50, 26, 'V-Neck', true),
(51, 26, 'Collared', true),
(52, 26, 'Round Neck', true),

-- Gender (attribute_id = 29)
(53, 29, 'Men', true),
(54, 29, 'Women', true),
(55, 29, 'Unisex', true),
(56, 29, 'Kids', true),

-- Season (attribute_id = 30)
(57, 30, 'Spring', true),
(58, 30, 'Summer', true),
(59, 30, 'Autumn', true),
(60, 30, 'Winter', true),
(61, 30, 'All Season', true),

-- Energy Rating (attribute_id = 33)
(62, 33, 'A+++', true),
(63, 33, 'A++', true),
(64, 33, 'A+', true),
(65, 33, 'A', true),
(66, 33, 'B', true),

-- Installation Type (attribute_id = 35)
(67, 35, 'Freestanding', true),
(68, 35, 'Built-in', true),
(69, 35, 'Portable', true),

-- Dishwasher Safe (attribute_id = 36)
(70, 36, 'Yes', true),
(71, 36, 'No', true),

-- Skin Type (attribute_id = 37)
(72, 37, 'Normal', true),
(73, 37, 'Dry', true),
(74, 37, 'Oily', true),
(75, 37, 'Combination', true),
(76, 37, 'Sensitive', true),

-- Hair Type (attribute_id = 38)
(77, 38, 'Straight', true),
(78, 38, 'Wavy', true),
(79, 38, 'Curly', true),
(80, 38, 'Coily', true),

-- Fragrance (attribute_id = 39)
(81, 39, 'Floral', true),
(82, 39, 'Citrus', true),
(83, 39, 'Woody', true),
(84, 39, 'Fresh', true),
(85, 39, 'Unscented', true);


INSERT INTO product_attribute (id, product_item_id, option_id) VALUES
-- ELECTRONICS
-- MacBook Air (Silver, macOS, Wi-Fi + Bluetooth)
(1, 1, 4),  -- Color: Silver
(2, 1, 22), -- OS: macOS
(3, 1, 28), -- Connectivity: Wi-Fi + Bluetooth
(4, 2, 4),
(5, 2, 22),
(6, 2, 28),

-- Dell XPS 15 (Black, Windows 11, Wi-Fi + Bluetooth)
(7, 3, 1),
(8, 3, 21),
(9, 3, 28),
(10, 4, 1),
(11, 4, 21),
(12, 4, 28),

-- Samsung Galaxy S23 (Blue, Android, Wi-Fi + Bluetooth)
(13, 5, 5),
(14, 5, 23),
(15, 5, 28),
(16, 6, 5),
(17, 6, 23),
(18, 6, 28),

-- Sony Headphones (Black, Bluetooth)
(19, 8, 1),
(20, 8, 27),
(21, 9, 4),
(22, 9, 27),

-- Canon Camera (Black, Wi-Fi + Bluetooth)
(23, 10, 1),
(24, 10, 28),

-- iPad Pro (Silver, iOS, Wi-Fi + Bluetooth)
(25, 11, 4),
(26, 11, 24),
(27, 11, 28),
(28, 12, 4),
(29, 12, 24),
(30, 12, 28),

-- Logitech Mouse (Gray, Bluetooth)
(31, 13, 3),
(32, 13, 27),
(33, 14, 3),
(34, 14, 27),

-- Amazon Echo (Black, Wi-Fi + Bluetooth)
(35, 15, 1),
(36, 15, 28),
(37, 16, 2),
(38, 16, 28),

-- Apple Watch (Silver, iOS, Bluetooth)
(39, 17, 4),
(40, 17, 24),
(41, 17, 27),
(42, 18, 4),
(43, 18, 24),
(44, 18, 27),

-- HP Printer (White, Wi-Fi)
(45, 19, 2),
(46, 19, 26),

-- CLOTHING
-- Men’s T-Shirt (Black/White, Regular Fit, Men)
(47, 20, 1),
(48, 20, 32),
(49, 20, 53),
(50, 21, 2),
(51, 21, 32),
(52, 21, 53),

-- Levi’s Jeans (Blue, Slim Fit, Men)
(53, 22, 5),
(54, 22, 31),
(55, 22, 53),
(56, 23, 5),
(57, 23, 31),
(58, 23, 53),

-- Women’s Leggings (Gray, Slim Fit, Women)
(59, 24, 3),
(60, 24, 31),
(61, 24, 54),
(62, 25, 3),
(63, 25, 31),
(64, 25, 54),

-- Nike Pegasus (Black, Regular Fit, Men)
(65, 26, 1),
(66, 26, 32),
(67, 26, 53),
(68, 27, 1),
(69, 27, 32),
(70, 27, 53),

-- Adidas Ultraboost (White, Regular Fit, Men)
(71, 28, 2),
(72, 28, 32),
(73, 28, 53),
(74, 29, 2),
(75, 29, 32),
(76, 29, 53),

-- Women’s Dress (Floral, Regular Fit, Women)
(77, 30, 39),
(78, 30, 32),
(79, 30, 54),
(80, 31, 39),
(81, 31, 32),
(82, 31, 54),

-- Men’s Jacket (Gray, Regular Fit, Men)
(83, 32, 3),
(84, 32, 32),
(85, 32, 53),

-- Kids Pajamas (Blue, Regular Fit, Kids)
(86, 33, 5),
(87, 33, 32),
(88, 33, 56),

-- Women’s Wool Coat (Beige, Regular Fit, Women)
(89, 34, 10),
(90, 34, 32),
(91, 34, 54),

-- Men’s Leather Belt (Brown not in color list, use Black, Men)
(92, 35, 1),
(93, 35, 53),
(94, 36, 1),
(95, 36, 53),

-- HOME & KITCHEN
-- Sofa (Gray, Fabric: Cotton)
(96, 37, 3),
(97, 37, 40),

-- Dyson Vacuum (Silver, Energy Rating A+++, Built-in)
(98, 38, 4),
(99, 38, 62),
(100, 38, 68),

-- KitchenAid Mixer (Red, Energy Rating A+, Freestanding)
(101, 39, 6),
(102, 39, 64),
(103, 39, 67),

-- Nespresso (Black, Energy Rating A+, Built-in)
(104, 40, 1),
(105, 40, 64),
(106, 40, 68),

-- Philips Air Fryer (White, Energy Rating A++, Freestanding)
(107, 41, 2),
(108, 41, 63),
(109, 41, 67),

-- Instant Pot (Silver, Energy Rating A, Freestanding)
(110, 42, 4),
(111, 42, 65),
(112, 42, 67),

-- Cuisinart Cookware (Silver, Dishwasher Safe: Yes)
(113, 43, 4),
(114, 43, 70),

-- Standing Desk (White, Material: Wood)
(115, 44, 2),
(116, 44, 20),

-- OXO Containers (Transparent = use White, Dishwasher Safe: Yes)
(117, 45, 2),
(118, 45, 70),

-- Smeg Toaster (Red, Energy Rating: A)
(119, 46, 6),
(120, 46, 65),

-- SPORTS & OUTDOORS
-- Basketball (Orange substitute = use Yellow)
(121, 47, 8),
-- Golf Set (Green)
(122, 48, 7),
-- Fitbit (Black)
(123, 49, 1),
-- Tent (Green)
(124, 50, 7),
-- Mountain Bike (Red)
(125, 51, 6),
-- Gym Bag (Blue)
(126, 52, 5),
-- Garmin Watch (Black)
(127, 53, 1),
-- Yoga Mat (Blue)
(128, 54, 5),
-- Backpack (Gray)
(129, 55, 3),
-- Dumbbells (Black)
(130, 56, 1),

-- BOOKS (no attribute options – skip specific characteristics)

-- BEAUTY & PERSONAL CARE
-- CeraVe Cleanser (Skin Type: Normal, Fragrance: Unscented)
(131, 62, 72),
(132, 62, 85),

-- L’Oreal Shampoo (Hair Type: Wavy, Fragrance: Floral)
(133, 63, 78),
(134, 63, 81),

-- Maybelline Foundation (Skin Type: Oily, Fragrance: Unscented)
(135, 64, 74),
(136, 64, 85),
(137, 65, 74),
(138, 65, 85),

-- TOYS & GAMES
-- LEGO Set (Multicolor = use Blue)
(139, 66, 5),
(140, 67, 5),

-- Hot Wheels Pack (Multicolor = use Red)
(141, 68, 6);
