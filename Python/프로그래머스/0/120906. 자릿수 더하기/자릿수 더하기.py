def solution(n):
    return sum(int(num) for num in str(n))
    
    """for문으로 풀면 아래와 같은 형태"""
    
    # total = 0
    # for num in str(n):
        # total += int(num)
    # return total