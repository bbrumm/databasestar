select *
from information_schema.columns
where table_name = 'car_prices';

SELECT CONCAT(column_name, ',')
FROM information_schema.columns
WHERE table_name = 'car_prices';
