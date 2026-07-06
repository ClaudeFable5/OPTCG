-- AUTO-GENERATED: OP11-051 / 상디
-- rules_id=OP11-051 script_id=880001385 fingerprint=88bcf40a90a432e5f678656db8d973d97ab8bbdd427ed6546e893e6558e0917d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              trait=[[밀짚모자 일당]],
            },
            look_count=5,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 상대의 효과로 KO 당했을 때, 자신의 덱 위에서 5장을 보고, 코스트 5 이하인 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_KO_BY_OPPONENT_EFFECT]],
        },
      },
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                base_power_lte=5000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】원래 파워가 5000 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-051]],
    schema_version=1,
  })
end
