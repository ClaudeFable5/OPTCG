-- AUTO-GENERATED: OP11-005 / 스모커
-- rules_id=OP11-005 script_id=880001339 fingerprint=29c4e2040747bc2714850063d51a5a2c12148a70e87e28a816c0198c5a3f513b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[CHARACTER_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source_filter={
              attribute_neq=[[SPECIAL]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터는 <특수> 속성을 가지지 않은 캐릭터의 효과로는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-005]],
    schema_version=1,
  })
end
