-- MANUAL: OP16-034 / 몽키 D. 루피 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-034]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            distinct_names=true,
            divisor=1,
            duration=[[WHILE_CONDITION]],
            filter={},
            op=[[MODIFY_POWER_PER_COUNT]],
            source=[[CHARACTER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】 자신의 카드명이 다른 캐릭터 1장당, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[임펠 다운]],
            },
            look_count=3,
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
        source_text=[[【등장 시】 자신의 덱 위에서 3장을 보고, 특징 《임펠 다운》을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 나머지를 원하는 순서로 덱 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-034]],
    schema_version=1,
  })
end
