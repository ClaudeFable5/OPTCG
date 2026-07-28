-- AUTO-GENERATED: OP15-013 / 가위
-- rules_id=OP15-013 script_id=880002315 fingerprint=e833f4f2c573cc110434f170697c4f1cb25e8d19e09011afea7340a4299aa2b2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            conditions={
              {
                count=0,
                op=[[LEADER_POWER_LTE]],
                player=[[YOU]],
              },
            },
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_HAND_COST]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는 자신의 리더가 파워 0 이하인 경우, 코스트 -2.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-013]],
    schema_version=1,
  })
end
