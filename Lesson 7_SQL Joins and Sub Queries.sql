-- Join helps to -> retrieve data from two or more database tables.
-- Note: The tables are mutually related using primary and foreign keys.
-- Note: tables start with the key column
-- types of joins
    -- 1. Inner join/ simple join/ equal join		-- 2. Left outer join
    -- 3. Right outer join							-- 4. Full join
    -- 5. Self join
    
CREATE DATABASE School_DB;
USE School_DB;

CREATE TABLE student(
	sid INT(5) PRIMARY KEY,
    sname VARCHAR(15), 
    address VARCHAR(15), 
    age INT(2));
    
CREATE TABLE course ( 
    course_id INT(5) PRIMARY KEY, 
    sid INT(5),
    FOREIGN KEY (sid) REFERENCES student(sid)
);

INSERT INTO student VALUES(1, "Majd", "UK", 8);
INSERT INTO student VALUES(2, "Amr", "US", 11);
INSERT INTO student VALUES(3, "Yousef", "Australia", 9);
INSERT INTO student VALUES(4, "Jamal", "Germany", 12);
INSERT INTO student VALUES(5, "Karam", "Turkey", 6);
INSERT INTO student VALUES(6, "Ahmed", "Japan", 10);
INSERT INTO student VALUES(7, "JO", "Japan", 16);

INSERT INTO course VALUES(1,1);
INSERT INTO course VALUES(2,2);
INSERT INTO course VALUES(3,3);
INSERT INTO course VALUES(4,null);
INSERT INTO course VALUES(5,null);
INSERT INTO course VALUES(6,5);

--  1. INNER JOIN
-- It helps in: 
	-- a. Combining records based on a related column. 
    -- b. Returning only matching rows from both tables and Excluding non. 
 
SELECT Course.COURSE_ID, Student.SNAME, Student.AGE 
FROM Student INNER JOIN Course ON Student.sid = Course.sid; -- results 4 rows (exists in child table)


-- 2.  LEFT OUTER JOIN/ LEFT JOIN
-- It helps in:
	-- Returning all records from the left table.
	-- Showing matching data from the right table.
	-- Displaying NULL values where no match exists in the right table.
    
SELECT Student.sNAME, Course.COURSE_ID 
FROM Student
LEFT JOIN Course 
ON Student.sid = Course.sid; -- all students roll a course/ don't.

-- 3. RIGHT OUTER JOIN/ RIGHT JOIN
-- It helps in:
	-- Returning all records from the right-side table.
    -- Showing matching data from the left-side table.
    -- Displaying NULL values where no match exists in the left table.
    
SELECT Student.sNAME, Course.COURSE_ID 
FROM Student
RIGHT JOIN Course 
ON Student.sid = Course.sid; -- all courses that are rolled/ not.

-- 4. FULL JOIN
-- SELECT Student.SNAME, Course.COURSE_ID FROM Student FULL JOIN Course ON Student.sid = Course.sid;
-- not directly supported in MySQL
-- You can achieve the same result by combining LEFT JOIN and RIGHT JOIN with the UNION operator. 
-- The UNION operator merges the results of two SELECT statements and removes duplicate rows.

-- 5. SELF JOIN
-- is a regular join, but the table is joined with itself or a different table.

SELECT S.SNAME, C.COURSE_ID 
FROM Student s, Course c WHERE s.sid = c.sid;



-- Sub query [nested query]

-- Query within a query, inner query & outer query.
-- The output of the inner query becomes the input of the outer query.
-- 2 Types of sub queries:
    -- 1) Single row sub query < = , > = , ! =
    -- 2) Multirow sub query [ IN, ANY, ALL ]
    
-- 1. single row
USE Classicmodels;
select max(amount) from payments; -- max: 120166.58
select max(amount) from payments where (select max(amount) from payments)>amount; -- 2nd max: 116208.40
select customerNumber from payments where (select max(amount) from payments) = amount; -- all cusomers that pay the highest amount

select customerNumber, count(*) as count from orders group by customerNumber; -- select all the customer number count of orders 
select max(count) from (select customerNumber, count(*) as count from orders group by customerNumber) as a; -- max count of orders 

-- 2. multi rows
Select productCode, productName from products where buyprice IN (select buyPrice from products where buyPrice != (select max(buyPrice) from products)) ;

-- ALL, ANY, & IN
 -- Allow you to perform a comparison between a single column value and a range of other values.

-- ANY 
-- returns a boolean value as a result
-- returns TRUE if ANY of the subquery values meet the condition
-- means that the condition will be true if the operation is true for any of the values in the range.

SELECT productName, buyPrice FROM products WHERE buyPrice > ANY (SELECT priceEach FROM orderdetails WHERE productCode = 'S10_1678'); 
-- statement above, buyprice > any (list)
-- Give me the products whose price is greater than (the smallest value) in the resulting list.

SELECT productName, buyPrice FROM products WHERE buyPrice < ANY (SELECT priceEach FROM orderdetails WHERE productCode = 'S10_1678');
-- statement below, buyprice < any (list)
-- Give me the products whose price is less than (the Greatest value) in the resulting list.

SELECT productName, buyPrice FROM products WHERE buyPrice = ANY (SELECT priceEach FROM orderdetails WHERE productCode = 'S10_1678');
-- statement below, buyprice = any (list)
-- same as IN

-- ALL 
-- returns a boolean value as a result
-- returns TRUE if ALL of the subquery values meet the condition
-- is used with SELECT, WHERE, and HAVING statements

SELECT productName, buyPrice FROM products WHERE buyPrice > ALL (SELECT priceEach FROM orderdetails WHERE productCode = 'S10_1678');
-- buyPrice > ALL (list)
-- Give me the products that are priced higher than (the highest value) on the list.
-- higher than all values of the list

SELECT productName, buyPrice FROM products WHERE buyPrice < ALL (SELECT priceEach FROM orderdetails WHERE productCode = 'S10_1678');
