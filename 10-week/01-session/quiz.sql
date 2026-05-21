/*
*	customer { id, first_name, last_name, email, phone, address, created_at, *	state }
*	product { id, name, description, price, stock, category, created_at, state }
*	invoice { id, customer_id, total_amount, status, created_at }
*	invoice_detail { id, invoice_id, product_id, quantity, unit_price, subtotal }
*/

-- SQL
-- DDL -> Estructura
DROP DATABASE IF EXISTS quiz_corte2;
CREATE DATABASE quiz_corte2;

USE quiz_corte2;

-- Crear tablas
CREATE TABLE customer(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	phone VARCHAR(30) NOT NULL, 
	address VARCHAR(30) NOT NULL, 
	created_at DATE, 
	state BIT
);

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(30) NOT NULL, 
	description VARCHAR(100), 
	price DECIMAL(5,2), 
	stock INT, 
	category VARCHAR(30) NOT NULL, 
	created_at DATE, 
	state BIT
);

CREATE TABLE invoice(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	total_amount DECIMAL(5,2), 
	status BIT, 
	created_at DATE,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE invoice_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
	quantity DECIMAL(5,2),
	unit_price DECIMAL(5,2),
	subtotal DECIMAL(5,2),
	invoice_id INT,
	product_id INT,
	FOREIGN KEY (invoice_id) REFERENCES invoice(id),
	FOREIGN KEY (product_id) REFERENCES product(id)
);

-- DML
/*
*	INSERT: insertar un cliente con first_name, last_name, email, phone y address
*	DELETE: eliminar un invoice_detail por id
*	SELECT: consultar todos los productos con name, price y stock
*	Consulta básica: consultar productos donde price sea mayor a un valor específico
*	JOIN: consultar facturas con información del cliente usando customer_id
*/
INSERT INTO customer(
	first_name, 
	last_name, 
	email, 
	phone, 
	address
)VALUES(
	'Pedro',
	'Pablo',
	'32123213',
	'pedroq@gmail.com',
	'Calle 11'
);

DELETE FROM invoice_detail WHERE id = 1;
-- DELETE FROM customer WHERE id = 1;

SELECT name, price, stock FROM product;

SELECT * FROM product WHERE price>0;

SELECT 
	* 
FROM
	invoice i
	INNER JOIN customer c ON i.customer_id = c.id
WHERE i.customer_id = 2;