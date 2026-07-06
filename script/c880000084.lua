-- AUTO-GENERATED: EB02-023 / 크로커다일
-- rules_id=EB02-023 script_id=880000084 fingerprint=cef96f1ca511507e61b21a818fc0307ebc7f90e80d330299d1a41a40555fea91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】상대의 캐릭터가 자신의 효과로 주인의 패로 되돌려졌을 때, 자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_OPPONENT_CHARACTER_RETURNED_TO_HAND_BY_OWN_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-023]],
    schema_version=1,
  })
end
