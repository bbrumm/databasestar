--Enable and Disable Trigger

ALTER TRIGGER so_before_insert DISABLE;

ALTER TABLE sales_order DISABLE ALL TRIGGERS;

ALTER TRIGGER so_before_insert ENABLE;

ALTER TABLE sales_order ENABLE ALL TRIGGERS;