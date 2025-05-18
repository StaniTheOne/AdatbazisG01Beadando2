-- Adatbázis létrehozása
CREATE DATABASE car_tracker;
USE car_tracker;

-- 1. Táblázat: cars
CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    is_sold BOOLEAN DEFAULT FALSE
);

-- 2. Táblázat: customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- 3. Táblázat: salespersons
CREATE TABLE salespersons (
    salesperson_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    level INT CHECK (level BETWEEN 1 AND 5)
);

-- 4. Táblázat: sales
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    customer_id INT NOT NULL,
    salesperson_id INT NOT NULL,
    sale_date DATE NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (car_id) REFERENCES cars(car_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES salespersons(salesperson_id)
);

-- 5. Táblázat: service
CREATE TABLE service (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    service_date DATE NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);