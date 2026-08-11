def solution(num, total):
    add_sum = num * (num -1) // 2
    s_sum = total - add_sum
    start_number = s_sum // num
    
    answer = []
    for i in range(num):
        answer.append(start_number + i)
    return answer
