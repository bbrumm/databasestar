CREATE TABLE new_customer (
	id INT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(500)
);


INSERT INTO new_customer (id, first_name, last_name, email) VALUES
(5001, 'Raul', 'Pentelow', 'rp@paypal.com'),
(5002, 'Peadar', 'Preator', 'ppreatorx@jiathis.com'),
(5003, 'John', 'Smith', 'jsmith@abc.com'),
(5004, 'Verene', 'Pettyfer', 'vpettyfer@hao123.com'),
(5005, 'Billi', 'Hughland', 'bhughland1j@usatoday.com'),
(5006, 'Jonell', 'McLay', 'jmclay@arizona.edu'),
(5007, 'Yance', 'Hartwright', 'yhartwright58@surveymonkey.com'),
(5008, 'Fletch', 'Canfield', 'fcanfield6n@bigcartel.com'),
(5009, 'Alli', 'Smith', 'asmith@xing.com'),
(5010, 'Morris', 'Morales', 'mmorales6u@zdnet.com');



SELECT customer_id, first_name, last_name, email
FROM customer;



MERGE INTO customer c
USING new_customer n
ON c.first_name = n.first_name 
AND c.last_name = n.last_name
WHEN MATCHED THEN
UPDATE SET c.email = n.email
WHEN NOT MATCHED THEN
INSERT (customer_id, first_name, last_name, email)
VALUES (n.id, n.first_name, n.last_name, n.email);