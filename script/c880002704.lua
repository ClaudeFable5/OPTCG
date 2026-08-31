-- MANUAL: ST36-003 / 스크래치멘 아푸 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550036 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST36-003]],
    compile_status=[[MANUAL]],
    effects={},
    keywords={},
    rules_id=[[ST36-003]],
    schema_version=1,
  })
end
