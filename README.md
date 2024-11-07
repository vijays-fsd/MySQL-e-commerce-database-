# E-commerce Database System

This project sets up a basic e-commerce database using MySQL, including tables for customers, orders, products, and order items. 
The database is designed to support typical operations in an e-commerce system, such as managing customers, processing orders, and handling products.


## Project Overview

The e-commerce database consists of three main tables: `customers`, `orders`, and `products`. It also includes a normalized table, `order_items`, to store the items in each order. 
This structure allows the database to handle customer information, product catalog, and order processing.

### Key Features

- Store customer information (name, email, address)
- Store product details (name, price, description)
- Store order information (customer, order date, total amount)
- Handle multiple products per order through `order_items`
- Queries to retrieve customers, orders, and product details
- Additional functionality like updating product prices and normalizing data

## Database Structure

The database contains the following tables:

### `customers`
- `id`: Primary key, auto-incremented
- `name`: Customer's name
- `email`: Customer's email (unique)
- `address`: Customer's address

### `products`
- `id`: Primary key, auto-incremented
- `name`: Product's name
- `price`: Product's price (decimal)
- `description`: Product's description
- `discount`: Discount on the product (optional)

### `orders`
- `id`: Primary key, auto-incremented
- `customer_id`: Foreign key referencing `customers(id)`
- `order_date`: Date when the order was placed
- `total_amount`: Total amount for the order (calculated by the sum of product prices)

### `order_items`
- `id`: Primary key, auto-incremented
- `order_id`: Foreign key referencing `orders(id)`
- `product_id`: Foreign key referencing `products(id)`
- `quantity`: Quantity of the product in the order
- `price`: Price of the product at the time of purchase

## SQL Queries

Below are some of the key SQL queries used in this project:

1. **Retrieve all customers who have placed an order in the last 30 days:**
    ```sql
    SELECT customers.customer_name, customers.email
    FROM customers
    JOIN orders ON customers.id = orders.customer_id
    WHERE order_date >= CURDATE() - INTERVAL 30 DAY;
    ```

2. **Get the total amount of all orders placed by each customer:**
    ```sql
    SELECT customers.customer_name, SUM(orders.total_amount) AS total_spent
    FROM customers
    JOIN orders ON customers.id = orders.customer_id
    GROUP BY customers.customer_name;
    ```

3. **Update the price of Product C to 45.00:**
    ```sql
    UPDATE products
    SET products_price = 45.00
    WHERE id = 3;
    ```

4. **Add a new column `discount` to the products table:**
    ```sql
    ALTER TABLE products
    ADD discount DECIMAL(5, 2);
    ```

5. **Retrieve the top 3 products with the highest price:**
    ```sql
    SELECT products_name, products_price
    FROM products
    ORDER BY products_price DESC
    LIMIT 3;
    ```


