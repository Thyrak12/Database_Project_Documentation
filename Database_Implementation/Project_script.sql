CREATE DATABASE IF NOT EXISTS db_project;
CREATE TABLE IF NOT EXISTS User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255),
    role ENUM('admin', 'staff', 'customer'),
    created_at DATETIME
);

CREATE TABLE IF NOT EXISTS Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    category VARCHAR(50),
    created_at DATETIME
);

CREATE TABLE IF NOT EXISTS Product_Variant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color VARCHAR(50),
    size VARCHAR(50),
    price DECIMAL(10, 2),
    stock_qty INT,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE IF NOT EXISTS Sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    status ENUM('pending', 'completed', 'cancelled'),
    total_price DECIMAL(10, 2),
    create_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE IF NOT EXISTS Sales_Record (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    variant_id INT,
    qty INT,
    price_each DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(id),
    FOREIGN KEY (variant_id) REFERENCES Product_Variant(id)
);

CREATE TABLE IF NOT EXISTS Stock_Transaction (
    id INT PRIMARY KEY AUTO_INCREMENT,
    variant_id INT,
    qty INT,
    type ENUM('in', 'out'),
    created_at DATETIME,
    FOREIGN KEY (variant_id) REFERENCES Product_Variant(id)
);
