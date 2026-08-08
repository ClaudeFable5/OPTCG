-- MANUAL: OP16-086 / 상디 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-086]],
    compile_status=[[MANUAL]],
    effects={},
    keywords={},
    rules_id=[[OP16-086]],
    schema_version=1,
  })
end
