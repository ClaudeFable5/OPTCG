-- AUTO-GENERATED PROMO: P-120 / 상디
-- rules_id=P-120 script_id=880002530
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-120]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            conditions={
              {
                op=[[OPPONENT_LIFE_LEFT_THIS_TURN]],
                player=[[YOU]],
              },
            },
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_HAND_COST]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
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
