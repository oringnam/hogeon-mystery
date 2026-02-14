// ========================================
// 가족 → 돈 문제 분기 (어머니 수술비)
// ========================================

=== family_money_branch ===
# STATE: family_money

"어머님 건강은 어떠셨어?"

정호가 한숨을 쉬었다. "2016년 말에 큰 수술 하셨대. 병원비가 많이 들었다고."

{ checked_sns and sns_path == sns_lotto:
    범환이 눈을 크게 떴다. "그래서! SNS에 '인생 역전'이라고 쓴 거야!"
    
    "돈이 절실했던 거지..."
}
{ not checked_sns:
    "그래서 호건이가 급전이 필요했을 수도..."
}

~ clue_lotto = true
~ clue_ship = true
~ clue_business = true
~ family_path = family_money

* [수술 시기와 SNS 포스팅 비교하기]
    { checked_sns:
        진원이 노트를 펼쳤다.
        
        "2016년 말 수술... 2017년 1월 15일 'SNS 인생 역전' 포스팅..."
        
        "그리고 1월 21일 동대문구 로또 당첨."
        
        "시간 순서가 완벽하게 맞아떨어져."
    }
    { not checked_sns:
        "SNS 계정을 확인해봐야겠어."
    }
    
    -> family_money_deeper

* [병원비를 어떻게 해결했을까 추론]
    "병원비가 얼마나 들었을까?"
    
    정호가 말했다. "큰 수술이라... 수천만 원은 들었을 거야."
    
    "그 돈을 어떻게...?"
    
    범환이 말했다. "사업? 대출? 아니면..."
    
    진원이 조심스럽게 말했다. "로또?"
    
    -> family_money_deeper

* [갑자기 병원비를 보낸 시기 확인]
    "언제 병원비를 보내셨대?"
    
    정호가 확인했다. "2017년 2월... 갑자기 목돈이 들어왔다고."
    
    "2월?"
    
    { checked_sns and sns_path == sns_lotto:
        "로또 당첨 발표가 1월 21일이었잖아!"
        
        "그럼 정말로...?"
    }
    
    -> family_money_deeper

=== family_money_deeper ===

친구들이 정리했다.

"어머니 수술비 → 급전 필요 → 뭔가 큰 돈 → 병원비 해결"

"이 흐름이 확실해 보이는데."

* {checked_sns and sns_path == sns_lotto} [로또 확신하기]
    "로또가 확실해. SNS 포스팅, 당첨 시기, 병원비 송금 시기... 다 맞아."
    
    -> investigation_hub

* {not checked_sns} [SNS에서 단서 찾으러 가기]
    "SNS 계정을 확인해보자. 뭔가 있을 거야."
    
    ~ came_from = "family_money"
    -> sns_hub

* [다른 가능성도 열어두기]
    "돈 출처는 여러 가지일 수 있어. 더 조사하자."
    
    -> investigation_hub
