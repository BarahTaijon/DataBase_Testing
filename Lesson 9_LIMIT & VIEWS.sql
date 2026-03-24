-- LIMIT & VIEWS

USE classicmodels;

-- LIMIT: clause is used to limit the number of records to return.
-- OFFSET: skip # of records

select * from customers;
select * from customers where country = 'USA'; 
SELECT * from customers where country = 'USA' LIMIT 3;  -- Limit the number of rows returned to 3
SELECT * from customers where country = 'USA' LIMIT 3 OFFSET 6; -- -- Limit the number of rows returned to 3, starting from the 6th row 

select * from payments;
select * from payments order by amount desc;
select * from payments order by amount desc limit 4; -- First 4 max amounts payments

select * from customers;
select * from customers where creditLimit>500.0 LIMIT 5,9; -- Range limit

-- VIEW: is a virtual table created from the result of a SELECT query. 
		-- Doesn't store data physically but displays data stored in underlying tables.
CREATE VIEW Order_Details_View AS
SELECT Customers.CustomerName, orders.orderNumber, orders.Status
FROM Customers
JOIN Orders ON Customers.customerNumber = orders.customerNumber;

SELECT * FROM Order_Details_View;

CREATE VIEW Products_Details_View AS
SELECT p.productName, p.quantityInStock, pl.productLine
FROM products p
JOIN productlines pl ON pl.productLine = p.productLine;

SELECT * FROM Products_Details_View order by quantityInStock;
