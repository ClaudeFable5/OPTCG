-- AUTO-GENERATED: OP08-029 / 페콤즈
-- rules_id=OP08-029 script_id=880001005 fingerprint=b365368b90e41d514ca337b9a90ce3f8b00d0033be4cce323019935a250ce528
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[EFFECT]],
            selector={
              count=0,
              filter={
                cost_lte=3,
                name_neq=[[페콤즈]],
                trait=[[밍크족]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[SELF_STATE_IS]],
            state=[[ACTIVE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 액티브 상태인 경우, 「페콤즈」 이외의 자신의 코스트 3 이하인 《밍크족》 특징을 가진 캐릭터는 효과로는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-029]],
    schema_version=1,
  })
end
