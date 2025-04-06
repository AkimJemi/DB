-- 코드를 입력하세요
-- MINE
WITH RECURSIVE numbers AS ( 
    SELECT
        0 AS num 
    UNION ALL 
    SELECT
        num + 1 
    FROM
        numbers 
    WHERE
        num 23
) 
SELECT
    num AS HOUR
    , ( 
        CASE 
            WHEN SUM(b.cnt) IS NULL 
                THEN 0 
            ELSE SUM(b.cnt) 
            END
    ) COUNT 
FROM
    numbers a 
    LEFT JOIN ( 
        SELECT
            HOUR (DATETIME) AS hr
            , COUNT(ANIMAL_ID) AS cnt 
        FROM
            ANIMAL_OUTS 
        GROUP BY
            ANIMAL_ID
    ) b 
        ON a.num = b.hr 
GROUP BY
    HOUR;


-- OTHERS
WITH RECURSIVE NUM AS (
    SELECT 0 AS HOUR

    UNION ALL

    SELECT HOUR + 1 FROM NUM
    WHERE HOUR < 23
    )

SELECTｘ
    n.HOUR,
    COALESCE(t.DATE_COUNT,0) AS COUNT
FROM 
    NUM n
    LEFT JOIN (
        SELECT HOUR(DATETIME) AS HOUR, COUNT(*) DATE_COUNT
        FROM ANIMAL_OUTS
        GROUP BY HOUR(DATETIME)) t
    ON n.HOUR = t.HOUR
ORDER BY
    HOUR ASC;