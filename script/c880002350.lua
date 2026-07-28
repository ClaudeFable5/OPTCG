-- AUTO-GENERATED: OP15-048 / 칭자오
-- rules_id=OP15-048 script_id=880002350 fingerprint=dfa5497ecc8bfc0c7e087d17beac0af4e6af354e7382ffe50aae0a3bedaec3ba
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 이벤트 1장을 버릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】【KO 시】상대는 자신의 패 1장을 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-048]],
    schema_version=1,
  })
end
