def solution(my_string):
    parts = my_string.split(' ') # 예: ['3', ' ', '+', ' ', '2']
    result = int(parts[0]) 
    
    for i in range(1, len(parts), 2): # 공백 건너뛰기 위함 2씩 증가
        operator = parts[i] # 연산자
        number = int(parts[i+1]) # 마지막 숫자
        
        if operator == '+':
            result += number
        elif operator == '-':
            result -= number
            
    return result