-- (Data Definition Language) Commands

-- 1) CREATE
USE mydatabase;
CREATE TABLE employee (eid int(5), ename varchar(20));
INSERT INTO employee values (01, "Mariam");
INSERT INTO employee values (02, "Ali");
INSERT INTO employee values (03, "Omar");

SELECT * FROM employee;

-- 2) ALTER
-- 2.1) ADD [column]
ALTER TABLE employee ADD salary int(3);
ALTER TABLE employee ADD email varchar(15);

SELECT * FROM employee;

UPDATE employee
SET salary = 600, email = "ABD@gmail.com"
WHERE eid = 1;

UPDATE employee
SET salary = 700, email = "xyz@gmail.com"
WHERE eid = 2;

UPDATE employee
SET salary = 870, email = "CBA@gmail.com"
WHERE eid = 3;

SELECT * FROM employee;

-- 2.2) DROP [column]
ALTER TABLE employee DROP email;

SELECT * FROM employee;


-- 2.3) MODIFY - [column] Changes the data type, size, or constraints of an existing column.
ALTER TABLE employee MODIFY ename varchar(15);


-- 2.3) RENAME column , TO 
ALTER TABLE employee RENAME column ename TO Employee_Name;
ALTER TABLE employee RENAME column eid TO Employee_id;

SELECT * FROM employee;

-- 3) Delete Table
-- 3.1) DELETE
	-- 1. Removes specific rows (using a WHERE clause) or all rows. 
    -- 2. Can be rolled back.
    
START TRANSACTION;
DELETE FROM employee;
ROLLBACK;
SELECT * FROM employee;

DELETE FROM employee WHERE eid = 1; 


-- 3.2) TRUNCATE
	-- 1. Removes all rows quickly, keeping the table structure.
    -- 2. Cannot be rolled back in MySQL/Oracle, but can be in SQL Server/PostgreSQL
START TRANSACTION;
TRUNCATE TABLE employee; 
ROLLBACK;
SELECT * FROM employee;

-- 3.3) Drop 
	-- Removes the entire table, including structure and all associated data/objects.
DROP TABLE employee; 