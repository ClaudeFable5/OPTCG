-- AUTO-GENERATED: OP15-069 / 노라
-- rules_id=OP15-069 script_id=880002371 fingerprint=904af7ab17aa1cce4f596bc17ccb161a61258326b3b8e884438a23907f15c1be
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                op=[[RETURN_DON]],
              },
            },
            selector={
              count=1,
              filter={
                base_power_lte=7000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 원래 파워 7000 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 필드의 두웅!! 1장을 두웅!! 덱에 되돌릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-069]],
    schema_version=1,
  })
end
