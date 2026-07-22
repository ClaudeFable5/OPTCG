-- AUTO-GENERATED: OP14-097 / 어서 나를 해적왕으로 만들어라!!!
-- rules_id=OP14-097 script_id=880002262 fingerprint=30e623f61eee73d2ee95950a9178db4bbb362791b18b7322426837604bc0e7f7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-097]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[어서 나를 해적왕으로 만들어라!!!]],
              trait=[[스릴러 바크 해적단]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 덱 위에서 3장을 보고, 「어서 나를 해적왕으로 만들어라!!!」 이외의 《스릴러 바크 해적단》 특징을 가진 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
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
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-097]],
    schema_version=1,
  })
end
