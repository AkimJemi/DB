-- Table: Customers
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID and name of a customer.
--
--
-- Table: Orders
--
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- customerId is a foreign key (reference columns) of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
-- SELECT ct.name AS Customers FROM Customers ct LEFT JOIN Orders od ON od.customerId = ct.id WHERE od.id is null;
SELECT
    ct.name AS Customers 
FROM
    Customers ct 
WHERE
    NOT EXISTS ( 
        SELECT
            1 
        FROM
            Orders od 
        WHERE
            od.customerId = ct.id
    ); 

-- others code
select
    c.name as customers 
from
    customers as c 
    left join orders as o 
        on c.id = o.customerid 
where
    o.id is null

