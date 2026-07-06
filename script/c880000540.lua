-- AUTO-GENERATED: OP04-048 / 사사키
-- rules_id=OP04-048 script_id=880000540 fingerprint=204314c710efaef0acc0cedd28d11e8b4bc7facc769e365257204fd9685600b6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            draw_same_count=true,
            op=[[REDRAW_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 모든 패를 덱으로 되돌리고 덱을 섞는다. 그 후, 덱에 되돌린 수만큼 카드를 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-048]],
    schema_version=1,
  })
end
