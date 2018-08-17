/*
There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.
For example, the table:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+

Should output:

+---------+
| class   |
+---------+
| Math    |
+---------+

*/
# Write your MySQL query statement below
SELECT t.class from (
SELECT 
    count(distinct(student)) as num_students, class
FROM
    courses
GROUP BY
    class 
) t
where t.num_students >= 5
