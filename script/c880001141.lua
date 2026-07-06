-- AUTO-GENERATED: OP09-045 / 캐버디
-- rules_id=OP09-045 script_id=880001141 fingerprint=e35256be8551a657249e0b4dec7bb9b8f8773488d5b48ed7196d8b9a3e5e8a79
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
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
            filter={
              any={
                {
                  name=[[버기]],
                },
                {
                  name=[[모디]],
                },
              },
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터인 「버기」 또는 「모디」가 있을 경우, 이 캐릭터는 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-045]],
    schema_version=1,
  })
end
