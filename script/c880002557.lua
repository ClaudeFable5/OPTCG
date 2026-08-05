-- MANUAL: ST30-017 / 그리고 큰일나 버리는 거야!! (2026-08-04 ST-30 신규 세트 수동 이식)
-- EN(series 569030)/JP(series 550030) 공식 카드리스트 기준, ST29 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST30-017]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              power_eq=6000,
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 덱 위에서 5장을 보고, 파워 6000인 캐릭터 카드 1장까지를 공개하고 패에 넣는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST30-017]],
    schema_version=1,
  })
end
