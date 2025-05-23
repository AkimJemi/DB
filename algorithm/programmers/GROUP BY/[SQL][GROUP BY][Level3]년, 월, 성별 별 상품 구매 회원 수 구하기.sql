-- 코드를 입력하세요
SELECT 
  YEAR(b.sales_date) AS year,
  MONTH(b.sales_date) AS month,
  a.GENDER,
  COUNT(DISTINCT a.USER_ID) AS USERS
FROM USER_INFO a INNER JOIN ONLINE_SALE b ON a.USER_ID = b.USER_ID
WHERE GENDER IS NOT NULL 
GROUP BY year, month, GENDER
ORDER BY YEAR, MONTH, GENDER