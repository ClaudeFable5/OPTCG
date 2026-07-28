-- AUTO-GENERATED: OP15-052 / 레오
-- rules_id=OP15-052 script_id=880002354 fingerprint=bea7928699e39c269d32211a5be93cc0168de805374b3716191086770b80aac2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-052]],
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
                op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
                selector={
                  count=1,
                  kind=[[CHARACTER]],
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
        source_text=[[자신의 원래 파워 7000 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 캐릭터 1장을 주인의 덱 맨 아래에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-052]],
    schema_version=1,
  })
end
