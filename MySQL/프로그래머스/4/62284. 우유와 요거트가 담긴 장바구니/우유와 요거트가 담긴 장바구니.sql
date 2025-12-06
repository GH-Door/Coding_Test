# 우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문을 작성
# 결과는 장바구니의 아이디 순으로

SELECT DISTINCT(CART_ID) FROM CART_PRODUCTS
GROUP BY CART_ID
HAVING 
    # 'Milk'인 행이 하나라도 있는지 확인
    SUM(CASE WHEN NAME = 'Milk' THEN 1 ELSE 0 END) >= 1
    AND
    # 'Yogurt'인 행이 하나라도 있는지 확인
    SUM(CASE WHEN NAME = 'Yogurt' THEN 1 ELSE 0 END) >= 1
ORDER BY CART_ID;