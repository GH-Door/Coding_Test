def solution(num, k):
    str_num = str(num)
    str_k = str(k)
    
    for idx, val in enumerate(str_num):
        if val == str_k:
            return idx + 1
    return -1