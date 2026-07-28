-- AUTO-GENERATED: OP15-044 / 코알라
-- rules_id=OP15-044 script_id=880002346 fingerprint=1d834941704d71ae90066aaa69b12b191bfefd7319a21a83b2096beade3b2632
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
              trait=[[드레스로자]],
            },
            look_count=3,
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
        source_text=[[【KO 시】자신의 덱 위에서 3장을 보고, 《드레스로자》 특징을 가진 이벤트 1장까지를 공개하고 패에 넣는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-044]],
    schema_version=1,
  })
end
