-- AUTO-GENERATED: OP07-069 / 피클스
-- rules_id=OP07-069 script_id=880000924 fingerprint=3ca4da13b3bde69af24b815a4cefedbefffc99ea67c183138fbd4a6c09bdd2dc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=0,
              filter={
                name_neq=[[피클스]],
                trait=[[폭시 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 자신의 「피클스」 이외의 《폭시 해적단》 특징을 가진 캐릭터는 상대의 효과로는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-069]],
    schema_version=1,
  })
end
