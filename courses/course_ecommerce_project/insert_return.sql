/*
Return Data Insert

Inserts data into a few return-related tables
*/

INSERT INTO order_return (id, order_id, status_id, reason, requested_at, approved_at)
VALUES
-- 2023 Returns
(1, 6, 1, 'Item arrived damaged', '2023-04-05 10:15:00', NULL),
(2, 9, 4, 'Product not as described', '2023-05-30 09:00:00', '2023-06-01 14:00:00'),
(3, 11, 4, 'Defective electronic item', '2023-06-28 15:10:00', '2023-07-01 09:20:00'),
(4, 14, 3, 'Changed mind after purchase', '2023-08-03 12:00:00', '2023-08-04 08:00:00'),
(5, 18, 2, 'Wrong size received', '2023-09-29 10:30:00', '2023-09-30 11:45:00'),

-- 2024 Returns
(6, 22, 4, 'Defective unit', '2024-02-14 08:00:00', '2024-02-16 10:30:00'),
(7, 24, 3, 'Received wrong color', '2024-03-11 09:45:00', '2024-03-12 09:00:00'),
(8, 26, 4, 'Size did not fit', '2024-04-06 11:15:00', '2024-04-08 15:00:00'),
(9, 34, 2, 'Missing accessories', '2024-07-23 10:20:00', '2024-07-24 08:15:00'),
(10, 37, 1, 'Arrived late', '2024-09-06 09:00:00', NULL),

-- 2025 Returns
(11, 41, 4, 'Faulty screen', '2025-01-10 11:30:00', '2025-01-12 16:00:00'),
(12, 43, 3, 'Did not meet expectations', '2025-02-12 13:20:00', '2025-02-13 09:30:00'),
(13, 45, 4, 'Received duplicate item', '2025-05-03 10:45:00', '2025-05-05 12:10:00'),
(14, 47, 2, 'Item stopped working after 2 days', '2025-06-09 09:50:00', '2025-06-10 10:30:00'),
(15, 49, 1, 'Wrong product delivered', '2025-07-10 15:40:00', NULL);


INSERT INTO order_return_status (id, name)
VALUES
(1, 'Requested'),
(2, 'Approved'),
(3, 'Rejected'),
(4, 'Completed');


INSERT INTO return_item (id, return_id, order_item_id, quantity, reason)
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


INSERT INTO refund (id, payment_id, return_id, amount, refunded_at, note)
VALUES
-- 2023 refunds
(1, 6, 1, 281.89, '2023-04-06 11:30:00', 'Full refund for damaged item'),
(2, 11, 3, 447.89, '2023-07-02 09:45:00', 'Refund for defective electronic item'),
(3, 14, 4, 129.99, '2023-08-05 10:20:00', 'Refund after customer cancellation'),
(4, 18, 5, 48.98, '2023-10-01 09:00:00', 'Refund for wrong size received'),
(5, 54, 3, 447.89, '2023-07-03 12:00:00', 'Replacement processed; refund original payment'),

-- 2024 refunds
(6, 22, 6, 104.98, '2024-02-18 11:00:00', 'Defective item refund'),
(7, 24, 7, 23.88, '2024-03-13 08:30:00', 'Color mismatch refund'),
(8, 26, 8, 64.48, '2024-04-09 16:00:00', 'Size did not fit refund'),
(9, 34, 9, 202.89, '2024-07-25 10:30:00', 'Missing accessories refund'),
(10, 40, 10, 28.19, '2024-09-08 14:10:00', 'Late delivery refund'),

-- 2025 refunds
(11, 41, 11, 100.00, '2025-01-15 09:15:00', 'Partial refund for faulty screen'),
(12, 43, 12, 249.00, '2025-02-15 10:00:00', 'Customer dissatisfaction refund'),
(13, 45, 13, 23.88, '2025-05-06 13:10:00', 'Duplicate item refund'),
(14, 47, 14, 152.90, '2025-06-12 09:30:00', 'Refund for non-functional item'),
(15, 49, 15, 306.90, '2025-07-15 11:45:00', 'Refund for wrong product delivered');