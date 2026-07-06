-- AUTO-GENERATED: EB01-009 / 시끄러워!!! 가자!!!!
-- rules_id=EB01-009 script_id=880000008 fingerprint=8bd53de7d9158c3287cebf20508ef676663d4f980b6c4bf2a5aa1cdaaefb62a0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[동물]],
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
        source_text=[[【카운터】자신의 덱 위에서 5장을 보고, 코스트 3 이하인 《동물》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-009]],
    schema_version=1,
  })
end
