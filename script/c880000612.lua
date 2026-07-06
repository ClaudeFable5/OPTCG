-- AUTO-GENERATED: OP05-001 / 사보
-- rules_id=OP05-001 script_id=880000612 fingerprint=223dfd1f75f766933b2c545097c86676edbe05f9d2c7f4164b6f5b7ff9653182
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[ANY]],
            replacement_costs={
              {
                amount=-1000,
                duration=[[THIS_TURN]],
                op=[[MODIFY_OWN_POWER]],
                selector={
                  count=1,
                  kind=[[EVENT_TARGET]],
                  mode=[[EXACT]],
                  owner=[[CONTEXT]],
                },
              },
            },
            selector={
              count=0,
              filter={
                power_gte=5000,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【상대의 턴 동안】【턴 1회】자신의 파워 5000 이상인 캐릭터가 KO 당했을 때, 이번 턴 동안, 그 캐릭터는 KO 당하는 대신 파워 -1000 할 수 있다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-001]],
    schema_version=1,
  })
end
