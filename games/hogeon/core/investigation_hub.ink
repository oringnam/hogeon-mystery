// ========================================
// Investigation Hub - 동적 라우팅 시스템
// ========================================

=== investigation_hub ===

// 단서 개수 세기
~ temp clue_count = 0
{ clue_lotto:
    ~ clue_count = clue_count + 1
}
{ clue_ship:
    ~ clue_count = clue_count + 1
}
{ clue_witness:
    ~ clue_count = clue_count + 1
}
{ clue_hospital:
    ~ clue_count = clue_count + 1
}
{ clue_fantasy:
    ~ clue_count = clue_count + 1
}
{ clue_spy:
    ~ clue_count = clue_count + 1
}
{ clue_religion:
    ~ clue_count = clue_count + 1
}
{ clue_business:
    ~ clue_count = clue_count + 1
}
{ clue_prison:
    ~ clue_count = clue_count + 1
}

// 충분한 단서 모임 → 자동 분석
{ clue_count >= 3 or investigation_depth >= 5:
    친구들이 모인 단서를 보며 고개를 끄덕였다.
    
    "이제 충분히 알아낸 것 같은데?"
    
    범환이 화이트보드를 보며 말했다. "정리해보자."
    
    -> analysis_phase
}

// 맥락 연결 멘트
{ investigation_depth == 1:
    "일단 하나 확인했다. 더 알아보자."
}
{ investigation_depth == 2:
    "단서가 쌓이고 있어. 계속 파보자."
}

친구들이 다시 모여 다음 행동을 논의했다.

"다음은 뭘 해볼까?"

// 1차 조사 (기본 4가지)
* {not checked_sns} [SNS 계정 확인하기]
    ~ came_from = "hub"
    -> sns_hub

* {not talked_to_family} [호건이 가족에게 연락하기]
    ~ came_from = "hub"
    -> family_hub

* {not visited_university} [동국대 학적 기록 알아보기]
    ~ came_from = "hub"
    -> university_hub

* {not checked_records} [공공 기록 검색하기]
    ~ came_from = "hub"
    -> records_hub

// 심화 조사 (1단계 이상 - 조건 완화)
* {investigation_depth >= 1 and not clue_ship} [부산 선박회사 조사]
    ~ came_from = "hub"
    -> busan_ship_investigation

* {investigation_depth >= 1 and not clue_hospital} [병원 기록 확인]
    ~ came_from = "hub"
    -> hospital_visit

* {investigation_depth >= 1 and not clue_witness} [경찰 문의]
    ~ came_from = "hub"
    -> police_inquiry

* {investigation_depth >= 1 and not clue_religion} [종교 시설 조사]
    ~ came_from = "hub"
    -> temple_search

* {investigation_depth >= 1 and not clue_prison} [교정시설 확인]
    ~ came_from = "hub"
    -> prison_check

* {investigation_depth >= 1 and not clue_business} [사업 실패 추적]
    ~ came_from = "hub"
    -> business_trace
