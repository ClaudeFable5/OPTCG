-- AUTO-GENERATED: OP06-045 / 쿠잔
-- rules_id=OP06-045 script_id=880000779 fingerprint=e2322eeabdcf81810beb3502eeaeee2c281260a3d78f61b4f363926214163011
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[YOU]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드 2장을 뽑고, 자신의 패 2장을 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-045]],
    schema_version=1,
  })
end
