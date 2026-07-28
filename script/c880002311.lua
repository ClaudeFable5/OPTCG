-- AUTO-GENERATED: OP15-009 / 코비
-- rules_id=OP15-009 script_id=880002311 fingerprint=eb45de3e05fd6571719bbbb3ffac4da0df6bb5e0bab2655889c43db8fb55e883
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_actions={
              {
                amount=-2000,
                duration=[[THIS_TURN]],
                op=[[MODIFY_POWER]],
                selector={
                  count=1,
                  kind=[[LEADER]],
                  mode=[[EXACT]],
                  owner=[[YOU]],
                },
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
        source_text=[[자신의 원래 파워 7000 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 리더를 이번 턴 동안 파워 -2000 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-009]],
    schema_version=1,
  })
end
