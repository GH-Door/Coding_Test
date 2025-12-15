# 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성
# 이때 결과는 보호 시작일이 빠른 순으로 조회

# ANIMAL_INS = 동물 보호소에 들어온 동물의 정보를 담은 테이블
# ANIMAL_OUTS = 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블

SELECT
    O.ANIMAL_ID,
    O.NAME
FROM ANIMAL_OUTS AS O
JOIN ANIMAL_INS AS I
    ON O.ANIMAL_ID = I.ANIMAL_ID
WHERE O.DATETIME < I.DATETIME
ORDER BY I.DATETIME ASC;
