SELECT b.book_id, b.title, b.isbn13, p.publisher_name, COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC;