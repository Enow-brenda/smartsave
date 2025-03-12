-- Database: financial_app

CREATE DATABASE smartsave;
USE smartsave;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Savings Table
CREATE TABLE savings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    targetAmount DECIMAL(10,2) NOT NULL,
    goalname VARCHAR(255) NOT NULL,
    description TEXT,
    target_date DATE,
    status ENUM('active', 'completed') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Debts Table
CREATE TABLE debts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    debtName VARCHAR(255) NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    due_date DATE NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    status ENUM('active', 'paid','overdue') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE category(
    id INT PRIMARY AUTO_INCREMENT,
    name VARCHAR(200)
);
-- Expenses Table
CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    name TEXT,
    expense_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

CREATE TABLE notification(
    id INT PRIMARY AUTO_INCREMENT,
    name VARCHAR(200),
    description,
    type ENUM('reminder','alert','transaction','normal') DEFAULT 'normal'
);

-- Financial Learning Resources Table
CREATE TABLE financial_resources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    url VARCHAR(255),
    imageurl VARCHAR(255),
    type ENUM('article', 'video') NOT NULL,
    topic ENUM('saving', 'investment','budgeting') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions Table (for tracking user transactions)
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    saving_id INT NOT NULL,
    type ENUM('withdrawal', 'deposit') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    FOREIGN KEY (saving_id) REFERENCES savings(id) ON DELETE SET NULL
);
