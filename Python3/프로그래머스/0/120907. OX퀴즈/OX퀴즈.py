def solution(quiz):
    answer = []

    for strs in quiz:
        ceremony, results = strs.split("=")
        result = int(results.strip())
        is_correct = "X"
        
        if "+" in ceremony:
            num1, num2 = ceremony.split(" + ")
            num1 = int(num1.strip())
            num2 = int(num2.strip())
            if num1 + num2 == result:
                is_correct = "O"
        
        elif "-" in ceremony:
            num1, num2 = ceremony.split(" - ")
            num1 = int(num1.strip())
            num2 = int(num2.strip())
            if num1 - num2 == result:
                is_correct = "O"
                
        answer.append(is_correct)
    return answer
    
    # 아래 코드도 작동은 하지만 eval() 함수는 보안 상 잘 사용하지 않음(위험 
    # for strs in quiz:
    #     if eval(strs.split("=")[0]) == eval(strs.split("=")[1]):
    #         answer.append("O")
    #     else:
    #         answer.append("X")
    # return answer