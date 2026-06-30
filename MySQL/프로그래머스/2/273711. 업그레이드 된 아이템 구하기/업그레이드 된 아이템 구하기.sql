-- 아이템의 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템의 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력하는 SQL 문을 작성해 주세요. 이때 결과는 아이템 ID를 기준으로 내림차순 정렬주세요.
-- # Self Join의 대표 유형

SELECT
    C.ITEM_ID,
    C.ITEM_NAME,
    C.RARITY
FROM ITEM_INFO AS P
JOIN ITEM_TREE AS T
    ON P.ITEM_ID = T.PARENT_ITEM_ID -- 업그레이드 전 아이템 ID == PARENT_ITEM_ID
JOIN ITEM_INFO AS C
    ON T.ITEM_ID = C.ITEM_ID
WHERE P.RARITY = 'RARE'
ORDER BY C.ITEM_ID DESC;