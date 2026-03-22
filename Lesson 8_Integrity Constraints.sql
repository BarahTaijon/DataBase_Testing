-- Integrity Constraints - is a type of conditions added to the column. Used to specify rules for data in a table
-- specified when the table:
	-- 1. is created [CREATE TABLE] statement
    -- 2. or after created [ALTER TABLE] statement.

-- Types of Constraints 
-- 1. NOT NULL 		2. UNIQUE 		3. PRIMARY KEY
-- 4. FOREIGN KEY	5. CKECK		6. DEFAULT
-- 7. ON DELETE CASCADE		8. AUTO_INCREMENT


-- 1. NOT NULL - ensures that a column cannot have NULL value.
-- 2. UNIQUE - ensures that all values in a column are different 
-- 3. PRIMARY KEY - a combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table

CREATE DATABASE parents_academy;
USE parents_academy;

CREATE TABLE parents(P_id INT(5),
					department varchar(20) NOT NULL);
                    
ALTER TABLE parents ADD (status varchar(10) NOT NULL, 
						security_No int(6) UNIQUE); -- ADD column + constrains
                        
ALTER TABLE Parents ADD CONSTRAINT P_primary PRIMARY KEY(P_id); --  ADD constraint
-- a constraint named "P_prmary" that is a PRIMARY KEY constraint to "p_id" column

describe Parents;

-- NOTE: Unique constraint column can accept multiple NULLS.
-- NOTE: When you apply primary key on two columns, that’s called composite primary key.
		-- composite primary key can be applied only at table level.

-- 4. FOREIGN KEY: uniquely identifies a row/record in  a another table

CREATE TABLE program (program_id int(4) NOT NULL PRIMARY KEY, 
					program_name varchar(20), P_id INT(5),
                    FOREIGN KEY(P_id) REFERENCES parents(p_id));

describe PROGRAM;

-- if you try to *delete* parent table record directly.
-- you should first delete dependent records in child table, then delete it from parent.


-- 5. ON DELETE CASCADE - delete rows from the parent table & corresponding child table row as well (at the same time) using ON DELETE CASCADE option

CREATE TABLE Parents_courses (course_no int(3),  course_name varchar(15), primary key(course_no));

insert INTO Parents_courses VALUES(1, "Social");
insert INTO Parents_courses VALUES(2, "Network");
insert INTO Parents_courses VALUES(3, "Marketing");
insert INTO Parents_courses VALUES(4, "Ethics");

insert INTO parents VALUES(1, "dep_7787", "foster", 2229);
insert INTO parents VALUES(2, "dep_1147", "biological", 1234);
insert INTO parents VALUES(1, "dep_7787", "biological", 9999);
insert INTO parents VALUES(2, "dep_9847", "biological", 7659);


drop table Parent_Roll;

CREATE TABLE Parent_Roll(Parent_id INT(5), course_no int(3),
						FOREIGN KEY (course_no) references Parents_courses(course_no) ON DELETE CASCADE,
                        FOREIGN KEY (Parent_id) references Parents(P_id) ON DELETE CASCADE);

insert INTO Parent_Roll VALUES(1, 1);
insert INTO Parent_Roll VALUES(1, 4);
insert INTO Parent_Roll VALUES(2, 4);
insert INTO Parent_Roll VALUES(2, 1);

SELECT * FROM PARENT_ROLL;
SELECT * FROM PARENTS;
SELECT * FROM Parents_courses;

DELETE FROM PARENTS WHERE P_id = 1;  -- when p_id is deleted from parent table the associated rows in the child tables is auto deleted 

-- 6. CHECK: ensures that all values in a column satisfies a specific condition

ALTER TABLE parents ADD (AGE INT CHECK (Age >= 18));
ALTER TABLE Parents ADD (SALARY DECIMAL(10, 2) CHECK (SALARY>0 AND SALARY<5000)); 
-- Note: Total 10 digits, 2 after decimal (e.g., 99999999.99)


-- 7. DEFAULT: sets a default value for a column when no value is specified

-- 8. AUTO_INCREMENT:  
-- operates on numeric data types. 
-- auto sequential numeric values every time that a record is inserted into table for

CREATE TABLE parent_children(
child_id int(5) primary KEY AUTO_INCREMENT,
parent_id int(5),
Date_of_brith datetime DEFAULT NOW(),
FOREIGN KEY (Parent_id) references Parents(P_id)
);

insert into parent_children(parent_id) values(2);
insert into parent_children(parent_id) values(2);
insert into parent_children(parent_id) values(2);

select* from parent_children;

delete from parent_children where child_id = 3;

insert into parent_children(parent_id) values(2); 
-- Note: if you delete record number 2, then insert it once again, it will add it as an last+1 not 2

