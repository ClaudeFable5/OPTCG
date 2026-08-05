-- MANUAL: ST30-005 / 조즈 (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-005]],
    compile_status=[[MANUAL]],
    effects={
    },
    keywords={},
    rules_id=[[ST30-005]],
    schema_version=1,
  })
end
