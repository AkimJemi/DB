SELECT
    p.email 
FROM
    Person p 
    INNER JOIN ( 
        SELECT
            p2.id
            , count(p2.email) AS count 
        FROM
            Person p2 
        GROUP BY
            email
    ) p3 
        ON p.id = p3.id 
WHERE
    p3.count > 1; 

-- others code
-- 1
SELECT
    Email 
FROM
    PERSON 
GROUP BY
    EMAIL 
HAVING
    COUNT(*) > 1; 
-- 2
select distinct
    p1.email As Email 
from
    person p1 join person p2 
where
    p1.email = p2.email 
    and p1.id != p2.id;

