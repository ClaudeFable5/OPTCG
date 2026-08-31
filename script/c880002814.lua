-- MANUAL: OP17-108 / 샬롯 브륄레 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-108]],
    compile_status=[[MANUAL]],
    effects={},
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP17-108]],
    schema_version=1,
  })
end
