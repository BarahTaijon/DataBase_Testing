-- Group By, Having & ,Order By, Union

-- 1) Group By -> Group rows that have the same values into summary rows

-- without Group by
SELECT max(amount) AS maxIn_2003 FROM paymentS where year(paymentDate) = "2003";
SELECT COUNT(customerNumber) AS count_of_customer_orders FROM orders WHERE customerNumber = 181;

-- Group by
SELECT paymentDate, sum(amount) FROM payments group by paymentDate;
SELECT customerNumber, COUNT(customerNumber) as number_of_orders FROM orders group by customerNumber;
SELECT country, COUNT(*)as customer_no FROM customers group by country;
SELECT status, COUNT(*)as status_no FROM orders group by status; -- equal to => SELECT status, COUNT(status)as status_no FROM orders group by status;
SELECT customerNumber, Max(amount), Min(amount) FROM payments group by customerNumber;
SELECT jobTitle, count(*) from employees group by jobTitle;

-- 2) HAVING -> Apply condition on the group
SELECT jobTitle, count(*) from employees group by jobTitle HAVING count(*)>1;
SELECT customerNumber, Max(amount), Min(amount) FROM payments group by customerNumber HAVING customerNumber IN (103, 181, 124);
SELECT paymentDate, sum(amount) FROM payments group by paymentDate having Month(paymentDate) = "04";

-- 3) ORDER BY -> used to arrange the rows in a table (ascending, or descending)
select * from orders;
select * from orders order by orderdate;
select * from orders order by orderdate desc;

-- the order of execution : WHERE → GROUP BY → HAVING → ORDER BY
