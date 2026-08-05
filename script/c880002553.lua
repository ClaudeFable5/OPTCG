-- MANUAL: ST30-013 / Mr.2 봉쿠레(벤담) (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-013]],
    compile_status=[[MANUAL]],
    effects={
    },
    keywords={},
    rules_id=[[ST30-013]],
    schema_version=1,
  })
end
