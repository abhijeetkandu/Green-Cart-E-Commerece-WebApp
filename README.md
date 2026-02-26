⚙️ Project Configuration
🖥 Requirements

Java JDK 17 or above

Apache Tomcat 10+

MySQL 8+

Maven (if using)

🗄 Database Configuration

Create database:

CREATE DATABASE ecommerce_db;

Create tables:

CREATE TABLE register (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(20)
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DOUBLE,
    quantity INT
);

CREATE TABLE product_images (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
🔌 Database Connection (Important)

In DbConnection.java update:

private static final String URL = "jdbc:mysql://localhost:3306/ecommerce_db";
private static final String USER = "your_mysql_username";
private static final String PASSWORD = "your_mysql_password";
