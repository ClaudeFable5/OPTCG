-- AUTO-GENERATED: OP03-120 / 열해지옥
-- rules_id=OP03-120 script_id=880000487 fingerprint=4c2dd69a946d3bf65e5b591ef57d3c5057d40843bf36ed0c5877e0f0716ab1a7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-120]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=4,
            op=[[LIFE_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 라이프가 4장 이상인 경우, 상대의 라이프 위에서 1장까지를 트래시로 보낸다.]],
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
    rules_id=[[OP03-120]],
    schema_version=1,
  })
end
