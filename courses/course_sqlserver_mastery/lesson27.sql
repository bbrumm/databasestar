CREATE TABLE char_data (
  vc VARCHAR(20),
  nvc NVARCHAR(20),
  char_n CHAR(5)
);


INSERT INTO char_data(vc, nvc, char_n)
VALUES ('A', 'B', 'C');


SELECT *
FROM char_data;


INSERT INTO char_data(vc, nvc, char_n)
VALUES ('Monday', 'Tuesday', 'Wednesday');



INSERT INTO char_data(vc, nvc, char_n)
VALUES ('Monday', 'Tuesday', 'Wed');


INSERT INTO char_data(vc, nvc)
VALUES ('你好', '你好');


INSERT INTO char_data(vc, nvc)
VALUES (N'你好', N'你好');