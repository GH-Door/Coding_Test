def solution(array):
    answer = 0
    for number in array:
          answer += str(number).count('7') # count 활용
    return answer