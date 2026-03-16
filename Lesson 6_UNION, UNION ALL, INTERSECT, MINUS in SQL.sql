-- UNION/ UNION ALL , INTERSECT , MINUS
	-- Two tables
    -- 1) UNION - Combine them, remove duplications. 
    -- 2) UNION ALL - Combine them, without removing duplications.
    -- 3)  INTERSECT - Display the Common /duplicate the records.
    -- 4) MINUS - if t1 minus t2, then the values the presented in t1 and not present in t2.
 
 -- Note: 
	-- both select statements must have same number of columns with similar data types, and similar order.
 
-- 1. UNION/ UNION ALL  
select orderNumber from orderdetails union select orderNumber from orders; -- 326 rows
select orderNumber from orderdetails union all select orderNumber from orders; -- 3322 rows
select phone from customers union select phone from offices;

-- 2. INTERSECT 
select customerNumber from customers; -- 122 rows
select customerNumber from customers INTERSECT select customerNumber from orders; -- 98 rows [not all customers have orders]

select * from customers where 
 contactFirstName = (select contactLastName from customers INTERSECT select contactFirstName from customers)
OR
 contactLastName = (select contactLastName from customers INTERSECT select contactFirstName from customers);

-- 3. MINUS //doesn't support by mysql
Select productCode from products where productCode Not IN (select productCode from orderdetails);
Select * from customers where contactFirstName Not IN (select firstName from employees);
