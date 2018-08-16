/*   
Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+

*/

/* Write your PL/SQL query statement below */
select distinct t.num as ConsecutiveNums
from (
    select 
        l.id, 
        l.num, 
        lead(l.num, 1, null) over (order by l.id) as num2, 
        lead(l.num, 2, null) over (order by l.id) as num3
    from 
        Logs l
) t
where 
    t.num = num2
    and 
    t.num = num3;
