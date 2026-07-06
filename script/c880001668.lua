-- AUTO-GENERATED: OP13-096 / '오로성' 이 자리에!!!
-- rules_id=OP13-096 script_id=880001668 fingerprint=bde395993b062f5fda58c112529a3be9bed522bbc9d0e57409c15e9edcfbf9a7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-096]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[['오로성' 이 자리에!!!]],
              trait=[[천룡인]],
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
        source_text=[[【메인】자신의 덱 위에서 3장을 보고, 「'오로성' 이 자리에!!!」 이외의 《천룡인》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-096]],
    schema_version=1,
  })
end
