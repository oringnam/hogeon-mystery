// ========================================
// 분석 단계: 단서 조합 및 엔딩 분기
// ========================================

=== analysis_phase ===

친구들은 모은 정보를 테이블에 펼쳐놓았다.

"정리해보자. 우리가 알아낸 것들..."

진원이 화이트보드에 타임라인을 그렸다:

● 2016년 말:
- 어머니 큰 수술, 병원비 필요
- "인생 역전하고 싶다" SNS 포스팅
- 사업자등록 (온라인 쇼핑몰)
- 갑자기 운동 시작
- 로또 당첨 의혹

● 2017년 초:
- 사업 폐업
- SNS 활동 중단
- 교통사고? 증인 출석?
- 휴학계 제출
- 마지막 가족 방문

● 2017년 이후:
- 완전 잠적
- 가끔 생활비 송금 (부산 선박회사?)
- 카톡 읽음 확인은 됨

"결론은...?"

-> final_deduction

=== final_deduction ===

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

// 모든 경우 자동 추론
-> auto_deduction
