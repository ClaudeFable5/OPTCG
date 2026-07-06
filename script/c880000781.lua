-- AUTO-GENERATED: OP06-047 / 샬롯 푸딩
-- rules_id=OP06-047 script_id=880000781 fingerprint=69ea2655c19d37c1b2ac8f8497e682dfff66b29827d93dfcd060986774a8a418
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            draw_count=5,
            op=[[REDRAW_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대는 자신의 모든 패를 덱으로 되돌리고 섞는다. 그 후, 상대는 카드를 5장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-047]],
    schema_version=1,
  })
end
