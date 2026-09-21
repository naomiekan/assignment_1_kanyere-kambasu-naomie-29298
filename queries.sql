-- =====================================================
-- PLSQL ASSIGNMENT ONE - SUNRISE SUPERMARKET
-- Name: Kanyere Kambasu Naomie
-- Student ID: 29298
-- DBMS: Oracle Database 21c
-- =====================================================


-- =====================================================
-- JOIN 1
-- Every order with customer name, city, and order date
-- =====================================================

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date;


-- =====================================================
-- JOIN 2
-- Every order item with product name, category,
-- price, and quantity
-- =====================================================

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    p.category,
    p.price,
    oi.quantity
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_id, oi.order_item_id;


-- =====================================================
-- JOIN 3
-- All customers and their orders, including customers
-- who have no orders
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;


-- =====================================================
-- CTE
-- Customers whose total spending is above average
-- =====================================================

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend
FROM customer_spending
WHERE total_spend > (
    SELECT AVG(total_spend)
    FROM customer_spending
)
ORDER BY total_spend DESC;


-- =====================================================
-- WINDOW FUNCTION 1
-- Rank customers by total amount spent
-- =====================================================

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend,
    RANK() OVER (
        ORDER BY total_spend DESC
    ) AS spending_rank
FROM customer_spending
ORDER BY spending_rank;


-- =====================================================
-- WINDOW FUNCTION 2
-- Number each customer's orders in order placed
-- =====================================================

SELECT
    order_id,
    customer_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS order_number
FROM orders
ORDER BY customer_id, order_number;


-- =====================================================
-- WINDOW FUNCTION 3
-- Running total of revenue over time
-- =====================================================

WITH order_revenue AS (
    SELECT
        o.order_id,
        o.order_date,
        SUM(oi.quantity * p.price) AS order_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY
        o.order_id,
        o.order_date
)
SELECT
    order_id,
    order_date,
    order_revenue,
    SUM(order_revenue) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_revenue
FROM order_revenue
ORDER BY order_date, order_id;


-- =====================================================
-- WINDOW FUNCTION 4
-- Days between current and previous order
-- for customers with more than one order
-- =====================================================

WITH ordered_orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS previous_order_date,
        COUNT(*) OVER (
            PARTITION BY customer_id
        ) AS order_count
    FROM orders
)
SELECT
    order_id,
    customer_id,
    order_date,
    previous_order_date,
    order_date - previous_order_date AS days_since_previous
FROM ordered_orders
WHERE order_count > 1
  AND previous_order_date IS NOT NULL
ORDER BY customer_id, order_date;