-- AUTO-GENERATED: OP03-032 / 버기
-- rules_id=OP03-032 script_id=880000398 fingerprint=785bd3fafe8cd7434ae3a1f2a4a406b073b660000553e8dfb69f5aafdbddd498
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_filter={
              attribute=[[SLASH]],
            },
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터는 <참격> 속성을 가진 카드와의 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-032]],
    schema_version=1,
  })
end
