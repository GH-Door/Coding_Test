# 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 대여 기록 별로 대여 금액(컬럼명: FEE)을 구하여
# 대여 기록 ID와 대여 금액 리스트를 출력하는 SQL문을 작성
# 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬

SELECT
    H.HISTORY_ID,
    TRUNCATE(
        C.DAILY_FEE * (DATEDIFF(H.END_DATE, H.START_DATE) + 1) * 
        (1 - IFNULL(P.DISCOUNT_RATE, 0) / 100), 0) AS FEE # 대여 금액 * 대여 기간 * 할인율
FROM CAR_RENTAL_COMPANY_CAR AS C
JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
    ON C.CAR_ID = H.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P # 할인 정책에 해당하지 않는 대여 기록을 누락시키지 않기 위함: LEFT JOIN
    ON C.CAR_TYPE = P.CAR_TYPE
    AND (
        CASE # CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블과 JOIN 하기 위해 생성
            WHEN (DATEDIFF(H.END_DATE, H.START_DATE) + 1) >= 90 THEN '90일 이상'
            WHEN (DATEDIFF(H.END_DATE, H.START_DATE) + 1) >= 30 THEN '30일 이상'        
            WHEN (DATEDIFF(H.END_DATE, H.START_DATE) + 1) >= 7 THEN '7일 이상'
            ELSE NULL # 할인 없는 값은 NULL로 처리
        END
        ) = P.DURATION_TYPE
WHERE
    C.CAR_TYPE = '트럭'
ORDER BY FEE DESC, H.HISTORY_ID DESC;