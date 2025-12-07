# 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 SQL문을 작성
# 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 항목이 출력되도록 작성해주세요. 
# 결과는 진료예약일시를 기준으로 오름차순 정렬

# 환자 정보를 담은: PATIENT
# 의사 정보를 담은: DOCTOR
# 진료 예약목록을 담은: APPOINTMENT

SELECT
    A.APNT_NO,
    P.PT_NAME,
    A.PT_NO,
    A.MCDP_CD,
    D.DR_NAME,
    A.APNT_YMD
FROM APPOINTMENT AS A
JOIN DOCTOR AS D
    # ON A.MCDP_CD = D.MCDP_CD
    ON A.MDDR_ID = D.DR_ID
JOIN PATIENT AS P
    ON A.PT_NO = P.PT_NO
WHERE
    DATE(A.APNT_YMD) = '2022-04-13' AND # 날짜 format 주의
    A.APNT_CNCL_YN = 'N' AND # 취소되지 않은 (N: 취소 안됨/ Y: 취소)
    A.MCDP_CD = 'CS'
ORDER BY A.APNT_YMD ASC;
    
    