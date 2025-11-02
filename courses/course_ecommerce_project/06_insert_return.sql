/*
Return Data Insert

Inserts data into a few return-related tables
*/

DELETE FROM refund;
DELETE FROM return_item;
DELETE FROM order_return;
DELETE FROM order_return_status;



INSERT INTO order_return_status (id, status_name)
VALUES
(1, 'Requested'),
(2, 'Approved'),
(3, 'Rejected'),
(4, 'Completed');


INSERT INTO order_return (id, cust_order_id, order_return_status_id, return_date, reason, notes)
VALUES
-- 2023 returns
(1, 6, 1, '2023-04-05 10:15:00', 'Item arrived damaged', 'Customer reported visible cracks on delivery; pending review.'),
(2, 9, 4, '2023-05-30 09:00:00', 'Product not as described', 'Return completed and refunded to original payment method.'),
(3, 11, 4, '2023-06-28 15:10:00', 'Defective electronic item', 'Customer provided video proof; refund issued in full.'),
(4, 14, 3, '2023-08-03 12:00:00', 'Changed mind after purchase', 'Return request denied as product was opened.'),
(5, 18, 2, '2023-09-29 10:30:00', 'Wrong size received', 'Return approved; awaiting customer to ship back item.'),

-- 2024 returns
(6, 22, 4, '2024-02-14 08:00:00', 'Defective unit', 'Returned successfully; customer issued replacement.'),
(7, 24, 3, '2024-03-11 09:45:00', 'Received wrong color', 'Return denied; color variant matches order details.'),
(8, 26, 4, '2024-04-06 11:15:00', 'Size did not fit', 'Customer refunded in full.'),
(9, 34, 2, '2024-07-23 10:20:00', 'Missing accessories', 'Return approved; customer provided images of missing parts.'),
(10, 37, 1, '2024-09-06 09:00:00', 'Arrived late', 'Awaiting approval; under logistics team review.'),

-- 2025 returns
(11, 41, 4, '2025-01-10 11:30:00', 'Faulty screen', 'Customer received partial refund after screen failure report.'),
(12, 43, 3, '2025-02-12 13:20:00', 'Did not meet expectations', 'Rejected as product meets specification standards.'),
(13, 45, 4, '2025-05-03 10:45:00', 'Received duplicate item', 'Extra item confirmed; refund completed.'),
(14, 47, 2, '2025-06-09 09:50:00', 'Item stopped working after 2 days', 'Approved; return label emailed to customer.'),
(15, 49, 1, '2025-07-10 15:40:00', 'Wrong product delivered', 'Pending verification from warehouse before approval.');





INSERT INTO return_item (id, order_return_id, order_item_id, quantity, reason)
VALUES
-- 2023 returns
(1, 1, 6, 1, 'Item arrived damaged'),
(2, 2, 11, 1, 'Product not as described'),
(3, 3, 11, 1, 'Defective electronic item'),
(4, 4, 14, 1, 'Changed mind after purchase'),
(5, 5, 18, 1, 'Wrong size received'),

-- 2024 returns
(6, 6, 22, 1, 'Defective unit'),
(7, 7, 24, 1, 'Received wrong color'),
(8, 8, 28, 1, 'Size did not fit'),
(9, 9, 34, 1, 'Missing accessories'),
(10, 10, 37, 1, 'Arrived late'),

-- 2025 returns
(11, 11, 43, 1, 'Faulty screen'),
(12, 12, 44, 1, 'Did not meet expectations'),
(13, 13, 45, 1, 'Received duplicate item'),
(14, 14, 47, 1, 'Item stopped working after 2 days'),
(15, 15, 49, 1, 'Wrong product delivered'),

-- Multi-item returns (common in apparel and bundles)
(16, 2, 53, 1, 'Included wrong accessory'),
(17, 6, 23, 1, 'Additional damaged component'),
(18, 8, 30, 1, 'Item too small'),
(19, 13, 46, 1, 'Incorrect variation sent'),
(20, 14, 56, 1, 'Second item in order also faulty');


INSERT INTO refund (id, order_return_id, refund_date, amount, payment_reference, notes)
VALUES
-- 2023 refunds
(1, 2, '2023-06-01 14:30:00', 999.00, 'RFND-20230601-0001', 'Full refund processed for product not as described.'),
(2, 3, '2023-07-01 10:20:00', 447.89, 'RFND-20230701-0002', 'Full refund for defective electronic item.'),
(3, 5, '2023-10-01 09:15:00', 48.98, 'RFND-20231001-0003', 'Approved return for wrong size received. Refund issued after item received.'),

-- 2024 refunds
(4, 6, '2024-02-17 11:45:00', 104.98, 'RFND-20240217-0004', 'Refund issued for defective unit.'),
(5, 8, '2024-04-09 16:20:00', 64.48, 'RFND-20240409-0005', 'Size did not fit; full refund processed.'),
(6, 9, '2024-07-25 10:45:00', 202.89, 'RFND-20240725-0006', 'Missing accessories; refund approved.'),
(7, 7, '2024-03-13 09:30:00', 23.88, 'RFND-20240313-0007', 'Goodwill refund after color mismatch complaint.'),

-- 2025 refunds
(8, 11, '2025-01-15 09:00:00', 100.00, 'RFND-20250115-0008', 'Partial refund for faulty screen.'),
(9, 13, '2025-05-05 13:20:00', 23.88, 'RFND-20250505-0009', 'Duplicate item confirmed; full refund issued.'),
(10, 14, '2025-06-12 09:45:00', 152.90, 'RFND-20250612-0010', 'Return approved and refunded after functionality issue.'),
(11, 9, '2024-07-26 11:10:00', 20.00, 'RFND-20240726-0011', 'Additional partial refund for shipping cost adjustment.'),
(12, 6, '2024-02-18 14:00:00', 15.00, 'RFND-20240218-0012', 'Goodwill partial refund for inconvenience delay.');


