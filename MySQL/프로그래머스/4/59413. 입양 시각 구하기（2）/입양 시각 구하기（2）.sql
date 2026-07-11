-- 오답 Query
# SELECT
#     HOUR(DATETIME) AS "HOUR",
#     COUNT(ANIMAL_ID) AS "COUNT"
# FROM ANIMAL_OUTS
# GROUP BY HOUR(DATETIME)
# ORDER BY HOUR;

-- 정답 Query
-- WITH : 임시 테이블(CTE) 생성
-- RECURSIVE : 재귀적으로 데이터를 생성
WITH RECURSIVE HOURS AS (
    SELECT 0 AS HOUR # 시작값 생성 (0시) - python Ex: hour = o 

    UNION ALL # row 붙히기 python Ex: pd.concat

    SELECT HOUR + 1 # python 의 range 기능과 유사
    FROM HOURS
    WHERE HOUR < 23 # 23시까지 반복 = python Ex: while 문
)

SELECT
    H.HOUR, # IFNULL : NULL이면 0으로 변경 (Python의 fillna(0))
    IFNULL(COUNT(A.ANIMAL_ID), 0) AS COUNT 
FROM HOURS H

LEFT JOIN ANIMAL_OUTS A
ON H.HOUR = HOUR(A.DATETIME)

GROUP BY H.HOUR
ORDER BY H.HOUR;