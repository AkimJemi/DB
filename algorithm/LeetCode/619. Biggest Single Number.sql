-- Table: MyNumbers
--
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains an integer.
--
--
-- A single number is a number that appeared only once in the MyNumbers table.
--
-- Find the largest single number. If there is no single number, report null.
--
-- The result format is in the following example.
--
--
--
-- Example 1:
--
-- Input:
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- Output:
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
-- Explanation: The single numbers are 1, 4, 5, and 6.
-- Since 6 is the largest single number, we return it.
-- Example 2:
--
-- Input:
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 7   |
-- | 7   |
-- | 3   |
-- | 3   |
-- | 3   |
-- +-----+
-- Output:
-- +------+
-- | num  |
-- +------+
-- | null |
-- +------+
-- Explanation: There are no single numbers in the input table so we return null.
-- mycode
SELECT
    MAX(single_nums.num) AS num 
FROM
    ( 
        SELECT
            t1.num 
        FROM
            MyNumbers t1 
        GROUP BY
            t1.num 
        HAVING
            COUNT(t1.num) = 1
    ) AS single_nums;

-- others code
With cte AS ( 
    SELECT
        num 
    FROM
        MyNumbers 
    GROUP BY
        num 
    HAVING
        COUNT(num) = 1
) 
SELECT
    MAX(num) as num 
FROM
    cte

