# PLSQL Assignment One — Sunrise Supermarket

## Student Information

**Name:** Kanyere Kambasu Naomie
**Student ID:** 29298
**DBMS:** Oracle Database 21c
**Oracle Username:** KANYEREKAMBASU29298

## 1. Project Summary

This project is a database system for Sunrise Supermarket. It stores information about customers, products, orders, and order items.

The project demonstrates the use of SQL JOINs, a Common Table Expression (CTE), and window functions to analyze supermarket sales data.

The database contains:

* 6 customers
* 10 products
* 15 orders
* 30 order items
* 5 product categories

## 2. Business Scenario

Sunrise Supermarket needs a database to manage customer orders and product sales.

The database helps the supermarket:

* Store customer information
* Store product information
* Record customer orders
* Record products purchased in each order
* Calculate customer spending
* Identify high-spending customers
* Analyze customer ordering behavior
* Track revenue over time

## 3. Database Tables

The project contains four main tables:

### Customers

Stores information about supermarket customers.

Important columns:

* `customer_id`
* `customer_name`
* `email`
* `city`

### Products

Stores information about products sold by the supermarket.

Important columns:

* `product_id`
* `product_name`
* `category`
* `price`

### Orders

Stores customer orders.

Important columns:

* `order_id`
* `customer_id`
* `order_date`

### Order Items

Stores the products included in each order.

Important columns:

* `order_item_id`
* `order_id`
* `product_id`
* `quantity`

## 4. Relationships Between Tables

The tables are connected using primary keys and foreign keys.

* One customer can have many orders.
* One order can contain many order items.
* One product can appear in many order items.

The relationship is:

`Customers → Orders → Order Items → Products`

## 5. How to Run the Project

1. Install Oracle Database 21c.
2. Open Oracle SQL Developer.
3. Connect using the Oracle user `KANYEREKAMBASU29298`.
4. Run `schema.sql` to create the tables.
5. Run `data.sql` to insert the customers, products, orders, and order items.
6. Run `queries.sql` to execute the required JOIN, CTE, and window-function queries.
7. Review the results and screenshots.

## 6. JOIN Queries

### JOIN 1 — Orders and Customers

This query uses an INNER JOIN to connect the `orders` and `customers` tables using `customer_id`.

It displays the order ID, customer name, city, and order date.

**Business interpretation:**
The supermarket can use this information to know which customer placed each order and where the customer is located.


**Screenshot:**

![JOIN 1 Result](./screenshots/join1_orders_customers.png)

### JOIN 2 — Order Items and Products

This query connects the `order_items` and `products` tables using `product_id`.

It displays the product name, category, price, and quantity.

**Business interpretation:**
The supermarket can see which products were purchased, the quantity purchased, and the price and category of each product.
**Screenshot:**
![JOIN 2 Result](./screenshots/join2_order_items_products.png)

### JOIN 3 — Customers and Orders Using LEFT JOIN

This query uses a LEFT JOIN to display all customers, including customers who have not placed an order.

Alice Ingabire is included even though she has no order. Her order information appears as NULL.

**Business interpretation:**
The supermarket can identify customers who have not placed orders and may use this information for customer follow-up or promotional activities.

**Screenshot:**
![JOIN 3 Result](./screenshots/join3_left_join.png)

## 7. CTE Query — Customers Above Average Spending

The CTE first calculates the total spending for each customer.

The total spending is calculated using:

`quantity × price`

The main query then calculates the average spending and returns customers whose spending is above the average.

**Business interpretation:**
The supermarket can identify high-spending customers and use this information for loyalty programs or targeted promotions.

**Screenshot:**

![CTE Result](./screenshots/cte_above_average.png)

## 8. Window Functions

### Window Function 1 — Customer Spending Ranking

The `RANK()` function ranks customers according to their total spending, with the highest spending first.

**Business interpretation:**
The supermarket can identify customers who contribute the most revenue.

**Screenshot:**

![Window Function 1 Result](./screenshots/window1_customer_ranking.png)

### Window Function 2 — Number of Orders per Customer

The `ROW_NUMBER()` function numbers each customer's orders according to the order date.

`PARTITION BY customer_id` makes the numbering restart for each customer.

**Business interpretation:**
The supermarket can understand the sequence of purchases made by each customer.

**Screenshot:**
![Window Function 2 Result](./screenshots/window2_order_number.png)

### Window Function 3 — Running Revenue

This query calculates the revenue of each order and then uses a window function to calculate the running total of revenue over time.

**Business interpretation:**
The supermarket can monitor how total revenue increases over the selected period.

**Screenshot:**

![Window Function 3 Result](./screenshots/window3_running_revenue.png)

### Window Function 4 — Days Between Orders

The `LAG()` function finds the previous order date for each customer.

The query then calculates the number of days between the current order and the previous order.

Only customers with more than one order are included.

**Business interpretation:**
The supermarket can understand how frequently customers return and place new orders.

**Screenshot:**
![Window Function 4 Result](./screenshots/window4_days_between_orders.png)

## 9. Challenges and Solutions

### Challenge 1 — Oracle Tablespace Privilege

During the project, an `ORA-01950` error occurred because the database user did not have enough quota on the `USERS` tablespace.

The problem was solved by connecting as the `SYSTEM` user and granting the required quota:

```sql
ALTER USER KANYEREKAMBASU29298 QUOTA UNLIMITED ON USERS;
```

After this, the tables and data could be created successfully.

### Challenge 2 — Understanding JOINs

JOINs were initially difficult because information was stored in different tables.

The problem was solved by understanding the relationships between primary keys and foreign keys and using the appropriate JOIN condition.

## 10. Conclusion

This project demonstrates how Oracle SQL can be used to manage and analyze supermarket data.

The project uses INNER JOIN, LEFT JOIN, a Common Table Expression (CTE), and window functions to answer business questions about customers, products, orders, spending, and revenue.
