CREATE DATABASE TuanShoes;
GO

USE TuanShoes;
GO

CREATE TABLE users (
    userId INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(100),
    fullName NVARCHAR(100),
	phone NVARCHAR(15), 
    address NVARCHAR(255),
    role NVARCHAR(50) NOT NULL 
);

CREATE TABLE category (
    categoryId INT PRIMARY KEY IDENTITY(1,1),
    categoryName NVARCHAR(100) NOT NULL
);

CREATE TABLE products (
    productId INT PRIMARY KEY IDENTITY(1,1),
    productName NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    size NVARCHAR(10) NOT NULL, 
    color NVARCHAR(50),        
    categoryId INT,
    FOREIGN KEY (categoryId) REFERENCES category(categoryId)
);

CREATE TABLE cart (
    cartId INT PRIMARY KEY IDENTITY(1,1),
    userId INT UNIQUE,
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE orders (
    orderId INT PRIMARY KEY IDENTITY(1,1),
    userId INT NOT NULL,
    orderDate DATETIME DEFAULT GETDATE(),
    totalPrice DECIMAL(10,2) NOT NULL,
    status NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE order_detail (
    orderDetailId INT PRIMARY KEY IDENTITY(1,1),
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

INSERT INTO category (categoryName) VALUES 
    ('Sneakers'), 
    ('Boots'), 
    ('Sandals');

INSERT INTO products (productName, price, quantity, size, color, categoryId)
VALUES 
    ('Nike Air Max', 120.00, 50, '42', 'White', 1),
    ('Adidas Ultraboost', 150.00, 30, '41', 'Black', 1),
    ('Timberland Classic', 200.00, 20, '43', 'Brown', 2),
    ('Birkenstock Arizona', 80.00, 100, '40', 'Beige', 3);

INSERT INTO users (username, password, email, fullName, phone, address, role)
VALUES 
    ('customer1', '12345', 'customer1@example.com', 'Customer One', '0123456789', 'Ho Chi Minh', 'customer'),
    ('admin', '12345', 'admin@example.com', 'Admin User', '0987654321', 'Ho Chi Minh', 'admin');

INSERT INTO cart (userId)
VALUES (1);

INSERT INTO orders (userId, totalPrice, status)
VALUES (1, 230.00, 'Completed');

INSERT INTO order_detail (orderId, productId, quantity, price, address)
VALUES 
    (1, 1, 1, 120.00, 'Ha Noi'),
    (1, 2, 1, 150.00, 'Ha Noi);
