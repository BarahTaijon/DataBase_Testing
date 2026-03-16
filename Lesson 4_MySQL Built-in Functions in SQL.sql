-- Functions - Pass Or/And Return values
-- Built-in Functions: 1. String Fun 2. Numeric Fun 3. Date Fun 4. Aggregate Fun

USE classicmodels;

-- String Functions: 1. Upper()  2. Lower()  3. Length()  4. Trim()  5. INSTR()  6. Substr/Substring()  7. Concat()   

-- 1. Upper()
SELECT upper(customerName) FROM customers WHERE Country = "USA";
SELECT upper(city) FROM customers WHERE creditLimit between 60000.00 AND 80000.00;
SELECT upper("sql");

-- 2. Lower()
SELECT city, lower(addressLine1), lower(addressLine2) FROM offices WHERE city IN ("Paris", "London");
SELECT lower("ORACLE");

-- 3. Length()
SELECT country, length(phone) FROM offices;
SELECT  productName, length(productDescription) FROM products;
SELECT length("length() is a built-in function") AS length;

-- 4. Trim()
SELECT TRIM('z' from 'zzoraclezz') AS Trim;

-- 5. INSTR()
-- v1: INSTR(string, substring)
-- v2: INSTR(string, substring, [start_position], [nth_occurrence])
-- p.s v2 is unsupported in mysql

SELECT INSTR('This is a playlist', 'is');
-- SELECT INSTR('This is a playlist', 'is', 1,2);
-- SELECT INSTR('This is a playlist','is',1,3);

-- 6. Substr/Substring() 
SELECT substr(productCode, 1, 3) from products where buyPrice<50.00;
SELECT substr('ORACLE', 2,3);

-- 7. Concat()
select concat(firstName, ' ' ,lastName) as full_Name from employees where jobTitle = "Sales Rep" And reportsTo =1088 ;


-- Numeric Functions: 1. ABS()  2. SQRT()  3. MOD()  4. POWER()  5. TRUNCATE()  6.GREATEST() & LEAST()

-- 1. ABS()
SELECT ABS(-40);

-- 2. SQRT()
select sqrt(amount)+amount as  amount_with_Tax from payments where customerNumber = 201;
select sqrt(16);

--   3. MOD()
select  productName, Mod(quantityInStock,2)+100 as quantityInStock_after_occasion from products where productLine Like "M%";
select  productName from products where Mod(quantityInStock,2) = 0;
SELECT MOD(10,3);

--   4. POWER
select productName, productLine, power(quantityInStock,2) as After_rise_Price from products where power(quantityInStock,2) <=  2000;
SELECT power(2,5);

--   5. TRUNCATE()
select truncate(priceEach,0) as price from orderdetails;
select truncate(45.1234, 3); -- keep 3 digits after decimal
select truncate(1234, -2); -- last 2 digits became 0

--   6.GREATEST(col1, col2) & LEAST(col1, col2) -- at the same row
SELECT GREATEST(12,55,77);
SELECT LEAST(12,55,77);

-- Date Functions: 1. CURDATE()/CURRENT_DATE()  2. CURTIME()/CURRENT_TIME()  3. NOW()  4. SYSDATE()  5. MONTH()  6. YEAR()  7. DAY()  

-- 1. CURDATE()/CURRENT_DATE()  2. CURTIME()/CURRENT_TIME()
select CURDATE() as Today_Date, CURTIME() as Time_now;

-- 3. NOW()  4. SYSDATE() -> date & time now/system
select NOW() as timeDate_in_now, SYSDATE() as timeDate_in_system;

-- 5. MONTH()  6. YEAR()  7. DAY()  
SELECT DAY(CURDATE()) as today, MONTH(CURDATE()) as the_Month, YEAR(CURDATE()) as the_Year;

-- Aggregate Functions: 1. MAX()  2. MIN()  3. AVG()  4. COUNT()  5. SUM()
select * from  payments;
select * from  products;
select * from  productlines;
select * from  orders;
select * from  orderdetails;

-- 1. MAX()  2. MIN()  3. AVG()
select MAX(quantityInStock) as max_quantityInStock, Min(quantityInStock) as min_quantityInStock, AVG(quantityInStock) as AVG_quantityInStock  from products;

-- 4. COUNT()
select COUNT(quantityInStock) as Count_quantityInStock from products;

-- 5. SUM()
select SUM(quantityInStock) as sum_quantityInStock from products;


