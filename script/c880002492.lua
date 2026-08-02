-- AUTO-GENERATED PROMO: P-046 / 야마토
-- rules_id=P-046 script_id=880002492
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=[[ALL]],
            draw_per_returned=true,
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
        source_text=[[【등장 시】자신의 모든 패를 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다. 이 경우, 되돌린 수만큼 카드를 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-046]],
    schema_version=1,
  })
end
