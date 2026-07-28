-- AUTO-GENERATED: OP15-035 / 라분
-- rules_id=OP15-035 script_id=880002337 fingerprint=4109e55120780cbcafe502196e837498272670e7a65327a2e7ce74ab6bef9176
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-035]],
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
                count=2,
                op=[[REST_OWN_CARD]],
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
        source_text=[[자신의 원래 파워 7000 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 카드 2장을 레스트로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-035]],
    schema_version=1,
  })
end
