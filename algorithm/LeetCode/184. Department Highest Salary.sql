-- Table: Employee
--
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id is the primary key (column with unique values) for this table.
-- departmentId is a foreign key (reference columns) of the ID from the Department table.
-- Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
--
--
-- Table: Department
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
-- Each row of this table indicates the ID of a department and its name.
--
--
-- Write a solution to find employees who have the highest salary in each of the departments.
--
-- Return the result table in any order.
--
-- The result format is in the following example.
--
--
--
-- Example 1:
--
-- Input:
-- Employee table:
-- +----+-------+--------+--------------+
-- | id | name  | salary | departmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Jim   | 90000  | 1            |
-- | 3  | Henry | 80000  | 2            |
-- | 4  | Sam   | 60000  | 2            |
-- | 5  | Max   | 90000  | 1            |
-- +----+-------+--------+--------------+
-- Department table:
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | IT    |
-- | 2  | Sales |
-- +----+-------+
-- Output:
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Jim      | 90000  |
-- | Sales      | Henry    | 80000  |
-- | IT         | Max      | 90000  |
-- +------------+----------+--------+
-- Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
SELECT
    dp2.name Department
    , em.name Employee
    , em.salary Salary 
FROM
    Employee em 
    INNER JOIN ( 
        SELECT
            dp.id
            , dp.name
            , MAX(em.salary) max_salary 
        FROM
            Employee em 
            INNER JOIN Department dp 
                ON em.departmentId = dp.id 
        GROUP BY
            em.departmentId
    ) dp2 
        ON em.departmentId = dp2.id 
WHERE
    em.salary = dp2.max_salary; 

--ChatGPT Correction
SELECT
    dp2.name AS Department
    , em.name AS Employee
    , em.salary AS Salary 
FROM
    Employee em 
    INNER JOIN ( 
        SELECT
            dp.id
            , dp.name
            , MAX(em.salary) AS max_salary 
        FROM
            Employee em 
            INNER JOIN Department dp 
                ON em.departmentId = dp.id 
        GROUP BY
            dp.id
            , dp.name
    ) dp2 
        ON em.departmentId = dp2.id 
        AND em.salary = dp2.max_salary; 

-- others code
--1
select
    Department
    , Employee
    , salary 
from
    ( 
        select
            d.name as Department
            , e.name as Employee
            , e.salary
            , dense_rank() over (partition by d.id order by e.salary desc) as rnk 
        from
            Employee as e 
            left outer join Department as d 
                on e.departmentid = d.id
    ) as t 
where
    t.rnk = 1

