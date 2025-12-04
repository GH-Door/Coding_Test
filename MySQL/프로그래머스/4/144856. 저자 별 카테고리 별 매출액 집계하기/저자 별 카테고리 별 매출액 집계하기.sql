# 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여, 
# 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력하는 SQL문을 작성
# 결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬
# 주어진 TABLE은 총 3개

SELECT
    A.AUTHOR_ID,
    A.AUTHOR_NAME,
    B.CATEGORY,
    SUM(S.SALES * B.PRICE) AS TOTAL_SALES # TOTAL_SALES = 판매량 * 판매가
FROM AUTHOR AS A
JOIN BOOK AS B
    ON A.AUTHOR_ID = B.AUTHOR_ID
JOIN BOOK_SALES AS S
    ON B.BOOK_ID = S.BOOK_ID
WHERE 
    YEAR(SALES_DATE) = '2022' AND
    MONTH(SALES_DATE) = '1'
GROUP BY A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY
ORDER BY A.AUTHOR_ID ASC, B.CATEGORY DESC;
    
    
    