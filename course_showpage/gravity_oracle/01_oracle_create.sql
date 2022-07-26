
CREATE TABLE author (
    author_id NUMBER,
    author_name VARCHAR2(400),
    CONSTRAINT pk_author PRIMARY KEY (author_id)
);

CREATE TABLE publisher (
    publisher_id NUMBER,
    publisher_name VARCHAR2(400),
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id)
);

CREATE TABLE book_language (
    language_id NUMBER,
    language_code VARCHAR2(8),
    language_name VARCHAR2(50),
    CONSTRAINT pk_language PRIMARY KEY (language_id)
);

CREATE TABLE book (
    book_id NUMBER,
    title VARCHAR2(400),
    isbn13 VARCHAR2(13),
    language_id NUMBER,
    num_pages NUMBER,
    publication_date DATE,
    publisher_id NUMBER,
    CONSTRAINT pk_book PRIMARY KEY (book_id),
    CONSTRAINT fk_book_lang FOREIGN KEY (language_id) REFERENCES book_language (language_id),
    CONSTRAINT fk_book_pub FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);

CREATE TABLE book_author (
    book_id NUMBER,
    author_id NUMBER,
    CONSTRAINT pk_bookauthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES author (author_id)
);

CREATE TABLE address_status (
    status_id NUMBER,
    address_status VARCHAR2(30),
    CONSTRAINT pk_addr_status PRIMARY KEY (status_id)
);

CREATE TABLE country (
    country_id NUMBER,
    country_name VARCHAR2(200),
    CONSTRAINT pk_country PRIMARY KEY (country_id)
);

CREATE TABLE address (
    address_id NUMBER,
    street_number VARCHAR2(10),
    street_name VARCHAR2(200),
    city VARCHAR2(100),
    country_id NUMBER,
    CONSTRAINT pk_address PRIMARY KEY (address_id),
    CONSTRAINT fk_addr_ctry FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE customer (
    customer_id NUMBER,
    first_name VARCHAR2(200),
    last_name VARCHAR2(200),
    email VARCHAR2(350),
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
    customer_id NUMBER,
    address_id NUMBER,
    status_id NUMBER,
    CONSTRAINT pk_custaddr PRIMARY KEY (customer_id, address_id),
    CONSTRAINT fk_ca_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_ca_addr FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE shipping_method (
    method_id NUMBER,
    method_name VARCHAR2(100),
    cost DECIMAL(6, 2),
    CONSTRAINT pk_shipmethod PRIMARY KEY (method_id)
);

CREATE SEQUENCE seq_custorder;

CREATE TABLE cust_order (
    order_id NUMBER,
    order_date DATE,
    customer_id NUMBER,
    shipping_method_id NUMBER,
    dest_address_id NUMBER,
    CONSTRAINT pk_custorder PRIMARY KEY (order_id),
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_ship FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (dest_address_id) REFERENCES address (address_id)
);

CREATE TABLE order_status (
    status_id NUMBER,
    status_value VARCHAR2(20),
    CONSTRAINT pk_orderstatus PRIMARY KEY (status_id)
);

CREATE SEQUENCE seq_orderline;

CREATE TABLE order_line (
    line_id NUMBER,
    order_id NUMBER,
    book_id NUMBER,
    price NUMBER(5, 2),
    CONSTRAINT pk_orderline PRIMARY KEY (line_id),
    CONSTRAINT fk_ol_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_ol_book FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE SEQUENCE seq_orderhist;

CREATE TABLE order_history (
    history_id NUMBER,
    order_id NUMBER,
    status_id NUMBER,
    status_date DATE,
    CONSTRAINT pk_orderhist PRIMARY KEY (history_id),
    CONSTRAINT fk_oh_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_oh_status FOREIGN KEY (status_id) REFERENCES order_status (status_id)
);
