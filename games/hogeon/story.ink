// ========================================
// 호건이를 찾아서 (Where is Hogeon?)
// v3.0 - Modular Branching Narrative
// ========================================

// ========================================
// Global Variables & State
// ========================================

// 기본 단서 (boolean)
VAR clue_lotto = false
VAR clue_ship = false
VAR clue_hospital = false
VAR clue_witness = false
VAR clue_fantasy = false
VAR clue_spy = false
VAR clue_religion = false
VAR clue_business = false
VAR clue_prison = false

// 조사 상태
VAR investigation_depth = 0
VAR checked_sns = false
VAR talked_to_family = false
VAR visited_university = false
VAR checked_records = false

// 경로 추적
VAR current_path = ""
VAR came_from = ""

// 상태 리스트 (세부 분기 추적)
LIST investigation_state = none
LIST sns_path = sns_none, sns_lotto, sns_fantasy, sns_fitness
LIST family_path = family_none, family_money, family_ship, family_hospital
LIST university_path = uni_none, uni_dropout, uni_infosec, uni_religion
LIST records_path = rec_none, rec_witness, rec_defendant, rec_lotto, rec_business

// ========================================
// INCLUDE 모듈
// ========================================

INCLUDE core/prologue.ink
INCLUDE core/investigation_hub.ink
INCLUDE core/analysis.ink
INCLUDE core/epilogue.ink

INCLUDE branches/sns/sns_hub.ink
INCLUDE branches/sns/sns_lotto.ink
INCLUDE branches/sns/sns_fantasy.ink
INCLUDE branches/sns/sns_fitness.ink

INCLUDE branches/family/family_hub.ink
INCLUDE branches/family/family_money.ink
INCLUDE branches/family/family_ship.ink
INCLUDE branches/family/family_hospital.ink

INCLUDE branches/university/university_hub.ink
INCLUDE branches/university/uni_dropout.ink
INCLUDE branches/university/uni_infosec.ink
INCLUDE branches/university/uni_religion.ink

INCLUDE branches/records/records_hub.ink
INCLUDE branches/records/rec_witness.ink
INCLUDE branches/records/rec_defendant.ink
INCLUDE branches/records/rec_lotto.ink
INCLUDE branches/records/rec_business.ink

INCLUDE branches/deeper/deeper_hub.ink
INCLUDE branches/deeper/busan_ship.ink
INCLUDE branches/deeper/hospital_visit.ink
INCLUDE branches/deeper/police_inquiry.ink
INCLUDE branches/deeper/temple_search.ink
INCLUDE branches/deeper/prison_check.ink
INCLUDE branches/deeper/business_trace.ink

INCLUDE endings/auto_deduction.ink
INCLUDE endings/lotto.ink
INCLUDE endings/ship.ink
INCLUDE endings/coma.ink
INCLUDE endings/witness.ink
INCLUDE endings/fantasy.ink
INCLUDE endings/spy.ink
INCLUDE endings/religion.ink
INCLUDE endings/business.ink
INCLUDE endings/prison.ink

// ========================================
// Entry Point
// ========================================

-> prologue
