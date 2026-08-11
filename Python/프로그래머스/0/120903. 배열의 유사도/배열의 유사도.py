def solution(s1, s2):
    set1 = set(s1) # 중복은 없지만 집합 형태로 만들어줌
    set2 = set(s2)
    elements = set1.intersection(set2) # intersection는 list 불가 집합(set:{}) 형태로 넣어야함
    return len(elements)