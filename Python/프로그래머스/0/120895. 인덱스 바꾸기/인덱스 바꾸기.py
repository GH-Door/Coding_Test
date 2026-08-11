def solution(my_string, num1, num2):
    my_list = list(my_string)
    my_list[num1], my_list[num2] = my_list[num2], my_list[num1] # Swap
    answer = "".join(my_list) # 이어붙힘: join 사용
    return answer 