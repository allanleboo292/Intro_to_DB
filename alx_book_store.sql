CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;
CREATE TABLE Books(
	book_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(130) NOT NULL,
	author_id INT,
	price DOUBLE NOT NULL,
	publication_date DATE,
	FOREIGN KEY (author_id) REFERENCE Authors(author_id) ON DELETE SET NULL
);
CREATE TABLE Authors(
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(215) NOT NULL
);
CREATE TABLE Customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(215) NOT NULL,
	email VARCHAR(215) NOT NULL,
	address TEXT
);
CREATE TABLE Orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE SET CASCADE,
	order_date DATE
);
CREATE TABLE Order_Details(
	orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE SET CASCADE,
	FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE SET CASCADE,
	quantity DOUBLE NOT NULL
);
