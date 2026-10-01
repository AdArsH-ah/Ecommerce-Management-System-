create database ecommercee;
use ecommercee;
create table customer(
    customer_id INT PRIMARY KEY,
    customer_name varchar(255),
    city varchar(100),
    state varchar(100),
    emailid varchar(100),
    phone INT(100)  
);
select*from customer;
INSERT INTO customer (customer_id, customer_name, city, state, emailid, phone)
VALUES
(1, 'Adarsh', 'Belagavi', 'Karnataka', 'adarsh@gmail.com', 9876543210),
(2, 'Rahul', 'Bengaluru', 'Karnataka', 'rahul@gmail.com', 9876543211),
(3, 'Priya', 'Mysuru', 'Karnataka', 'priya@gmail.com', 9876543212),
(4, 'Sneha', 'Mumbai', 'Maharashtra', 'sneha@gmail.com', 9876543213),
(5, 'Amit', 'Pune', 'Maharashtra', 'amit@gmail.com', 9876543214),
(6, 'Rohit', 'Delhi', 'Delhi', 'rohit@gmail.com', 9876543215),
(7, 'Anjali', 'Chennai', 'Tamil Nadu', 'anjali@gmail.com', 9876543216),
(8, 'Kiran', 'Hyderabad', 'Telangana', 'kiran@gmail.com', 9876543217),
(9, 'Pooja', 'Mangaluru', 'Karnataka', 'pooja@gmail.com', 9876543218),
(10, 'Vikram', 'Kolkata', 'West Bengal', 'vikram@gmail.com', 9876543219),
(11, 'Neha', 'Jaipur', 'Rajasthan', 'neha@gmail.com', 9876543220),
(12, 'Arjun', 'Ahmedabad', 'Gujarat', 'arjun@gmail.com', 9876543221),
(13, 'Divya', 'Hubballi', 'Karnataka', 'divya@gmail.com', 9876543222),
(14, 'Manoj', 'Lucknow', 'Uttar Pradesh', 'manoj@gmail.com', 9876543223),
(15, 'Kavya', 'Kochi', 'Kerala', 'kavya@gmail.com', 9876543224);
ALTER TABLE customer
MODIFY phone VARCHAR(15);
select*from customer;
 SELECT * FROM customer
 WHERE city IN ('Mumbai');
 SELECT * FROM customer
 WHERE customer_id between 1 and 10;
 SELECT * FROM customer
 WHERE customer_id >5 or customer_id = 5;
 select * from customer
 where customer_name like 'A%';
 SELECT DISTINCT city FROM customer;
 select count(*) from customer;
 select customer_name,customer_id from customer;
create table products(
    product_id int primary key,
    product_name varchar(50),
    category varchar(50),
    price decimal(12,4),
    stock int
);


INSERT INTO products (product_id, product_name, category, price, stock)
VALUES
(1, 'Smartwatch', 'Electronics', 3500.0000, 20),
(2, 'Tablet', 'Electronics', 18000.0000, 15),
(3, 'Bluetooth Speaker', 'Electronics', 2500.0000, 30),

(4, 'Shoes', 'Clothing', 1800.0000, 40),
(5, 'Hoodie', 'Clothing', 1200.0000, 35),
(6, 'Cap', 'Clothing', 400.0000, 50),

(7, 'Dining Table', 'Furniture', 8500.0000, 10),
(8, 'Office Chair', 'Furniture', 4500.0000, 15),
(9, 'Wardrobe', 'Furniture', 12000.0000, 8),

(10, 'Milk', 'Grocery', 60.0000, 100),
(11, 'Bread', 'Grocery', 40.0000, 80),
(12, 'Cooking Oil', 'Grocery', 180.0000, 60),

(13, 'Eraser', 'Stationery', 10.0000, 200),
(14, 'Marker', 'Stationery', 50.0000, 100),
(15, 'Calculator', 'Stationery', 350.0000, 25);

SELECT * FROM products;

select * from products;
select max(price) from products;
select min(price) from products;
select avg(price) from products;
select max(stock) from products;
select min(stock) from products;
select avg(stock) from products;


SELECT * FROM products
ORDER BY price ASC;

SELECT * FROM products
ORDER BY price DESC;

SELECT DISTINCT product_name FROM products;

SELECT * FROM products
where product_name in  ('Marker');

SELECT product_name , COUNT(*)
FROM products
GROUP BY product_name;
 

SELECT price, AVG(price)
FROM products
GROUP BY price
HAVING AVG(price) > 100;

select * from products where price between 100 and 380000;

create table orders(
    order_id int primary key,
    customer_id int,
    order_data DATE,
    order_status varchar(30),
    Foreign key(customer_id) references customer(customer_id)
);
select * from orders;
INSERT INTO orders (order_id, customer_id, order_data, order_status)
VALUES
(1, 1, '2026-01-10', 'Delivered'),
(2, 2, '2026-01-12', 'Pending'),
(3, 3, '2026-01-15', 'Shipped'),
(4, 4, '2026-01-18', 'Delivered'),
(5, 5, '2026-01-20', 'Cancelled'),
(6, 6, '2026-01-22', 'Pending'),
(7, 7, '2026-01-25', 'Delivered'),
(8, 8, '2026-02-01', 'Shipped'),
(9, 9, '2026-02-05', 'Delivered'),
(10, 10, '2026-02-08', 'Pending'),
(11, 1, '2026-02-10', 'Shipped'),
(12, 2, '2026-02-12', 'Delivered'),
(13, 3, '2026-02-15', 'Cancelled'),
(14, 4, '2026-02-18', 'Pending'),
(15, 5, '2026-02-20', 'Delivered');
select * from orders;

select order_status from orders;
select * from orders
where order_status in ('Pending');
select * from orders
where order_data between '2026-01-10' and '2026-02-10' ;

select * from orders
where order_status = ('cancelled');

-- select customer_id, COUNT(*) as total_orders
-- FROM orders
-- GROUP BY customer_id
-- HAVING COUNT(*) > 1;

create table order_items(
    order_items_id int primary key,
    order_id int references orders(order_id),
    product_id int references product(product_id)
);
INSERT INTO order_items (order_items_id, order_id, product_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 1),
(6, 3, 5),
(7, 4, 2),
(8, 4, 3),
(9, 5, 4),
(10, 5, 6),
(11, 6, 1),
(12, 7, 5),
(13, 8, 3),
(14, 9, 2),
(15, 10, 6);
select * from order_items;

create table payments(
    payment_id int primary key,
    order_id int,
    payment_method varchar(100),
    payment_amount decimal(10,2),
    payment_status varchar(200),
    Foreign key(order_id)references orders(order_id)
);
INSERT INTO payments
(payment_id, order_id, payment_method, payment_amount, payment_status)
VALUES
(1, 1, 'UPI', 55000.00, 'Completed'),
(2, 2, 'Credit Card', 20000.00, 'Completed'),
(3, 3, 'Debit Card', 1500.00, 'Pending'),
(4, 4, 'Cash', 2500.00, 'Completed'),
(5, 5, 'UPI', 35000.00, 'Completed'),
(6, 6, 'Net Banking', 45000.00, 'Pending'),
(7, 7, 'Credit Card', 1200.00, 'Completed'),
(8, 8, 'UPI', 3000.00, 'Failed'),
(9, 9, 'Debit Card', 15000.00, 'Completed'),
(10, 10, 'Cash', 5000.00, 'Completed'),
(11, 11, 'UPI', 8000.00, 'Completed'),
(12, 12, 'Credit Card', 25000.00, 'Pending'),
(13, 13, 'Net Banking', 12000.00, 'Completed'),
(14, 14, 'UPI', 1800.00, 'Failed'),
(15, 15, 'Debit Card', 6000.00, 'Completed');

select*from payments; 

SELECT *
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id;
SELECT *
FROM customer
JOIN orders
ON customer.customer_id = orders.customer_id;

SELECT
    c.customer_id,
    o.order_id,
    o.order_data,
    o.order_status
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_data,
    o.order_status,
    p.product_id,
    p.product_name,
    p.price
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN product p
    ON oi.product_id = p.product_id;









