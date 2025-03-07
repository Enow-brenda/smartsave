// Financial Education 

CREATE TABLE lessons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lesson_id INT,
    question TEXT NOT NULL,
    options JSON NOT NULL,
    correct_answer VARCHAR(255) NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
);

CREATE TABLE user_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    lesson_id INT,
    score INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(id)
);

CREATE TABLE savings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    goal_name VARCHAR(255),
    target_amount DECIMAL(10,2),
    saved_amount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category VARCHAR(255),
    amount DECIMAL(10,2),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE debts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    interest_rate DECIMAL(5,2),
    duration INT,  -- in months
    monthly_payment DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

