/*
Sample data for the Oracle LISTAGG post
Post here: https://www.databasestar.com/oracle-listagg/
*/

CREATE TABLE customers (
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    country VARCHAR(100),
    full_address VARCHAR2(200),
    employees NUMBER,
    start_date DATE
);

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('John', 'Smith', 'USA', '10 Long Road', 4, TO_DATE('20100412', 'YYYYMMDD'));

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('Sally', 'Jones', 'USA', '50 Market Street', 10, TO_DATE('20110704', 'YYYYMMDD'));

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('Steve', 'Brown', 'Canada', '201 Flinders Lane', 15, TO_DATE('20090321', 'YYYYMMDD'));

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('Mark', 'Allan', 'UK', '8 Smith Street', 23, TO_DATE('20010201', 'YYYYMMDD'));

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('Adam', 'Cooper', 'USA', '14 Wellington Road', 55, NULL);

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('Josh', 'Thompson', NULL, '80 Victoria Street', 1, TO_DATE('20120210', 'YYYYMMDD'));

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES ('Peter', 'Manson', 'France', '5 Johnson St', NULL, TO_DATE('20121016', 'YYYYMMDD'));

INSERT INTO customers (first_name, last_name, country, full_address, employees, start_date)
VALUES (NULL, NULL, NULL, '155 Long Road', NULL, TO_DATE('20121016', 'YYYYMMDD'));