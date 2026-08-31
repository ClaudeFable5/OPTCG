-- MANUAL: OP17-035 / 롤로노아 조로 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-035]],
    compile_status=[[MANUAL]],
    effects={},
    keywords={},
    rules_id=[[OP17-035]],
    schema_version=1,
  })
end
