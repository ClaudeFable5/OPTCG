-- OPCG battle module — 전투 판정 전면 철거 (2026-07-12, 유저 지시 "깔끔하게 엎어").
-- 어택 선언·배틀 진행은 네이티브 배틀 머신(idle t=9 → Processors::BattleCommand)
-- 으로 이관되는 중. lua 판정 구현 원본(레스트/블로커/카운터/치환/KO/라이프
-- 데미지/트리거 디스패치 일체)은 아래에 격리 보존:
--   script_backups/opcg_battle.pre-native-battle-20260712.lua
--
-- 이 스텁이 유지하는 것: 모듈 존재(부트스트랩 로드), 외부 참조 진입점의
-- 안전한 무해화. 판정 로직은 없음 — 현재 전투 심판은 스톡 코어
-- (calculate_battle_damage 등)이며, OPCG 룰 판정의 새 거처는 코어 이관이
-- 완료되어야 생긴다.

opcg = opcg or {}
opcg.battle = opcg.battle or {}
local B = opcg.battle

-- 구 판정 진입점 tombstone: 잔존 호출 경로가 있어도 조용히 무시한다.
-- (호출자 전수조사: rules.R.resolve_attack 래퍼만 남았고 그 래퍼의 호출자 0곳.
-- core:1909의 register_attack_action 참조는 nil-가드 완비라 함수 부재 안전.)
function B.resolve_attack(attacker, target, context)
	return false
end

return B
