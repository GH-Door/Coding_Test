def solution(A, B):
    N = len(A)
    if A == B:
        return 0
    
    cunver_A = A
    for i in range(1, N):
        cunver_A = cunver_A[-1] + cunver_A[:-1] # 슬라이싱 사용: ohell = 끝자리(o) + 나머지(hell)
        if cunver_A == B:
            return i
    return -1