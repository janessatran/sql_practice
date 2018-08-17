/*
Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

*/

-- PL/SQL Query
CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    SELECT 
        Salary INTO result 
    FROM 
        (SELECT Salary, ROWNUM r1 FROM 
            (SELECT DISTINCT SALARY FROM Employee ORDER BY Salary DESC) 
        )
    WHERE r1 = N;
    RETURN result;
END;


-- MySQL Query
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT IFNULL((SELECT
        DISTINCT Salary
      FROM 
        Employee
      ORDER BY Salary DESC
      LIMIT 1 OFFSET N), null)
  );
END
