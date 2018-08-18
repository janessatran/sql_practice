/*
Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

*/

/* Write your PL/SQL query statement below */
select Name as Customers 
from Customers
where Id not in (select CustomerId from Orders) 

# Write your MySQL query statement below
SELECT Name as Customers FROM (
    SELECT c.Id, c.Name, o.CustomerId
    FROM Customers c
    LEFT JOIN Orders o
    ON c.Id = o.CustomerId
) t
WHERE t.CustomerId is NULL
