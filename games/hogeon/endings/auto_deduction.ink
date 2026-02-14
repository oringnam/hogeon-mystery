// ========================================
// 자동 추론 시스템
// ========================================

=== auto_deduction ===

친구들이 수집한 단서를 보며 고개를 끄덕였다.

"이 단서를 보면..."

{ clue_lotto:
    "로또 당첨 기록이 있었잖아."
    
    "학자금 대출 압박이 심했고, SNS에 '인생 역전'이라고 썼고..."
    
    "시기도 딱 맞아."
    
    "그럼... 호건이는 지금 어디 있을까?"
    
    현이 검색했다. "동대문구 고급 아파트 단지. 2017년에 입주했네."
    
    "가보자."
    
    -> approach_lotto_ending
}

{ clue_ship:
    "부산 선박회사 기록..."
    
    "생활비도 거기서 보냈고."
    
    "원양어선이라면... 지금 바다에 있을 수도."
    
    범환이 검색했다. "다음 입항이 3주 후네."
    
    "기다려보자."
    
    -> approach_ship_ending
}

{ clue_hospital:
    "병원 기록에 장기 입원..."
    
    "교통사고 기록도 있었고."
    
    "병원에 가봐야 할 것 같아."
    
    정호가 어머니께 허락을 받았다.
    
    "면회 가능하대."
    
    -> approach_coma_ending
}

{ clue_witness:
    "증인보호 프로그램..."
    
    "경찰서에 다시 문의해보자."
    
    -> approach_witness_ending
}

{ clue_fantasy:
    "원룸에서 이상한 흔적..."
    
    "한 번 더 가보자."
    
    -> approach_fantasy_ending
}

{ clue_spy:
    "국정원 채용 시기랑 맞아떨어져."
    
    "만약 국정원이라면... 연락이 올 때까지 기다려야 해."
    
    -> approach_spy_ending
}

{ clue_religion:
    "출가 기록이 있었어."
    
    "강원도 산사로 가보자."
    
    -> approach_religion_ending
}

{ clue_business:
    "사업 실패, 엄청난 빚..."
    
    "어디 숨어있을까... 찾아보자."
    
    -> approach_business_ending
}

{ clue_prison:
    "법원 기록에 피고인으로..."
    
    "교정시설에 가보자."
    
    -> approach_prison_ending
}
