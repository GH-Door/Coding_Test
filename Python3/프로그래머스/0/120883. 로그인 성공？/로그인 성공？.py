def solution(id_pw, db):
    # id_pw = ID, PW 담긴 배열(array)
    # db = 회원 정보가 담긴 2차원 배열(array)
    # 로그인 성공, 실패에 따른 메시지를 return
        # 아이디와 비밀번호가 모두 일치하는 회원정보가 있으면 "login"을 return
        # 로그인이 실패했을 때 아이디가 일치하는 회원이 없다면 “fail”를, 
        # 아이디는 일치하지만 비밀번호가 일치하는 회원이 없다면 “wrong pw”를 return
    
    input_id, input_pw = id_pw  # ID, PW 분리
    for member_id, member_pw in db:
        if input_id == member_id: # ID 일치 확인
            
            # ID가 일치하면 PW 검사
            if input_pw == member_pw:
                return "login"
            else:
                # ID는 일치하지만 PW가 다름 (다른 회원을 검사할 필요 없음)
                return "wrong pw"
    # 아이디가 일치하는 회원이 없다면 “fail”
    return "fail"