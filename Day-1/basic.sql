-- Drop customer table if exists
DROP TABLE IF EXISTS customer;

-- Create customer table
CREATE TABLE customer (
   customer_id serial PRIMARY KEY,
   first_name character varying(100) NOT NULL,
   last_name character varying(100) NOT NULL,
   email character varying(255) UNIQUE NOT NULL,
   created_date timestamp with time zone NOT NULL DEFAULT now(),
   updated_date timestamp with time zone
);

-- Add column active
ALTER TABLE customer ADD COLUMN active boolean;

-- Create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    order_date timestamp with time zone NOT NULL DEFAULT now(),
    order_number CHARACTER VARYING(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

-- Insert data into customer
INSERT INTO customer (first_name, last_name, email, created_date, updated_date, active) VALUES
  ('Bansi','Sachade','bansi.sachade@tatvasoft.com',now(),NULL,true),
  ('John', 'Doe', 'johndoe@example.com', NOW(), NULL,true),
  ('Alice', 'Smith', 'alicesmith@example.com', NOW(), NULL,true),
  ('Bob', 'Johnson', 'bjohnson@example.com', NOW(), NULL,true),
  ('Emma', 'Brown', 'emmabrown@example.com', NOW(), NULL,true),
  ('Michael', 'Lee', 'michaellee@example.com', NOW(), NULL,false),
  ('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), NULL,true),
  ('David', 'Clark', 'davidclark@example.com', NOW(), NULL,true),
  ('Olivia', 'Martinez', 'oliviamartinez@example.com', NOW(), NULL,true),
  ('James', 'Garcia', 'jamesgarcia@example.com', NOW(), NULL,false),
  ('Sophia', 'Lopez', 'sophialopez@example.com', NOW(), NULL,false),
  ('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), NULL,true),
  ('Jennie', 'Terry', 'jennie.terry@example.com', NOW(), NULL,true),
  ('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(), NULL,false),
  ('Hiren', 'Patel', 'hirenpatel@example.com', NOW(), NULL,false);

-- Insert data into orders
INSERT INTO orders (customer_id, order_date, order_number, order_amount) VALUES
  (1, '2024-01-01', 'ORD001', 50.00),
  (2, '2024-01-01', 'ORD002', 35.75),
  (3, '2024-01-01', 'ORD003', 100.00),
  (4, '2024-01-01', 'ORD004', 30.25),
  (5, '2024-01-01', 'ORD005', 90.75),
  (6, '2024-01-01', 'ORD006', 25.50),
  (7, '2024-01-01', 'ORD007', 60.00),
  (8, '2024-01-01', 'ORD008', 42.00),
  (9, '2024-01-01', 'ORD009', 120.25),
  (10,'2024-01-01', 'ORD010', 85.00),
  (1, '2024-01-02', 'ORD011', 55.00),
  (1, '2024-01-03', 'ORD012', 80.25),
  (2, '2024-01-03', 'ORD013', 70.00),
  (3, '2024-01-04', 'ORD014', 45.00),
  (1, '2024-01-05', 'ORD015', 95.50),
  (2, '2024-01-05', 'ORD016', 27.50),
  (2, '2024-01-07', 'ORD017', 65.75),
  (2, '2024-01-10', 'ORD018', 75.50);

-- Sample queries:

-- View all customers
SELECT * FROM customer;

-- View all orders
SELECT * FROM orders;

-- Orders and customer join
SELECT * FROM orders AS o
INNER JOIN customer AS c
ON o.customer_id = c.customer_id;

-- Count and total orders per customer
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  COUNT(o.order_id) AS "NoOrders",
  SUM(o.order_amount) AS "Total"
FROM customer AS c
INNER JOIN orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Customers with more than 1 order
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  COUNT(o.order_id) AS "No_Orders",
  SUM(o.order_amount) AS "Total"
FROM customer AS c
INNER JOIN orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;

-- Active customers with orders
SELECT * FROM orders
WHERE customer_id IN (SELECT customer_id FROM customer WHERE active = true);

-- Customers with at least one order (exists)
SELECT
  customer_id,
  first_name,
  last_name,
  email
FROM customer
WHERE EXISTS (
  SELECT 1 FROM orders
  WHERE orders.customer_id = customer.customer_id
);
