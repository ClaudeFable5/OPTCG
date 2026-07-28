-- AUTO-GENERATED: OP15-006 / 캐번디시
-- rules_id=OP15-006 script_id=880002308 fingerprint=3f961a6a76d71e2486e73eff321176e2b22b45f2fa41fc60efd8458ad4381c14
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
            count=4,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에 이벤트가 4장 이상 있는 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-006]],
    schema_version=1,
  })
end
