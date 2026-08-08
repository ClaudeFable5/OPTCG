-- MANUAL: OP16-042 / 임펠다운 수인 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-042]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[DECK_BUILD_RESTRICTION]],
            rule=[[UNLIMITED_COPIES]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 이 카드는 덱에 몇 장이든 넣을 수 있다.]],
        timings={
          [[RULE]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-042]],
    schema_version=1,
  })
end
