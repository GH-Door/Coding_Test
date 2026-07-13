# 혼자 풀지 못했음
# 서브 쿼리 상황: 특정 값을 재사용 OR 필터링(계산) 해야할 떄 사용
# Ex: 평균 가격보다 비싼 상품
-- 
# SELET * FROM PRODUCT
# WHERER PRICE > 
    # (
    # SELECT AVG(PRICE)
    # FROM PRODUCT
    # );
    
SELECT
    YEAR(O.SALES_DATE) AS YEAR, -- 구매 연도 추출
    MONTH(O.SALES_DATE) AS MONTH, -- 구매 월 추출
    COUNT(DISTINCT O.USER_ID) AS PURCHASED_USERS, -- 월별 상품을 구매한 회원 수 (중복 구매는 1명으로 계산)

    ROUND( -- 구매 회원 비율 = 구매 회원 수 / 2021년 가입 전체 회원 수
        COUNT(DISTINCT O.USER_ID) /
        (
            -- 스칼라 서브쿼리
            SELECT COUNT(*) -- COUNT(*)는 행(Row) 개수를 세며, 결과는 하나의 숫자(Scalar)를 반환
            FROM USER_INFO
            WHERE YEAR(JOINED) = 2021
        ),
        1 -- 비율은 소수점 두번째자리에서 반올림
    ) AS PURCHASED_RATIO
    
FROM ONLINE_SALE AS O
JOIN USER_INFO AS U
    ON O.USER_ID = U.USER_ID

-- 메인 쿼리도 2021년 가입 회원만 대상으로 계산
-- (서브쿼리의 WHERE는 메인 쿼리에 영향을 주지 않음)
WHERE YEAR(U.JOINED) = 2021

-- 연도, 월별로 그룹화하여 월별 구매 회원 수 계산
GROUP BY
    YEAR(O.SALES_DATE),
    MONTH(O.SALES_DATE)

-- 연도 → 월 순으로 오름차순 정렬
ORDER BY
    YEAR ASC,
    MONTH ASC;