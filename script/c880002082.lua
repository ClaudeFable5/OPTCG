-- AUTO-GENERATED: ST16-005 / 몽키 D. 루피
-- rules_id=ST16-005 script_id=880002082 fingerprint=db20c2f1cb0c25d3bb807bdc2436ac040a8715f55ff72f58b846550a9fc48458
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST16-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              name=[[우타]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 「우타」가 레스트 상태인 경우, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST16-005]],
    schema_version=1,
  })
end
