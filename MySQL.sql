-- creating database
CREATE DATABASE ecommerce

-- using  database
use ecommerce

-- creating table for customers
CREATE TABLE customers (id INT(20) NOT NULL auto_increment, customer_name VARCHAR(20) NOT NULL, email VARCHAR(30) NOT NULL, address VARCHAR(100) NOT NULL, PRIMARY KEY (`id`))ENGINE = InnoDB

-- creating table for orders
CREATE TABLE orders (id INT(20) NOT NULL auto_increment, customer_id INT(50) NOT NULL, order_date DATE NOT NULL, total_amount DECIMAL(10,2) NOT NULL, PRIMARY KEY (`id`), FOREIGN KEY (`customer_id`) REFERENCES customers(`id`))ENGINE = InnoDB

-- creating table for products
CREATE TABLE products (id INT(20) NOT NULL auto_increment, products_name VARCHAR(100) NOT NULL, products_price DECIMAL(20,2) NOT NULL, products_description TEXT NOT NULL, PRIMARY KEY (`id`))ENGINE = InnoDB

-- inserting values into customers table
INSERT INTO customers (customer_name, email, address)
VALUES ('Azhagu', 'azhagu@example.com', 'Theni'),('Visakar', 'visakar@example.com', 'Chennai'),('Sankar', 'sankar@example.com', 'Chennai')

-- inserting values into orders table
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1, '2024-10-01', 55.00),(2, '2024-10-15', 30.00),(3, '2024-10-31', 40.00)

-- inserting  values into products table
INSERT INTO products (id, products_name, products_price, products_description)
VALUES (NULL, 'Product A', 25.00, 'Description of Product A'),( NUll, 'Product B', 30.00, 'Description of Product B'),(NULL, 'Product C', 40.00, 'Description of Product C')

-- *** QUERIES TO WRITE ***

-- 1. retrieved all customers who placed an order in the last 30 days
SELECT customers.customer_name, customers.email FROM customers JOIN orders ON customers.id = orders.customer_id WHERE orders.order_date >= CURDATE() - INTERVAL 30 DAY

-- 2. retrieved the total amount of orders for each customer
SELECT customers.customer_name, SUM(orders.total_amount) AS total_spent FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.customer_name

-- 3. updating values in products table (Update the price of Product C to 45.00)
UPDATE products SET products_price = "45.00" WHERE id = 3

-- 4. altering table to add discount column (Add a new column discount to the products table)
ALTER TABLE products ADD discount DECIMAL(5, 2) NOT NULL 

-- 5. retrieved the top 3 products with the highest price.
SELECT products_name, products_price FROM products ORDER BY products_price DESC LIMIT 3

-- 6. retrieved customer names who ordered 'Product A'
SELECT customers.customer_name FROM customers JOIN orders ON customers.id = orders.customer_id JOIN order_items ON orders.id = order_items.order_id JOIN products ON order_items.product_id = products.id WHERE products.products_name = 'Product A'

-- 7. retrieved customer names and their respective order dates
SELECT customers.customer_name, orders.order_date FROM customers JOIN orders ON customers.id = orders.customer_id

-- 8. retrieved the orders with a total amount greater than 150.00
SELECT * FROM orders WHERE total_amount > 150.00

-- 9. Create an 'order_items' table to normalize the database
CREATE TABLE order_items (id INT(50) auto_increment PRIMARY KEY, order_id INT(50), product_id INT(200), quantity INT(100), price DECIMAL(10, 2),FOREIGN KEY (`order_id`) REFERENCES orders(`id`), FOREIGN KEY (`product_id`) REFERENCES products(`id`))ENGINE = InnoDB

-- Update the 'orders' table to remove product information, since it's moved to 'order_items'
ALTER TABLE orders DROP COLUMN total_amount

-- 10. retrieved the average total of all orders.
SELECT AVG(total_amount) AS average_order_total FROM orders





