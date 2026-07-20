-- AUTO-GENERATED: EB03-048 / 레베카
-- rules_id=EB03-048 script_id=880002151 fingerprint=947ed8f34de4a61b517f89665657ff029562bd830ecee4e67950e4c3e0cac3a8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              card_type=[[STAGE]],
              trait=[[드레스로자]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
          {
            count=1,
            filter={
              card_type=[[STAGE]],
              cost_eq=1,
              trait=[[드레스로자]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 《드레스로자》 특징을 가진 스테이지 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌리고, 자신의 패에서 코스트 1인 《드레스로자》 특징을 가진 스테이지 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-048]],
    schema_version=1,
  })
end
