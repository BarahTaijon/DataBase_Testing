-- How to Create & Drop a Database in three ways

-- 1) Using create/drop database
CREATE DATABASE IF NOT EXISTS mydatabase;
DROP DATABASE mydatabase;

-- 2) Using create/drop schema
CREATE SCHEMA mydatabase;
DROP SCHEMA mydatabase;

-- 3) Using creat/drop with IF NOT EXISTS keyword
CREATE DATABASE IF NOT EXISTS mydatabase;
DROP DATABASE IF EXISTS mydatabase; 

-- How to Create a Table in SQL
CREATE DATABASE mydatabase;
USE mydatabase;
create table student (id int(5), name varchar(15), Marks int(3));

describe student; -- Describe the Structure of Data in student tabl

-- How to insert into the table?

-- 1) INSERT INTO table_name VALUES();
INSERT INTO student VALUES (00001, "Jack", 80);
INSERT INTO student values (00002, 'SAM', 89);

-- 2)  INSERT INTO table_name (col1, col2, col3) VALUES();
INSERT INTO student(id,name) VALUES (00003, "Andro");
INSERT INTO student(name, marks, id) VALUES ("LALA", 91, 00004);

-- 3)  INSERT INTO table name VALUES (NULL);
INSERT INTO student VALUES (null,null,null);
INSERT INTO student VALUES (00005, "Dexter", null);

-- SELECT Rows FROM the tables
SELECT * FROM student;
SELECT marks FROM student;
SELECT name, marks+6 FROM student;

-- (WHERE) to Filter on row 
USE classicmodels;  
SELECT customerName FROM customers WHERE country = "USA";
SELECT orderNumber,priceEach FROM orderdetails WHERE priceEach > 100.0;
SELECT * FROM employees WHERE firstName = "Mary";
SELECT * FROM payments WHERE paymentDate is NULL; --  To find records with a NULL value (is NULL)
SELECT DISTINCT productCode FROM orderdetails; -- Remove repeatation (DISTINCT)

-- (AND, OR, NOT) IF you want to check more than one condition
SELECT * FROM orders WHERE orderDate = "2005-01-20" AND status = "shipped";
SELECT * FROM customers WHERE country = "Australia" OR country = "UK";
SELECT * FROM customers WHERE NOT (country = "Australia" OR country = "UK");

-- (BETWEEN, NOT BETWEEN) Used to display rows which is following/not the range of values
SELECT * FROM  products WHERE buyPrice BETWEEN 50 AND 100;
SELECT * FROM  products WHERE buyPrice NOT BETWEEN 50 AND 100;

-- (IN, NOT IN) Used to return the rows when the values are matching in the list.
SELECT * FROM  employees WHERE reportsTo IN (1002, 1143); -- Equal to -> SELECT * FROM  employees WHERE reportsTo = 1002 OR reportsTo = 1143 ;
SELECT * FROM  employees WHERE reportsTo NOT IN (1002, 1143); 

-- LIKE (% _),  % Many char,  _ Single char

SELECT * FROM employees WHERE firstName LIKE 'M%'; -- Finds values that start with "M"

SELECT * FROM employees WHERE firstName LIKE '%i'; -- Finds values that end with "i"

SELECT * FROM employees WHERE firstName LIKE '%m%'; -- Finds values that have "m" anywhere in the string

SELECT * FROM employees WHERE firstName LIKE '%r_';

SELECT * FROM employees WHERE firstName NOT LIKE '%S'; -- NOT LIKE

SELECT * FROM employees WHERE firstName LIKE '____'; -- first name is a 4 char