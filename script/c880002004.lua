-- AUTO-GENERATED: ST28-005 / 야마토
-- rules_id=ST28-005 script_id=880002004 fingerprint=7f20ae13a6539ddee520b3bff1b573ec504aeb2c8e0e773fed3167d5be39a03f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST28-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅×2】【자신의 턴 동안】이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              cost_gte=2,
              trait=[[와노쿠니]],
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
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 코스트 2 이상인 《와노쿠니》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST28-005]],
    schema_version=1,
  })
end
