/*
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/


/* Write your PL/SQL query statement below */
select Email
from Person
group by Email
having count(Email) > 1 -- Note: The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
