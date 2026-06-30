-- MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 ""가장 많이 작성한 회원의 리뷰들을 조회""하는 SQL문을 작성해주세요. 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.

SELECT M.MEMBER_NAME,
       R.REVIEW_TEXT,
       DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE AS M
JOIN REST_REVIEW AS R
    ON M.MEMBER_ID = R.MEMBER_ID

-- 서브 쿼리
WHERE M.MEMBER_ID = (
    SELECT MEMBER_ID
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
    ORDER BY COUNT(*) DESC
    LIMIT 1 -- MAX 함수로 변경 가능 (장점: 동점자도 처리 가능 / 단점: 서브쿼리 하나 더 생성해야함)
)
ORDER BY R.REVIEW_DATE ASC, R.REVIEW_TEXT ASC;
