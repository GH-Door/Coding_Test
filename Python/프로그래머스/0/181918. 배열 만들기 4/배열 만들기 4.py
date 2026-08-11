def solution(arr):
    stk = []
    i = 0 # init
    while i < len(arr): # i가 arr 길이보다 작으면 반복
        if not stk: # 빈 배열
            stk.append(arr[i])
            i += 1
        elif stk[-1] < arr[i]: # 마지막 원소 < arr[i]
            stk.append(arr[i])
            i += 1
        else:
            stk.pop() # 마지막 원소 >= arr[i]
    return stk