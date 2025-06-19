CREATE TABLE new_customer (
	id UNIQUEIDENTIFIER,
	first_name VARCHAR(20)
);


INSERT INTO new_customer (id, first_name)
VALUES (NEWID(), 'Claire');

SELECT id, first_name
FROM new_customer;


INSERT INTO new_customer (id, first_name)
VALUES (NEWID(), 'Ryan');

INSERT INTO new_customer (id, first_name)
VALUES (NEWID(), 'Paula');


