/*
Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

+---------+------------------+------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+------------------+------------------+
|       1 |       2015-01-01 |               10 |
|       2 |       2015-01-02 |               25 |
|       3 |       2015-01-03 |               20 |
|       4 |       2015-01-04 |               30 |
+---------+------------------+------------------+

For example, return the following Ids for the above Weather table:

+----+
| Id |
+----+
|  2 |
|  4 |
+----+

*/

/* Write your PL/SQL query statement below */
with t as (
    select 
        Id as Id, RecordDate, Temperature,
        LEAD(Id, 1, null) OVER (ORDER BY RecordDate) as NextId,
        LEAD(Temperature, 1, null) OVER (ORDER BY RecordDate) as NextTemp,
        (LEAD(RecordDate, 1, null) OVER (ORDER BY RecordDate)) - (RecordDate) as diff_days 
    from Weather 
)
select t.NextId as Id
from t
where t.NextTemp > t.Temperature and t.diff_days = 1
