-- AUTO-GENERATED: ST01-013 / 롤로노아 조로
-- rules_id=ST01-013 script_id=880001724 fingerprint=804f662898711cecd321da0abac290671845c3f928330546f2a0e9adf0d4fd8e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-013]],
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
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!x1】이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-013]],
    schema_version=1,
  })
end
