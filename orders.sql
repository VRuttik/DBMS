CREATE TABLE orders (
  order_id INT UNSIGNED PRIMARY KEY,
  user_id INT UNSIGNED,
  order_date DATE,
  total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, user_id, order_date, total_amount) VALUES
(1, 1, '2023-01-15', 100.00),
(2, 2, '2023-02-20', 75.50),
(3, 3, '2023-03-10', 200.00),
(4, 1, '2023-04-05', 50.00),
(5, 4, '2023-05-12', 120.00);

-- Retrieve users and their orders
SELECT users.name, orders.order_date
FROM users
INNER JOIN orders ON users.id = orders.user_id;

-- Retrieve all users and their orders (including users without orders)
SELECT users.name, orders.order_date
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

-- Retrieve all orders and their associated users (including orders without users)
SELECT orders.order_date, users.name
FROM orders
RIGHT JOIN users ON orders.user_id = users.id;

-- Retrieve all users and their orders (including users without orders and orders without users)
SELECT users.name, orders.order_date
FROM users
FULL JOIN orders ON users.id = orders.user_id;

