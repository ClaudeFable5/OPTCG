-- AUTO-GENERATED: OP15-105 / 쥬얼리 보니
-- rules_id=OP15-105 script_id=880002407 fingerprint=a1abd6b41bb911da8f16b08f36a744c31365d297084b6037742ae6e637ac2028
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-105]],
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
                op=[[TAKE_LIFE_TO_HAND]],
                position=[[TOP]],
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
        source_text=[[자신의 원래 파워 7000 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 라이프 위에서 1장을 패에 넣을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-105]],
    schema_version=1,
  })
end
