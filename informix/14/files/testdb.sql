-- Create database
SET lock mode TO wait;
CREATE DATABASE testdb WITH log;
DATABASE testdb;

-- Create products table
CREATE TABLE products (
  id SERIAL (101) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  weight FLOAT
);

-- Create customers table
CREATE TABLE customers (
  id SERIAL(1001) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

-- Create products_on_hand table
CREATE TABLE products_on_hand (
  product_id INTEGER NOT NULL PRIMARY KEY,
  quantity INTEGER NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Create orders table
CREATE TABLE orders (
  id SERIAL(10001) PRIMARY KEY,
  order_date DATE NOT NULL,
  purchaser INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  FOREIGN KEY (purchaser) REFERENCES customers(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert products rows
INSERT INTO products(name,description,weight)
VALUES ('scooter','Small 2-wheel scooter',3.14);

INSERT INTO products(name,description,weight)
VALUES ('car battery','12V car battery',8.1);

INSERT INTO products(name,description,weight)
VALUES ('12-pack drill bits', '12-pack of drill bits with sizes ranging from #40 to #3',0.8);

INSERT INTO products(name,description,weight)
VALUES ('hammer','12oz carpenter''s hammer',0.75);

INSERT INTO products(name,description,weight)
VALUES ('hammer','14oz carpenter''s hammer',0.875);

INSERT INTO products(name,description,weight)
VALUES ('hammer','16oz carpenter''s hammer',1.0);

INSERT INTO products(name,description,weight)
VALUES ('rocks','box of assorted rocks',5.3);

INSERT INTO products(name,description,weight)
VALUES ('jacket','water resistent black wind breaker',0.1);

INSERT INTO products(name,description,weight)
VALUES ('spare tire','24 inch spare tire',22.2);

-- Insert customers rows
INSERT INTO customers(first_name,last_name,email)
VALUES ('Sally','Thomas','sally.thomas@acme.com');

INSERT INTO customers(first_name,last_name,email)
VALUES ('George','Bailey','gbailey@foobar.com');

INSERT INTO customers(first_name,last_name,email)
VALUES ('Edward','Walker','ed@walker.com');

INSERT INTO customers(first_name,last_name,email)
VALUES ('Anne','Kretchmar','annek@noanswer.org');

-- Insert orders rows
INSERT INTO orders(order_date,purchaser,quantity,product_id)
VALUES (TO_DATE('2016-01-16', '%Y-%m-%d'), 1001, 1, 102);

INSERT INTO orders(order_date,purchaser,quantity,product_id)
VALUES (TO_DATE('2016-01-17', '%Y-%m-%d'), 1002, 2, 105);

INSERT INTO orders(order_date,purchaser,quantity,product_id)
VALUES (TO_DATE('2016-02-19', '%Y-%m-%d'), 1002, 2, 106);

INSERT INTO orders(order_date,purchaser,quantity,product_id)
VALUES (TO_DATE('2016-02-21', '%Y-%m-%d'), 1003, 1, 107);

-- Insert products_on_hands rows
INSERT INTO products_on_hand VALUES (101,3);
INSERT INTO products_on_hand VALUES (102,8);
INSERT INTO products_on_hand VALUES (103,18);
INSERT INTO products_on_hand VALUES (104,4);
INSERT INTO products_on_hand VALUES (105,5);
INSERT INTO products_on_hand VALUES (106,0);
INSERT INTO products_on_hand VALUES (107,44);
INSERT INTO products_on_hand VALUES (108,2);
INSERT INTO products_on_hand VALUES (109,5);
