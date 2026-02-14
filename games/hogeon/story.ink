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

// 5단계 분기 추적
VAR digital_clue = ""
VAR family_clue = ""
VAR records_clue = ""

// 상태 리스트 (세부 분기 추적)
LIST investigation_state = none
LIST sns_path = sns_none, sns_lotto, sns_fantasy, sns_fitness
LIST family_path = family_none, family_money, family_ship, family_hospital
LIST university_path = uni_none, uni_dropout, uni_infosec, uni_religion
LIST records_path = rec_none, rec_witness, rec_defendant, rec_lotto, rec_business

// ========================================
// INCLUDE 모듈
// ========================================

// Core
INCLUDE core/prologue.ink
INCLUDE core/epilogue.ink

// 3 Main Paths (5-stage branching)
INCLUDE paths/digital_path.ink
INCLUDE paths/family_path.ink
INCLUDE paths/records_path.ink

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
