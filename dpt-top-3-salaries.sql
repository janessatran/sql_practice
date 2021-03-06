/*
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+

The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+

*/

/* Write your PL/SQL query statement below */
with t as (
select 
    e.Name as Employee, e.Salary, e.DepartmentId,
    d.Id, d.Name as Department
from
    Employee e
left join
    Department d
on
    e.DepartmentId = d.Id
), 
r as (
select
    t.*, 
    -- DENSE_RANK: Rank values are not skipped in the event of ties. 
    -- if there are 2 people tied, score would be 1, 1, and second place would get 2
    dense_rank() over (partition by t.Department order by t.Salary DESC) as rank
    from t
    where t.Department is not null
)
select r.Department, r.Employee, r.Salary
from r
where rank <= 3


# Write your MySQL query statement below
SELECT 
    d.Name AS Department, e.Name AS Employee, e.Salary
FROM 
    Employee e
JOIN 
    Department d on e.DepartmentId = d.Id
WHERE (
    SELECT COUNT(DISTINCT Salary)
    FROM Employee
    WHERE Salary > e.Salary
    AND DepartmentId = d.Id) < 3
ORDER BY d.Name, e.Salary DESC
