// ========================================
// 경로 3: 공식 기록 (대학/공공)
// ========================================

=== path_records_start ===
~ investigation_depth++

효배가 말했다.

"대학 기록부터 확인해보자. 공식 기록은 거짓말 안 하니까."

"내 후배가 동국대 행정실에 있어. 연락해볼게."

-> records_stage2_type

// ==================
// 2단계: 기록 종류
// ==================

=== records_stage2_type ===

효배가 후배에게 전화했다.

"김호건 학적 기록 좀 봐줄 수 있어?"

"어떤 거?"

* [학적 기록 (휴학/복학)]
    "일단 휴학계부터. 언제 냈는지."
    
    -> records_stage3_academic

* [동아리 활동 기록]
    "동아리 뭐 했는지도 알 수 있어?"
    
    -> records_stage3_club

* [도서관 대출 기록]
    "어떤 책 빌렸는지 보면 관심사를 알 수 있지 않을까?"
    
    -> records_stage3_library

// ==================
// 3단계: 특정 기록 발견
// ==================

=== records_stage3_academic ===

"휴학계... 2016년 12월 29일에 제출했네."

"사유는?"

"'경제적 사정'이라고 되어 있어."

친구들이 고개를 끄덕였다.

"그리고... 특이한 게."

"뭔데?"

"같은 날 사업자등록 신청했대. 온라인 쇼핑몰."

* [사업자등록 추적]
    "사업을 했구나. 어떻게 됐는지 봐보자."
    
    ~ records_clue = "business"
    -> records_stage4_business

* [휴학 이후 행적]
    "그 다음엔?"
    
    -> records_stage3_after_leave

=== records_stage3_club ===

"동아리... 정보보안 스터디, 창업 동아리..."

"그리고 특이하게 종교 동아리도 있네."

"종교 동아리?"

"응. '불교학생회' 2016년 하반기에 가입했어."

* [종교 동아리 활동 확인]
    "절에 다녔나? 더 알아보자."
    
    ~ records_clue = "religion"
    -> records_stage4_religion

* [창업 동아리로]
    ~ records_clue = "business"
    -> records_stage4_business

=== records_stage3_library ===

"도서관 대출... 2016년 하반기."

"경영학 서적, 창업 관련, 그리고..."

"판타지 소설이 엄청 많네?"

"이세계물 위주..."

* [판타지 소설 패턴 분석]
    ~ records_clue = "fantasy"
    -> records_stage4_fantasy_books

* [창업 서적 추적]
    ~ records_clue = "business"
    -> records_stage4_business

=== records_stage3_after_leave ===

"2017년 1월에... 법원 출석 기록이 있네?"

"법원?"

"재판 방청? 아니면..."

* [법원 기록 확인]
    ~ records_clue = "witness"
    -> records_stage4_court

* [다른 기록 먼저]
    -> records_stage3_club

// ==================
// 4단계: 심화 조사
// ==================

=== records_stage4_business ===

범환이 사업자등록 조회를 했다.

"온라인 쇼핑몰 '트렌디샵'..."

"2016년 12월 등록, 2017년 6월 폐업."

"6개월 만에 망했네."

현이 신용정보를 확인했다.

"빚이... 1억 2천?"

침묵.

"그래서 어디 갔을까..."

* [빚 독촉 피해 도망]
    "제주도? 부산?"
    
    ~ records_clue = "business_escape"
    -> records_stage5_business_escape

* [파산 신청 기록]
    "파산했나?"
    
    -> records_stage5_business_bankrupt

=== records_stage4_religion ===

의진이 불교학생회 회장에게 연락했다.

"김호건? 아, 그 선배..."

"2017년 초에 절에 가겠다고 하더라고요."

"템플스테이?"

"아니요. 출가하겠다고..."

친구들이 놀랐다.

"출가?"

* [어느 절인지 확인]
    "강원도 설악산 근처 절이래요."
    
    ~ records_clue = "religion_temple"
    -> records_stage5_temple

* [출가 동기 파악]
    "왜 출가하려고 했는지..."
    
    -> records_stage4_religion_why

=== records_stage4_court ===

정호가 법원 기록을 뒤졌다.

"2017년 1월 19일... 폭행 사건 목격자?"

"조직폭력배 재판에 증인으로..."

"그래서?"

"증인보호 프로그램 신청했대."

* [증인보호 추적]
    ~ records_clue = "witness_protection"
    -> records_stage5_witness

* [재판 결과 확인]
    "범인들은?"
    
    -> records_stage4_court_result

=== records_stage4_fantasy_books ===

재원이 대출 목록을 정리했다.

"전부 이세계 전이물..."

"그리고 마지막 대출이 '소환 의식 가이드북'?"

"...그게 뭔데?"

"판타지 설정집 같은 건데... 진지하게 믿은 건 아니겠지?"

* [원룸 방문해보기]
    ~ records_clue = "fantasy"
    -> records_stage5_room_check

=== records_stage4_religion_why ===

"힘들어서... 벗어나고 싶었대요."

-> records_stage4_religion

=== records_stage4_court_result ===

"징역 10년씩."

"하지만 보복 위협이 왔대요."

-> records_stage4_court

// ==================
// 5단계: 최종 확인
// ==================

=== records_stage5_business_escape ===

현이 신용카드 사용 내역을 추적했다.

"마지막 사용 지역... 제주도!"

"제주도로 도망갔구나."

"찾아보자. 카페 창업 기록..."

-> approach_business_ending

=== records_stage5_business_bankrupt ===

"파산 신청 안 했네."

"그럼..."

-> records_stage5_business_escape

=== records_stage5_temple ===

"강원도 설악산 백담사..."

"전화해볼까?"

스님이 전화를 받았다.

"법명 지성... 계십니다."

친구들이 서로를 봤다.

"찾았다."

-> approach_religion_ending

=== records_stage5_witness ===

범환이 경찰서에 문의했다.

"증인보호 프로그램... 본인이 만나겠다고 합니다."

안전가옥 주소를 받았다.

-> approach_witness_ending

=== records_stage5_room_check ===

집주인에게 연락했다.

"2017년 세입자 방... 아직 있어요."

"가봐도 될까요?"

"오세요."

-> approach_fantasy_ending

// ==================
// 추가 분기 (교도소)
// ==================

=== records_stage4_criminal ===

"혹시... 범죄 기록?"

정호가 검색했다.

"법원 판결문... 있네."

"2017년 보이스피싱 조직..."

"7년형."

침묵.

"교정시설 확인해보자."

-> records_stage5_prison

=== records_stage5_prison ===

"서울구치소..."

"면회 신청할게."

-> approach_prison_ending
