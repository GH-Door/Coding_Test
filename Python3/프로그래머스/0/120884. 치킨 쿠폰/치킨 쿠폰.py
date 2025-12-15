def solution(chicken):
    # chicken = 시켜먹은 치킨의 수
    # 치킨을 시켜먹으면 한 마리당 쿠폰을 한 장 발급
    # 쿠폰을 열 장 모으면 치킨을 한 마리 서비스
    # 서비스 치킨에도 쿠폰이 발급
    
    coupon = chicken 
    service_chicken = 0
    
    while coupon >= 10:
        new_chicken = coupon // 10 # 쿠폰을 열 장 모으면 치킨을 한 마리 서비스
        service_chicken += new_chicken # 누적
        coupon = coupon % 10 + new_chicken # 남은 쿠폰  + 서비스 치킨 쿠폰
    
    return service_chicken

        
                