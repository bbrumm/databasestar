CREATE PROCEDURE dbo.find_book
  @book_id INT
AS
BEGIN
  SELECT title, isbn13
  FROM dbo.book_list;

END;