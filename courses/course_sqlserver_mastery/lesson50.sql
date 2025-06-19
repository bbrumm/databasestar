CREATE TABLE customer_status (
	id SMALLINT IDENTITY,
	status_value VARCHAR(100)
);



INSERT INTO customer_status (status_value) VALUES
('Active'),
('Pending');



SELECT id, status_value
FROM customer_status;


INSERT INTO customer_status (status_value) VALUES
('Inactive');


SELECT MAX(id)
FROM customer_status;



DECLARE @inserted_data TABLE (
	id SMALLINT
);

INSERT INTO customer_status (status_value)
OUTPUT inserted.id INTO @inserted_data (id)
VALUES ('In Progress');

SELECT id
FROM @inserted_data;