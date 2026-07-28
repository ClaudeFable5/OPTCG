-- AUTO-GENERATED: OP15-079 / 압살롬
-- rules_id=OP15-079 script_id=880002381 fingerprint=8d29826dcfa098869dfb19f70e7ec0e97ca406f67d8447117662dd2e64ba4525
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 트래시에서 《스릴러 바크 해적단》 특징을 가진 카드 1장까지를 패에 넣는다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            effect_timing=[[ON_KO]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】이 카드의 【KO 시】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-079]],
    schema_version=1,
  })
end
