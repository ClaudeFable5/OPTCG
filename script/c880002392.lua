-- AUTO-GENERATED: OP15-090 / 페로나
-- rules_id=OP15-090 script_id=880002392 fingerprint=e801546e81df9c29340bf5e141b1e5a6e59f2d1b7497004f6450ddd88f688a8b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-090]],
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
                op=[[TRASH_HAND]],
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
        source_text=[[자신의 원래 파워 7000 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 패 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-090]],
    schema_version=1,
  })
end
