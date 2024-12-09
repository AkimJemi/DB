SELECT
    * 
FROM
    employee.ep_person ep 
    INNER JOIN common.cm_address ca 
        ON ep.id = ca.type_id 
WHERE
    ca.type = 'H';
SELECT
    * 
FROM
    employee.ep_person ep 
    INNER JOIN common.cm_address ca 
        ON ep.id = ca.type_id 
WHERE
    ca.type = 'C';

SELECT
    * 
FROM
    common.cm_person cp 
    INNER JOIN common.cm_address ca 
        ON cp.id = ca.type_id 
WHERE
    ca.type = 'H';
