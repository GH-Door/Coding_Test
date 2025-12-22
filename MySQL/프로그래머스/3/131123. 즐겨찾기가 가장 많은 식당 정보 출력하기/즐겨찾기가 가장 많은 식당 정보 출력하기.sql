# 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성
# 결과는 음식 종류를 기준으로 내림차순 정렬

SELECT
    R.FOOD_TYPE,
    R.REST_ID,	
    R.REST_NAME,
    R.FAVORITES
FROM REST_INFO AS R
JOIN ( # 서브쿼리 사용 / 다음엔 윈도우 함수 사용하기
    SELECT
        FOOD_TYPE,
        MAX(FAVORITES) AS MAX_FAV
    FROM REST_INFO
    GROUP BY FOOD_TYPE
    ) AS M
ON R.FOOD_TYPE = M.FOOD_TYPE
AND R.FAVORITES = M.MAX_FAV
ORDER BY R.FOOD_TYPE DESC;
