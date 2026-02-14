=== university_hub ===
~ visited_university = true
~ investigation_depth++

// 맥락 연결
{ checked_sns or talked_to_family:
    { checked_sns and talked_to_family:
        진원이 말했다. "SNS에 '인생 역전'이라 썼고, 어머니 수술도 있었고... 학교는 어떻게 됐을까?"
    }
    { checked_sns and not talked_to_family:
        "2017년 초에 SNS 활동이 멈췄잖아. 학교도 뭔가 있지 않았을까?"
    }
    { not checked_sns and talked_to_family:
        "어머니 수술 시기랑 겹치는데... 학교는 계속 다녔을까?"
    }
}

효배가 교사 인맥을 동원해서 동국대 학적 기록을 알아봤다.

"2017년 2월에 휴학계 냈네. 사유는... '개인 사정'."

{ talked_to_family:
    정호가 고개를 끄덕였다. "어머니 수술이 그때쯤이었어."
}

"그 후로는?"

"복학 안 했어. 자동 제적됐을 거야."

범환이 과거 수강 내역을 확인했다.

"전공은... 문과였는데 갑자기 정보보안 과목을 수강했네? 2016년 2학기."

"정보보안?"

"응. 그것도 심화 과정."

현이 덧붙였다. "국정원 채용 시기랑 맞아떨어지는데?"

"뭔가 2017년 초에 큰 변화가 있었던 거야."

"어디부터 파볼까?"

* [휴학 기록 자세히 보기] 
    -> uni_dropout_branch

* [정보보안 수강 의도 파악]
    -> uni_infosec_branch

* [동국대 주변 목격담 수소문]
    -> uni_religion_branch
