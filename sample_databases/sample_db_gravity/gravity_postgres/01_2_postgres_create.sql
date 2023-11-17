CREATE TABLE author (
    author_id INT,
    author_name VARCHAR(400),
    CONSTRAINT pk_author PRIMARY KEY (author_id)
);

CREATE TABLE publisher (
    publisher_id INT,
    publisher_name VARCHAR(400),
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id)
);

CREATE TABLE book_language (
    language_id INT,
    language_code VARCHAR(8),
    language_name VARCHAR(50),
    CONSTRAINT pk_language PRIMARY KEY (language_id)
);

CREATE TABLE book (
    book_id INT,
    title VARCHAR(400),
    isbn13 VARCHAR(13),
    language_id INT,
    num_pages INT,
    publication_date DATE,
    publisher_id INT,
    CONSTRAINT pk_book PRIMARY KEY (book_id),
    CONSTRAINT fk_book_lang FOREIGN KEY (language_id) REFERENCES book_language (language_id),
    CONSTRAINT fk_book_pub FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    CONSTRAINT pk_bookauthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES author (author_id)
);

CREATE TABLE address_status (
    status_id INT,
    address_status VARCHAR(30),
    CONSTRAINT pk_addr_status PRIMARY KEY (status_id)
);

CREATE TABLE country (
    country_id INT,
    country_name VARCHAR(200),
    CONSTRAINT pk_country PRIMARY KEY (country_id)
);

CREATE TABLE address (
    address_id INT,
    street_number VARCHAR(10),
    street_name VARCHAR(200),
    city VARCHAR(100),
    country_id INT,
    CONSTRAINT pk_address PRIMARY KEY (address_id),
    CONSTRAINT fk_addr_ctry FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE customer (
    customer_id INT,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(350),
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    CONSTRAINT pk_custaddr PRIMARY KEY (customer_id, address_id),
    CONSTRAINT fk_ca_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_ca_addr FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE shipping_method (
    method_id INT,
    method_name VARCHAR(100),
    cost DECIMAL(6, 2),
    CONSTRAINT pk_shipmethod PRIMARY KEY (method_id)
);



CREATE TABLE cust_order (
    order_id SERIAL,
    order_date TIMESTAMP,
    customer_id INT,
    shipping_method_id INT,
    dest_address_id INT,
    CONSTRAINT pk_custorder PRIMARY KEY (order_id),
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_ship FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (dest_address_id) REFERENCES address (address_id)
);

CREATE TABLE order_status (
    status_id INT,
    status_value VARCHAR(20),
    CONSTRAINT pk_orderstatus PRIMARY KEY (status_id)
);


CREATE TABLE order_line (
    line_id SERIAL,
    order_id INT,
    book_id INT,
    price DECIMAL(5, 2),
    CONSTRAINT pk_orderline PRIMARY KEY (line_id),
    CONSTRAINT fk_ol_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_ol_book FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE TABLE order_history (
    history_id SERIAL,
    order_id INT,
    status_id INT,
    status_date TIMESTAMP,
    CONSTRAINT pk_orderhist PRIMARY KEY (history_id),
    CONSTRAINT fk_oh_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_oh_status FOREIGN KEY (status_id) REFERENCES order_status (status_id)
);

COMMIT;