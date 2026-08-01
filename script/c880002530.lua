-- AUTO-GENERATED PROMO: P-120 / 상디
-- rules_id=P-120 script_id=880002530
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-120]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={},
        conditions={
          {
            count=99,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            reason=[[HAND_COST_WHEN_OPPONENT_LIFE_LEFT_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는 상대의 라이프가 벗어난 턴 동안, 코스트 -2.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-120]],
    schema_version=1,
  })
end
