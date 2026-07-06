-- AUTO-GENERATED: OP08-050 / 나무르
-- rules_id=OP08-050 script_id=880001026 fingerprint=b84009c85717454ede97c77dd283a495586ccd1ce90e64e9d8f36efba6cbc4c7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-050]],
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
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 2장을 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP08-050]],
    schema_version=1,
  })
end
