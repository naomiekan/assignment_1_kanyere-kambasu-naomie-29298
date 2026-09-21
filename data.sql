INSERT INTO customers
VALUES (1, 'Naomie Kambasu', 'naomie@gmail.com', 'Kigali');

INSERT INTO customers
VALUES (2, 'Sarah Mukamana', 'sarah@gmail.com', 'Kigali');

INSERT INTO customers
VALUES (3, 'David Niyonzima', 'david@gmail.com', 'Huye');

INSERT INTO customers
VALUES (4, 'Grace Uwase', 'grace@gmail.com', 'Musanze');

INSERT INTO customers
VALUES (5, 'John Habimana', 'john@gmail.com', 'Rubavu');

INSERT INTO customers
VALUES (6, 'Alice Ingabire', 'alice@gmail.com', 'Kigali');

-- Products

INSERT INTO products VALUES (1, 'Milk', 'Dairy', 1500);
INSERT INTO products VALUES (2, 'Cheese', 'Dairy', 3500);
INSERT INTO products VALUES (3, 'Bread', 'Bakery', 1200);
INSERT INTO products VALUES (4, 'Rice', 'Grains', 5000);
INSERT INTO products VALUES (5, 'Sugar', 'Grains', 1800);
INSERT INTO products VALUES (6, 'Chicken', 'Meat', 6500);
INSERT INTO products VALUES (7, 'Beef', 'Meat', 7500);
INSERT INTO products VALUES (8, 'Orange Juice', 'Beverages', 2500);
INSERT INTO products VALUES (9, 'Coffee', 'Beverages', 3000);
INSERT INTO products VALUES (10, 'Yogurt', 'Dairy', 2000);


-- Orders

INSERT INTO orders VALUES (1001, 1, DATE '2026-09-01');
INSERT INTO orders VALUES (1002, 2, DATE '2026-09-02');
INSERT INTO orders VALUES (1003, 3, DATE '2026-09-03');
INSERT INTO orders VALUES (1004, 1, DATE '2026-09-05');
INSERT INTO orders VALUES (1005, 4, DATE '2026-09-06');
INSERT INTO orders VALUES (1006, 2, DATE '2026-09-07');
INSERT INTO orders VALUES (1007, 5, DATE '2026-09-08');
INSERT INTO orders VALUES (1008, 3, DATE '2026-09-10');
INSERT INTO orders VALUES (1009, 1, DATE '2026-09-12');
INSERT INTO orders VALUES (1010, 4, DATE '2026-09-13');
INSERT INTO orders VALUES (1011, 2, DATE '2026-09-15');
INSERT INTO orders VALUES (1012, 5, DATE '2026-09-16');
INSERT INTO orders VALUES (1013, 3, DATE '2026-09-18');
INSERT INTO orders VALUES (1014, 1, DATE '2026-09-20');
INSERT INTO orders VALUES (1015, 4, DATE '2026-09-21');


-- Order Items

INSERT INTO order_items VALUES (1, 1001, 1, 2);
INSERT INTO order_items VALUES (2, 1001, 3, 1);
INSERT INTO order_items VALUES (3, 1002, 4, 2);
INSERT INTO order_items VALUES (4, 1002, 5, 1);
INSERT INTO order_items VALUES (5, 1003, 6, 1);
INSERT INTO order_items VALUES (6, 1003, 8, 2);
INSERT INTO order_items VALUES (7, 1004, 2, 1);
INSERT INTO order_items VALUES (8, 1004, 9, 2);
INSERT INTO order_items VALUES (9, 1005, 7, 1);
INSERT INTO order_items VALUES (10, 1005, 3, 2);
INSERT INTO order_items VALUES (11, 1006, 1, 3);
INSERT INTO order_items VALUES (12, 1006, 10, 2);
INSERT INTO order_items VALUES (13, 1007, 4, 1);
INSERT INTO order_items VALUES (14, 1007, 6, 2);
INSERT INTO order_items VALUES (15, 1008, 5, 2);
INSERT INTO order_items VALUES (16, 1008, 8, 1);
INSERT INTO order_items VALUES (17, 1009, 9, 1);
INSERT INTO order_items VALUES (18, 1009, 2, 2);
INSERT INTO order_items VALUES (19, 1010, 3, 3);
INSERT INTO order_items VALUES (20, 1010, 7, 1);
INSERT INTO order_items VALUES (21, 1011, 1, 2);
INSERT INTO order_items VALUES (22, 1011, 4, 1);
INSERT INTO order_items VALUES (23, 1012, 6, 1);
INSERT INTO order_items VALUES (24, 1012, 10, 3);
INSERT INTO order_items VALUES (25, 1013, 8, 2);
INSERT INTO order_items VALUES (26, 1013, 5, 1);
INSERT INTO order_items VALUES (27, 1014, 9, 2);
INSERT INTO order_items VALUES (28, 1014, 3, 1);
INSERT INTO order_items VALUES (29, 1015, 2, 1);
INSERT INTO order_items VALUES (30, 1015, 7, 2);

COMMIT;
