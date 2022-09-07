INSERT ALL
INTO book_language (language_code, language_id, language_name) VALUES ('eng', 1, 'English')
INTO book_language (language_code, language_id, language_name) VALUES ('en-US', 2, 'United States English')
INTO book_language (language_code, language_id, language_name) VALUES ('fre', 3, 'French')
INTO book_language (language_code, language_id, language_name) VALUES ('spa', 4, 'Spanish')
INTO book_language (language_code, language_id, language_name) VALUES ('en-GB', 5, 'British English')
INTO book_language (language_code, language_id, language_name) VALUES ('mul', 6, 'Multiple Languages')
INTO book_language (language_code, language_id, language_name) VALUES ('grc', 7, 'Greek')
INTO book_language (language_code, language_id, language_name) VALUES ('enm', 8, 'Middle English')
INTO book_language (language_code, language_id, language_name) VALUES ('en-CA', 9, 'Canadian English')
INTO book_language (language_code, language_id, language_name) VALUES ('ger', 10, 'German')
INTO book_language (language_code, language_id, language_name) VALUES ('jpn', 11, 'Japanese')
INTO book_language (language_code, language_id, language_name) VALUES ('ara', 12, 'Arabic')
INTO book_language (language_code, language_id, language_name) VALUES ('nl', 13, 'Dutch')
INTO book_language (language_code, language_id, language_name) VALUES ('zho', 14, 'Chinese')
INTO book_language (language_code, language_id, language_name) VALUES ('lat', 15, 'Latin')
INTO book_language (language_code, language_id, language_name) VALUES ('por', 16, 'Portuguese')
INTO book_language (language_code, language_id, language_name) VALUES ('srp', 17, 'Serbian')
INTO book_language (language_code, language_id, language_name) VALUES ('ita', 18, 'Italian')
INTO book_language (language_code, language_id, language_name) VALUES ('rus', 19, 'Russian')
INTO book_language (language_code, language_id, language_name) VALUES ('msa', 20, 'Malaysian')
INTO book_language (language_code, language_id, language_name) VALUES ('glg', 21, 'Galician')
INTO book_language (language_code, language_id, language_name) VALUES ('wel', 22, 'Welsh')
INTO book_language (language_code, language_id, language_name) VALUES ('swe', 23, 'Swedish')
INTO book_language (language_code, language_id, language_name) VALUES ('nor', 24, 'Norwegian')
INTO book_language (language_code, language_id, language_name) VALUES ('tur', 25, 'Turkish')
INTO book_language (language_code, language_id, language_name) VALUES ('gla', 26, 'Gaelic')
INTO book_language (language_code, language_id, language_name) VALUES ('ale', 27, 'Aleut')
SELECT * FROM dual;

INSERT ALL
INTO shipping_method (method_id, method_name, cost) VALUES(1, 'Standard', 5.9)
INTO shipping_method (method_id, method_name, cost) VALUES(2, 'Priority', 8.9)
INTO shipping_method (method_id, method_name, cost) VALUES(3, 'Express', 11.9)
INTO shipping_method (method_id, method_name, cost) VALUES(4, 'International', 24.5)
SELECT * FROM dual;

INSERT ALL
INTO address_status (status_id, address_status) VALUES (1, 'Active')
INTO address_status (status_id, address_status) VALUES (2, 'Inactive')
SELECT * FROM dual;

INSERT ALL
INTO order_status (status_id, status_value) VALUES (1, 'Order Received')
INTO order_status (status_id, status_value) VALUES (2, 'Pending Delivery')
INTO order_status (status_id, status_value) VALUES (3, 'Delivery In Progress')
INTO order_status (status_id, status_value) VALUES (4, 'Delivered')
INTO order_status (status_id, status_value) VALUES (5, 'Cancelled')
INTO order_status (status_id, status_value) VALUES (6, 'Returned')
SELECT * FROM dual;

COMMIT;