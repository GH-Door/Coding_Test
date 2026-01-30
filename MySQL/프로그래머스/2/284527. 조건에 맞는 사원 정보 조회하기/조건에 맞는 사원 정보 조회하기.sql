# 2022년도 평가 점수가 가장 높은 사원들의 점수, 사번, 성명, 직책, 이메일을 조회하는 SQL문을 작성
# 2022년도의 평가 점수는 상,하반기 점수의 합을 의미하고, 평가 점수를 나타내는 컬럼의 이름은 SCORE

-- 아래 오답 쿼리

# SELECT
#     MAX(G.SCORE) AS SCORE,
#     G.EMP_NO AS EMP_NO,
#     E.EMP_NAME AS EMP_NAME,
#     E.POSITION AS POSITION,
#     E.EMAIL AS EMAIL
# FROM HR_GRADE AS G
# JOIN HR_EMPLOYEES AS E
#     ON G.EMP_NO = E.EMP_NO
# JOIN HR_DEPARTMENT AS D
#     ON E.DEPT_ID = D.DEPT_ID
# WHERE YEAR = '2022'
# GROUP BY EMP_NO;

-- 정답 쿼리

SELECT
    S.SCORE,
    E.EMP_NO,
    E.EMP_NAME,
    E.POSITION,
    E.EMAIL
FROM HR_EMPLOYEES E
JOIN (
    SELECT
        EMP_NO,
        SUM(SCORE) AS SCORE
    FROM HR_GRADE
    WHERE YEAR = 2022
    GROUP BY EMP_NO
) S
    ON E.EMP_NO = S.EMP_NO
WHERE S.SCORE = (
    SELECT MAX(TOTAL_SCORE)
    FROM (
        SELECT
            SUM(SCORE) AS TOTAL_SCORE
        FROM HR_GRADE
        WHERE YEAR = 2022
        GROUP BY EMP_NO
    ) T
);