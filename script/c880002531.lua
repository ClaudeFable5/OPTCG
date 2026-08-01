-- AUTO-GENERATED PROMO: P-121 / 브룩
-- rules_id=P-121 script_id=880002531
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-121]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대는 자신의 패 2장을 버린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[P-121]],
    schema_version=1,
  })
end
