-- AUTO-GENERATED: OP04-092 / 레베카
-- rules_id=OP04-092 script_id=880000584 fingerprint=4082fafd984b43d1a9dc5450dc4e1ab3692b137d96eb503e3af16dc72e95d690
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[레베카]],
              trait=[[드레스로자]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            rest_order=[[KEEP]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 「레베카」 이외의 《드레스로자》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-092]],
    schema_version=1,
  })
end
