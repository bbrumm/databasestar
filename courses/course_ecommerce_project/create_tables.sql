DROP TABLE IF EXISTS refund;
DROP TABLE IF EXISTS return_item;
DROP TABLE IF EXISTS order_return;
DROP TABLE IF EXISTS order_return_status;
DROP TABLE IF EXISTS shipment_package;
DROP TABLE IF EXISTS shipment;
DROP TABLE IF EXISTS shipment_status;
DROP TABLE IF EXISTS carrier;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS payment_status;
DROP TABLE IF EXISTS payment_method;
DROP TABLE IF EXISTS order_discount;
DROP TABLE IF EXISTS discount;
DROP TABLE IF EXISTS discount_type;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS cust_order;
DROP TABLE IF EXISTS order_status;
DROP TABLE IF EXISTS product_attribute;
DROP TABLE IF EXISTS attribute_option;
DROP TABLE IF EXISTS attribute;
DROP TABLE IF EXISTS value_type;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS product_item;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS customer_address;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS customer_phone_number;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  id bigint PRIMARY KEY,
  first_name varchar(200),
  last_name varchar(200),
  email varchar(400),
  created_at timestamp with time zone,
  updated_at timestamp with time zone
);

CREATE TABLE customer_phone_number (
  id bigint PRIMARY KEY,
  customer_id bigint,
  phone_number varchar(50),
  is_default boolean,
  created_at timestamp with time zone,
  CONSTRAINT fk_cpn_customer FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE country (
  id int PRIMARY KEY,
  country_name varchar(200)
);


CREATE TABLE customer_address (
  id bigint PRIMARY KEY,
  customer_id bigint,
  address_line1 varchar(500),
  address_line2 varchar(500),
  city varchar(200),
  state_region varchar(200),
  postal_code varchar(40),
  country_id int,
  is_default boolean,
  valid_from timestamp with time zone,
  valid_to timestamp with time zone,
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  CONSTRAINT fk_custadd_customer FOREIGN KEY (customer_id) REFERENCES customer (id),
  CONSTRAINT fk_custadd_country  FOREIGN KEY (country_id) REFERENCES country (id)
);


CREATE TABLE category (
  id int PRIMARY KEY,
  name varchar(200) UNIQUE NOT NULL,
  parent_id int,
  CONSTRAINT fk_cat_parent FOREIGN KEY (parent_id) REFERENCES category (id)
);

CREATE TABLE product (
  id int PRIMARY KEY,
  name varchar(500),
  description text,
  is_active boolean,
  created_at timestamp with time zone,
  updated_at timestamp with time zone
);

CREATE TABLE product_item (
  id int PRIMARY KEY,
  product_id int,
  sku varchar(100),
  price decimal(12,2),
  stock_qty int,
  is_active boolean,
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  CONSTRAINT fk_prodit_product FOREIGN KEY (product_id) REFERENCES product (id)
);

CREATE TABLE product_category (
  product_id int,
  category_id int,
  CONSTRAINT fk_prodcat_product FOREIGN KEY (product_id) REFERENCES product (id),
  CONSTRAINT fk_prodcat_cat FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE value_type (
  id int PRIMARY KEY,
  type_name varchar(50)
);

CREATE TABLE attribute (
  id int PRIMARY KEY,
  name varchar(100) UNIQUE,
  value_type_id int,
  CONSTRAINT fk_att_valuetype FOREIGN KEY (value_type_id) REFERENCES value_type (id)
);

CREATE TABLE attribute_option (
  id int PRIMARY KEY,
  attribute_id int,
  value varchar(300),
  is_active boolean,
  CONSTRAINT fk_attop_attribute FOREIGN KEY (attribute_id) REFERENCES attribute (id)
);

CREATE TABLE product_attribute (
  id int PRIMARY KEY,
  product_item_id int,
  option_id int,
  CONSTRAINT fk_prodatt_proditem FOREIGN KEY (product_item_id) REFERENCES product_item (id),
  CONSTRAINT fk_prodatt_option FOREIGN KEY (option_id) REFERENCES attribute_option (id)
);


CREATE TABLE order_status (
  id int PRIMARY KEY,
  name varchar(100)
);


CREATE TABLE cust_order (
  id bigint PRIMARY KEY,
  customer_id bigint,
  order_status_id int,
  order_date timestamp with time zone,
  subtotal_amount decimal(12,2),
  discount_amount decimal(12,2),
  shipping_amount decimal(12,2),
  tax_amount decimal(12,2),
  total_amount decimal(12,2),
  shipping_address_id bigint,
  notes text,
  created_at timestamp with time zone,
  updated_at timestamp with time zone,
  CONSTRAINT fk_custord_customer FOREIGN KEY (customer_id) REFERENCES customer (id),
  CONSTRAINT fk_custord_status FOREIGN KEY (order_status_id) REFERENCES order_status (id),
  CONSTRAINT fk_custord_shipaddress FOREIGN KEY (shipping_address_id) REFERENCES customer_address (id)
);


CREATE TABLE order_item (
  id bigint PRIMARY KEY,
  order_id bigint,
  product_item_id int,
  quantity int,
  unit_price decimal(12,2),
  line_total decimal(12,2),
  CONSTRAINT fk_orditem_order FOREIGN KEY (order_id) REFERENCES cust_order (id),
  CONSTRAINT fk_orditem_proditem  FOREIGN KEY (product_item_id) REFERENCES product_item (id)
);

CREATE TABLE discount_type (
  id int PRIMARY KEY,
  discount varchar(20)
);

CREATE TABLE discount (
  id int PRIMARY KEY,
  code varchar(100) UNIQUE,
  type_id int,
  value decimal(12,2),
  starts_at timestamp with time zone,
  expires_at timestamp with time zone,
  is_active boolean,
  CONSTRAINT fk_disc_type FOREIGN KEY (type_id) REFERENCES discount_type (id)
);

CREATE TABLE order_discount (
  id int PRIMARY KEY,
  order_id bigint,
  discount_id int,
  applied_value decimal(12,2),
  CONSTRAINT fk_orddisc_order FOREIGN KEY (order_id) REFERENCES cust_order (id),
  CONSTRAINT fk_orddisc_discount FOREIGN KEY (discount_id) REFERENCES discount (id)
);



CREATE TABLE payment_method (
  id int PRIMARY KEY,
  method_name varchar(100)
);

CREATE TABLE payment_status (
  id int PRIMARY KEY,
  status_name varchar(100)
);


CREATE TABLE payment (
  id int PRIMARY KEY,
  order_id bigint,
  payment_method_id int,
  payment_status_id int,
  payment_date timestamp with time zone,
  amount decimal(12,2),
  transaction_reference varchar(100),
  CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES cust_order (id),
  CONSTRAINT fk_payment_paymethod FOREIGN KEY (payment_method_id) REFERENCES payment_method (id),
  CONSTRAINT fk_payment_paystatus FOREIGN KEY (payment_status_id) REFERENCES payment_status (id)
);

CREATE TABLE carrier (
  id int PRIMARY KEY,
  carrier_name varchar(200),
  contact_number varchar(50),
  website varchar(500)
);

CREATE TABLE shipment_status (
  id int PRIMARY KEY,
  status_name varchar(100)
);

CREATE TABLE shipment (
  id int PRIMARY KEY,
  order_id bigint,
  carrier_id int,
  shipment_status_id int,
  shipped_date timestamp with time zone,
  delivered_date timestamp with time zone,
  tracking_number varchar(100),
  CONSTRAINT fk_shipment_order FOREIGN KEY (order_id) REFERENCES cust_order (id),
  CONSTRAINT fk_shipment_carrier FOREIGN KEY (carrier_id) REFERENCES carrier (id),
  CONSTRAINT fk_shipment_status FOREIGN KEY (shipment_status_id) REFERENCES shipment_status (id)
);


CREATE TABLE shipment_package (
  id int PRIMARY KEY,
  shipment_id int,
  weight int,
  length int,
  width int,
  height int,
  contents_description varchar(500),
    CONSTRAINT fk_shippack_shipment FOREIGN KEY (shipment_id) REFERENCES shipment (id)
);


CREATE TABLE order_return_status (
  id int PRIMARY KEY,
  status_name varchar(100)
);

CREATE TABLE order_return (
  id int PRIMARY KEY,
  cust_order_id bigint,
  order_return_status_id int,
  return_date timestamp with time zone,
  reason varchar(200),
  notes text,
  CONSTRAINT fk_orderreturn_order FOREIGN KEY (cust_order_id) REFERENCES cust_order (id),
  CONSTRAINT fk_orderreturn_status FOREIGN KEY (order_return_status_id) REFERENCES order_return_status (id)
);


CREATE TABLE return_item (
  id int PRIMARY KEY,
  order_return_id int,
  order_item_id int,
  quantity int,
  reason varchar(200),
  CONSTRAINT fk_returnitem_return FOREIGN KEY (order_return_id) REFERENCES order_return (id),
  CONSTRAINT fk_returnitem_orderitem FOREIGN KEY (order_item_id) REFERENCES order_item (id)
);

CREATE TABLE refund (
  id int PRIMARY KEY,
  order_return_id int,
  refund_date timestamp with time zone,
  amount decimal(12,2),
  payment_reference varchar(100),
  notes text,
  CONSTRAINT fk_refund_orderreturn  FOREIGN KEY (order_return_id) REFERENCES order_return (id)
);

