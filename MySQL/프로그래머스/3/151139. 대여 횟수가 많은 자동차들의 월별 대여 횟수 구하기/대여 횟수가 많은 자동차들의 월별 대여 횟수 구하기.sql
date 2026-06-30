-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들에 대해서 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력하는 SQL문을 작성해주세요. 결과는 월을 기준으로 오름차순 정렬하고, 월이 같다면 자동차 ID를 기준으로 내림차순 정렬해주세요. 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외해주세요.

WITH valid_car AS (
    SELECT 
        CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31' -- 2022년 8월부터 2022년 10월까지
    GROUP BY CAR_ID -- CAR_ID 기준으로 묶어서 "총 대여 횟수" 계산
    HAVING COUNT(*) >= 5 -- 핵심 조건: 해당 기간 동안 5회 이상 대여한 차량만 통과
)

SELECT 
    MONTH(START_DATE) AS MONTH,
    CAR_ID,
    COUNT(*) AS RECORDS -- 해당 월의 대여 횟수
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY

-- valid_car에서 걸러진 CAR_ID만 남김
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    AND CAR_ID IN (SELECT CAR_ID FROM valid_car)
GROUP BY 
    MONTH(START_DATE), CAR_ID
ORDER BY
    MONTH ASC,
    CAR_ID DESC;