// ========================================
// 가족 연락 - Hub (3-way branching)
// ========================================

=== family_hub ===
~ talked_to_family = true
~ investigation_depth++

// 맥락 연결
{ came_from == "sns_lotto":
    "SNS에 '인생 역전'이라고 썼는데, 어머니한테 물어볼까?"
}
{ came_from == "sns_fantasy":
    "판타지 커뮤니티 활동이 이상한데... 가족은 알까?"
}
{ came_from == "hub":
    "가족한테 직접 물어보는 게 빠를 것 같아."
}

정호가 호건이 어머니께 전화를 걸었다.

"어머님, 저 정호예요. 호건이 고등학교 친구..."

통화는 짧았다. 정호의 표정이 어두워졌다.

"어머니 말로는... 2017년에 잠깐 집에 들렀다가 '일 때문에 당분간 연락 안 될 수 있다'고 하고 나갔대."

"그게 마지막?"

"응. 그 후로 가끔 생활비는 보내온다고 하더라. 근데 어디 있는지는 모르신대."

* [생활비 출처 추적하기]
    ~ current_path = "ship"
    -> family_ship_branch

* [어머니 건강 상태 확인]
    ~ current_path = "money"
    -> family_money_branch

* [마지막 방문 때 모습 확인]
    ~ current_path = "hospital"
    -> family_hospital_branch
