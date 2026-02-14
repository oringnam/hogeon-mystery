// ========================================
// 경로 2: 인적 네트워크 (가족/지인)
// ========================================

=== path_family_start ===
~ investigation_depth++

정호가 휴대폰을 꺼냈다.

"가족한테 직접 물어보는 게 빠를 것 같아."

"호건이 어머니 번호... 아직 있네."

친구들이 숨을 죽였다.

-> family_stage2_contact

// ==================
// 2단계: 연락 방법
// ==================

=== family_stage2_contact ===

"누구한테 먼저 연락할까?"

* [어머니께 전화]
    "어머니가 제일 많이 아실 거야."
    
    -> family_stage3_mother

* [친척들 수소문]
    "친척 쪽에도 연락해보자."
    
    -> family_stage3_relatives

* [옛 동네 친구들 찾기]
    "초등학교 친구들은 어떨까?"
    
    -> family_stage3_old_friends

// ==================
// 3단계: 단서 발견
// ==================

=== family_stage3_mother ===

띠리링- 띠리링-

"여보세요?"

나이 드신 여성의 목소리. 정호가 스피커폰을 켰다.

"어머님, 저 정호예요. 호건이 고등학교 친구... 기억하세요?"

"아, 정호! 물론이지. 우리 호건이랑 맨날 놀러 왔었잖니."

목소리가 반가웠다. 하지만 조금 떨렸다.

"혹시... 호건이 연락처 알 수 있을까요?"

침묵.

"...모르겠구나."

어머니의 목소리가 작아졌다.

"2017년에... 그때 잠깐 집에 왔었어."

친구들이 집중했다.

* [마지막 방문 상황 자세히 듣기]
    "그때 어떤 모습이었어요?"
    
    -> family_stage4_last_visit

* [현재 연락 방법 묻기]
    "지금은 어떻게 연락하세요?"
    
    -> family_stage4_current_contact

* [경제 상황 조심스럽게 묻기]
    "혹시... 경제적으로 힘들었나요?"
    
    -> family_stage4_money

=== family_stage3_relatives ===

범환이 호건이 삼촌 번호를 찾았다.

"여보세요, 삼촌님..."

하지만 별 소득이 없었다.

"2017년 이후로 저도 못 봤어요."

-> family_stage3_mother

=== family_stage3_old_friends ===

의진이 초등학교 동창회 단톡방을 뒤졌다.

"호건이 아는 사람?"

몇 명이 답했지만, 역시 2017년 이후 소식이 없었다.

-> family_stage3_mother

// ==================
// 4단계: 추적
// ==================

=== family_stage4_last_visit ===

"2월이었어. 짐 몇 개 챙겨서 왔었어."

"표정이... 안 좋았어. 뭔가 다친 것 같기도 하고..."

"'일 때문에 당분간 연락 안 될 수 있어요' 하더라고."

진원이 물었다.

"다친 것 같았다고요?"

"응... 팔에 붕대 같은 걸 감고 있었어."

* [병원 기록 확인]
    "2017년 2월 병원 기록을 찾아보자."
    
    ~ family_clue = "hospital"
    -> family_stage5_hospital

* [부상 원인 추측]
    "사고? 폭행?"
    
    -> family_stage4_injury

=== family_stage4_current_contact ===

"지금은... 연락 없어요?"

"가끔 생활비가 들어와. 계좌로."

"얼마나요?"

"한 달에 50만 원씩. 9년째."

친구들이 계산했다.

"5400만 원..."

"어디서 보내는지는... 모르겠더라고."

"메모도 없고, 전화도 없고."

"그냥... 돈만 들어와."

* [송금 내역 추적]
    "은행 기록을 보면 출처를 알 수 있지 않을까?"
    
    ~ family_clue = "ship"
    -> family_stage5_money_trace

* [금액 의미 분석]
    "50만 원이면... 급여? 사업?"
    
    -> family_stage4_money_source

=== family_stage4_money ===

"경제적으로는... 힘들었어."

"2016년 말에 학자금 대출 독촉이 심했대."

"아버지 사업도 안 되고..."

"그래서... 호건이가 뭔가 하려고 했나봐."

* [대출 규모 확인]
    "얼마나 됐어요?"
    
    -> family_stage4_debt

* [호건이가 뭘 했는지 추적]
    "뭔가 돈을 벌려고..."
    
    -> family_stage4_money_source

=== family_stage4_injury ===

"사고였을 수도..."

* [교통사고 기록]
    ~ family_clue = "hospital"
    -> family_stage5_hospital

* [범죄 관련 가능성]
    ~ family_clue = "witness"
    -> family_stage5_police

=== family_stage4_money_source ===

"월 50만 원..."

현이 검색했다.

"원양어선? 해외 근무?"

* [원양어선 가능성]
    ~ family_clue = "ship"
    -> family_stage5_money_trace

* [해외 근무 추적]
    ~ family_clue = "spy"
    -> family_stage5_overseas

=== family_stage4_debt ===

"2천만 원 정도..."

"그 돈을 갚으려면..."

-> family_stage4_money_source

// ==================
// 5단계: 최종 확인
// ==================

=== family_stage5_hospital ===

효배가 아는 의사에게 연락했다.

"2017년 2월 김호건 환자 기록..."

"서울대병원에 있네요."

"상태는?"

"...혼수상태."

침묵.

"9년째 입원 중입니다."

-> approach_coma_ending

=== family_stage5_money_trace ===

범환이 은행 추적을 시도했다.

"송금 출처... 부산?"

"부산 선박회사!"

현이 확인했다.

"원양어선 선원 명단에 김호건..."

"다음 입항이 3주 후래."

"기다려보자."

-> approach_ship_ending

=== family_stage5_police ===

정호가 경찰서에 문의했다.

"2017년 김호건 관련 기록..."

"증인보호 프로그램?"

"본인이 만나겠다고 합니다."

주소를 받았다.

-> approach_witness_ending

=== family_stage5_overseas ===

"해외 근무라면..."

-> approach_spy_ending
